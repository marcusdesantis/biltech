using backend_api_core.Interfaces;
using backend_api_core.Models;
using backend_api_core.Utils;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_api_core.Data
{
    public class ProdottoData : IProdotto
    {
        private readonly IC_conexion _c_conexion;

        public ProdottoData(IC_conexion c_conexion)
        {
            this._c_conexion = c_conexion;
        }

        public async Task<RespuestaDB> Delete(int id)
        {
            try
            {
                RespuestaDB respuesta = null;
                string nombreFuncion = "sp_abm_prodotto";

                respuesta = await this._c_conexion.abmObjeto<Prodotto>(nombreFuncion, AbmAccion.ELIMINAR_BAJA, new Prodotto { id = id });

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<Prodotto> FindById(int id)
        {
            try
            {
                Prodotto datos = new Prodotto();
                string nombreFuncion = "sp_get_prodotto";

                Hashtable parametros = new Hashtable();
                parametros.Add("id", id);

                datos = await this._c_conexion.traerObjeto<Prodotto>(nombreFuncion, parametros);

                return datos;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<RespuestaDB> Modify(Prodotto data)
        {
            try
            {
                RespuestaDB respuesta = new RespuestaDB();
                string nombreFuncion = "sp_abm_prodotto";

                respuesta = await this._c_conexion.abmObjeto<Prodotto>(nombreFuncion, AbmAccion.MODIFICAR, data);

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<RespuestaDB> Save(Prodotto data)
        {
            try
            {
                RespuestaDB respuesta = new RespuestaDB();
                string nombreFuncion = "sp_abm_prodotto";

                data.id = data.id== null ? 0 : data.id;

                Hashtable parametros = new Hashtable();
                parametros.Add("action", AbmAccion.GUARDAR);
                parametros.Add("Id", data.id);
                parametros.Add("Nome", data.Nome);
                
                respuesta = await this._c_conexion.abmObjeto<Prodotto>(nombreFuncion, AbmAccion.GUARDAR, data);

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<IEnumerable<ProdottoList>> SearchList(string value, string parameter, int currentPageNumber, int amountShow)
        {
            try
            {
                IEnumerable<ProdottoList> arrayDatos = new ProdottoList[] { };
                string nombreFuncion = "sp_list_prodotto";

                Hashtable parametros = new Hashtable();
                parametros.Add("bus_value", value == null ? "" : value);
                parametros.Add("bus_parameter", parameter);
                parametros.Add("currentPageNumber", currentPageNumber);
                parametros.Add("amountShow", amountShow);

                arrayDatos = await this._c_conexion.traerArrayObjeto<ProdottoList>(nombreFuncion, parametros);

                return arrayDatos;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
