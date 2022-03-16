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
    public class ProdottoController : ControllerBase
    {
        private readonly IProdotto _prodotto;

        public ProdottoController(IProdotto prodotto)
        {
            this._prodotto = prodotto;
        }

        // GET: api/Prodotto
        [HttpGet]
        public async Task<ActionResult<IEnumerable<RespuestaCore>>> Get(string value, string parameter, int currentPageNumber, int amountShow)
        {
            RespuestaCore respuesta = new RespuestaCore();
            IEnumerable<ProdottoList> _arrayLista = new ProdottoList[] { };
            int elementosTotales = 0;

            try
            {
                _arrayLista = await this._prodotto.SearchList(value, parameter, currentPageNumber, amountShow);

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

        // GET: api/Prodotto/5
        [HttpGet("{id}")]
        public async Task<ActionResult<RespuestaCore>> Get(int id)
        {
            RespuestaCore respuesta = new RespuestaCore();
            Prodotto datos = new Prodotto { };

            try
            {
                datos = await this._prodotto.FindById(id);

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

        // POST: api/Prodotto
        [HttpPost]
        public async Task<ActionResult<object>> Post([FromBody] Prodotto data)
        {
            RespuestaCore respuesta = new RespuestaCore();
            RespuestaDB respuestaBD = new RespuestaDB();
            try
            {
              
                using (TransactionScope transaction = new TransactionScope(TransactionScopeAsyncFlowOption.Enabled))
                {
                    respuestaBD = await this._prodotto.Save(data);
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

        // PUT api/Prodotto (MODIFICAR)
        [HttpPut]
        public async Task<ActionResult<object>> Put([FromBody] Prodotto data)
        {
            RespuestaCore respuesta = new RespuestaCore();
            RespuestaDB respuestaBD = new RespuestaDB();

            try
            {


                using (TransactionScope transaction = new TransactionScope(TransactionScopeAsyncFlowOption.Enabled))
                {
                    respuestaBD = await this._prodotto.Modify(data);
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

        // DELETE: api/Prodotto/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<RespuestaDB>> Delete(int id)
        {
            RespuestaCore respuesta = new RespuestaCore();
            RespuestaDB respuestaBD = new RespuestaDB();

            try
            {
                using (TransactionScope transaction = new TransactionScope(TransactionScopeAsyncFlowOption.Enabled))
                {
                    respuestaBD = await this._prodotto.Delete(id);
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
