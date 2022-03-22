using backend_api_core.Interfaces;
using backend_api_core.Models;
using backend_api_core.Utils;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_api_core.Data
{
    public class TipologiaProdottoData : ITipologiaProdotto
    {
        private readonly IC_conexion _c_conexion;

        public TipologiaProdottoData(IC_conexion c_conexion)
        {
            this._c_conexion = c_conexion;
        }

        public async Task<RespuestaDB> Delete(int id)
        {
            try
            {
                RespuestaDB respuesta = null;
                string nombreFuncion = "sp_abm_tipologiaprodotto";

                respuesta = await this._c_conexion.abmObjeto<TipologiaProdotto>(nombreFuncion, AbmAccion.ELIMINAR_BAJA, new TipologiaProdotto { Id_TipologiaProdotto = id });

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<TipologiaProdotto> FindById(int id)
        {
            try
            {
                TipologiaProdotto datos = new TipologiaProdotto();
                string nombreFuncion = "sp_get_tipologiaprodotto";

                Hashtable parametros = new Hashtable();
                parametros.Add("Id", id);

                datos = await this._c_conexion.traerObjeto<TipologiaProdotto>(nombreFuncion, parametros);

                return datos;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<RespuestaDB> Modify(TipologiaProdotto data)
        {
            try
            {
                RespuestaDB respuesta = new RespuestaDB();
                string nombreFuncion = "sp_abm_tipologiaprodotto";

                respuesta = await this._c_conexion.abmObjeto<TipologiaProdotto>(nombreFuncion, AbmAccion.MODIFICAR, data);

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<RespuestaDB> Save(TipologiaProdotto data)
        {
            try
            {
                RespuestaDB respuesta = new RespuestaDB();
                string nombreFuncion = "sp_abm_tipologiaprodotto";

                data.Id_TipologiaProdotto = data.Id_TipologiaProdotto == null ? 0 : data.Id_TipologiaProdotto;

                Hashtable parametros = new Hashtable();
                parametros.Add("action", AbmAccion.GUARDAR);
                parametros.Add("Id_TipologiaProdotto", data.Id_TipologiaProdotto);
                parametros.Add("Nome", data.Nome);
             

                respuesta = await this._c_conexion.abmObjeto<TipologiaProdotto>(nombreFuncion, AbmAccion.GUARDAR, data);

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<IEnumerable<TipologiaProdottoList>> SearchList(string value, string parameter, int currentPageNumber, int amountShow)
        {
            try
            {
                IEnumerable<TipologiaProdottoList> arrayDatos = new TipologiaProdottoList[] { };
                string nombreFuncion = "sp_list_tipologia_prodotto";

                Hashtable parametros = new Hashtable();
                parametros.Add("bus_value", value == null ? "" : value);
                parametros.Add("bus_parameter", parameter);
                parametros.Add("currentPageNumber", currentPageNumber);
                parametros.Add("amountShow", amountShow);

                arrayDatos = await this._c_conexion.traerArrayObjeto<TipologiaProdottoList>(nombreFuncion, parametros);

                return arrayDatos;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
