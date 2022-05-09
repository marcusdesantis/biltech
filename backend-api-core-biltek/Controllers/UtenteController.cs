using backend_api_core.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using System.Collections.Generic;
using backend_api_core.Models;
using System.Linq;
using System;
using System.Transactions;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using Microsoft.Extensions.Configuration;
using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;
using backend_api_core.Data;
using Microsoft.AspNetCore.Hosting;

namespace backend_api_core.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UtenteController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        private readonly IUtente _utente;

        public UtenteController(IConfiguration configuration, IUtente utente)
        {
            this._utente = utente;
            this._configuration = configuration;
        }

        [HttpPost]
        [Route("Authenticate")]
        public async Task<IActionResult> Authenticate(Utente user)
        {
            object respuesta = new object();

            try
            {
                
                bool retVal = await IsValidUserAndPasswordCombination(user);
                if (retVal)
                {

                    respuesta = new
                    {
                        status = "success",
                        response = new
                        {
                            usuario = user.utente,
                            token = GenerateToken(user),
                            nombre_usuario = user.utente,
                            email = user.Email
                        }
                    };
                    return new OkObjectResult(respuesta);
                }
                return BadRequest();
            }
            catch (Exception ex)
            {
                respuesta = new
                {
                    status = "error",
                    response = ex.Message
                };

                return new OkObjectResult(respuesta);
            }
        }
        private async Task<bool> IsValidUserAndPasswordCombination(Utente user)
        {
            var result = await this._utente.isAuthenticate( user);
            user = _utente.Utente;
            return result;
        }

        private string GenerateToken(Utente user)
        {
            var claims = new Claim[]
            {
                new Claim(ClaimTypes.Name, user.utente),
                new Claim(ClaimTypes.NameIdentifier, user.Id.ToString()),
                new Claim(JwtRegisteredClaimNames.Nbf, new DateTimeOffset(DateTime.Now).ToUnixTimeSeconds().ToString()),
                new Claim(JwtRegisteredClaimNames.Exp, new DateTimeOffset(DateTime.Now.AddDays(1)).ToUnixTimeSeconds().ToString()),
            };

            // Generamos el Token
            var token = new JwtSecurityToken
            (
                issuer: _configuration["ApiAuth:Issuer"],
                audience: _configuration["ApiAuth:Audience"],
                claims: claims,
                expires: DateTime.UtcNow.AddHours(1),
                notBefore: DateTime.UtcNow,
                signingCredentials: new SigningCredentials(new SymmetricSecurityKey(System.Text.Encoding.UTF8.GetBytes(_configuration["ApiAuth:SecretKey"])),
                        SecurityAlgorithms.HmacSha256)
            );


            return new JwtSecurityTokenHandler().WriteToken(token);
        }

        // GET: api/Modello
        [HttpGet]
        public async Task<ActionResult<IEnumerable<RespuestaCore>>> Get(string value, string parameter, int currentPageNumber, int amountShow)
        {
            RespuestaCore respuesta = new RespuestaCore();
            IEnumerable<UtenteList> _arrayLista = new UtenteList[] { };
            int elementosTotales = 0;

            try
            {
                _arrayLista = await this._utente.SearchList(value, parameter, currentPageNumber, amountShow);

                if (_arrayLista.Count() > 0)
                {
                    elementosTotales = _arrayLista.ElementAt(0).total;
                }

                respuesta = new RespuestaCore
                {
                    status = "success",
                    response = _arrayLista,
                    total = elementosTotales
                };
                return new OkObjectResult(respuesta);
            }
            catch (Exception ex)
            {
                respuesta = new RespuestaCore
                {
                    status = "error",
                    response = ex.Message
                };

                return new OkObjectResult(respuesta);
            }
        }

        // GET: api/Modello/5
        [HttpGet("{id}")]
        public async Task<ActionResult<RespuestaCore>> Get(int id)
        {
            RespuestaCore respuesta = new RespuestaCore();
            Utente datos = new Utente { };

            try
            {
                datos = await this._utente.FindById(id);

                if (datos == null)
                {
                    respuesta = new RespuestaCore
                    {
                        status = "empty",
                        response = datos
                    };
                    return new OkObjectResult(respuesta);
                }
                else
                {
                    respuesta = new RespuestaCore
                    {
                        status = "success",
                        response = datos
                    };
                    return new OkObjectResult(respuesta);
                }
            }
            catch (Exception ex)
            {
                respuesta = new RespuestaCore
                {
                    status = "error",
                    response = ex.Message
                };

                return new OkObjectResult(respuesta);
            }
        }

        // POST: api/Modello
        [HttpPost]
        public async Task<ActionResult<object>> Post([FromBody] Utente data)
        {
            RespuestaCore respuesta = new RespuestaCore();
            RespuestaDB respuestaBD = new RespuestaDB();
            try
            {

                using (TransactionScope transaction = new TransactionScope(TransactionScopeAsyncFlowOption.Enabled))
                {
                    respuestaBD = await this._utente.Save(data);
                    if (respuestaBD.status == "error")
                    {
                        return new OkObjectResult(respuestaBD);
                    }
                    transaction.Complete();
                }
                return new OkObjectResult(respuestaBD);
            }
            catch (Exception ex)
            {
                respuesta = new RespuestaCore
                {
                    status = "error",
                    response = ex.Message
                };

                return new OkObjectResult(respuesta);
            }
        }

        // PUT api/Modello (MODIFICAR)
        [HttpPut]
        public async Task<ActionResult<object>> Put([FromBody] Utente data)
        {
            RespuestaCore respuesta = new RespuestaCore();
            RespuestaDB respuestaBD = new RespuestaDB();

            try
            {
                using (TransactionScope transaction = new TransactionScope(TransactionScopeAsyncFlowOption.Enabled))
                {
                    respuestaBD = await this._utente.Modify(data);
                    if (respuestaBD.status == "error")
                    {
                        return new OkObjectResult(respuestaBD);
                    }
                    transaction.Complete();
                }
                return new OkObjectResult(respuestaBD);
            }
            catch (Exception ex)
            {
                respuesta = new RespuestaCore
                {
                    status = "error",
                    response = ex.Message
                };

                return new OkObjectResult(respuesta);
            }
        }

        // DELETE: api/Modello/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<RespuestaDB>> Delete(int id)
        {
            RespuestaCore respuesta = new RespuestaCore();
            RespuestaDB respuestaBD = new RespuestaDB();

            try
            {
                using (TransactionScope transaction = new TransactionScope(TransactionScopeAsyncFlowOption.Enabled))
                {
                    respuestaBD = await this._utente.Delete(id);
                    if (respuestaBD.status == "error")
                    {
                        return new OkObjectResult(respuestaBD);
                    }
                    transaction.Complete();
                }
                return new OkObjectResult(respuestaBD);
            }
            catch (Exception ex)
            {
                respuesta = new RespuestaCore
                {
                    status = "error",
                    response = ex.Message
                };

                return new OkObjectResult(respuesta);
            }
        }
    }
}
