using backend_api_core.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using System.Collections.Generic;
using backend_api_core.Models;
using System.Linq;
using System;
using System.Transactions;

namespace backend_api_core.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ImpiantoBilanciaController : ControllerBase
    {
        private readonly IImpiantoBilancia _impiantoBilancia;

        public ImpiantoBilanciaController(IImpiantoBilancia impiantoBilancia)
        {
            this._impiantoBilancia = impiantoBilancia;
        }

        // GET: api/ImpiantoBilancia
        [HttpGet]
        public async Task<ActionResult<IEnumerable<RespuestaCore>>> Get(string value, string parameter, int currentPageNumber, int amountShow)
        {
            RespuestaCore respuesta = new RespuestaCore();
            IEnumerable<ImpiantoBilanciaList> _arrayLista = new ImpiantoBilanciaList[] { };
            int elementosTotales = 0;

            try
            {
                _arrayLista = await this._impiantoBilancia.SearchList(value, parameter, currentPageNumber, amountShow);

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

        // GET: api/ImpiantoBilancia/5
        [HttpGet("{id}")]
        public async Task<ActionResult<RespuestaCore>> Get(int id)
        {
            RespuestaCore respuesta = new RespuestaCore();
            ImpiantoBilancia datos = new ImpiantoBilancia { };

            try
            {
                datos = await this._impiantoBilancia.FindById(id);

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

        // POST: api/ImpiantoBilancia
        [HttpPost]
        public async Task<ActionResult<object>> Post([FromBody] ImpiantoBilancia data)
        {
            RespuestaCore respuesta = new RespuestaCore();
            RespuestaDB respuestaBD = new RespuestaDB();
            try
            {
              
                using (TransactionScope transaction = new TransactionScope(TransactionScopeAsyncFlowOption.Enabled))
                {
                    respuestaBD = await this._impiantoBilancia.Save(data);
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

        // PUT api/ImpiantoBilancia (MODIFICAR)
        [HttpPut]
        public async Task<ActionResult<object>> Put([FromBody] ImpiantoBilancia data)
        {
            RespuestaCore respuesta = new RespuestaCore();
            RespuestaDB respuestaBD = new RespuestaDB();

            try
            {
                using (TransactionScope transaction = new TransactionScope(TransactionScopeAsyncFlowOption.Enabled))
                {
                    respuestaBD = await this._impiantoBilancia.Modify(data);
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

        // DELETE: api/ImpiantoBilancia/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<RespuestaDB>> Delete(int id)
        {
            RespuestaCore respuesta = new RespuestaCore();
            RespuestaDB respuestaBD = new RespuestaDB();

            try
            {
                using (TransactionScope transaction = new TransactionScope(TransactionScopeAsyncFlowOption.Enabled))
                {
                    respuestaBD = await this._impiantoBilancia.Delete(id);
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
