using backend_api_core.Interfaces;
using backend_api_core.Models;
using backend_api_core.Utils;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_api_core.Data
{
    public class LottoData : ILotto
    {
        private readonly IC_conexion _c_conexion;

        public LottoData(IC_conexion c_conexion)
        {
            this._c_conexion = c_conexion;
        }

        public async Task<RespuestaDB> Delete(int id)
        {
            try
            {
                RespuestaDB respuesta = null;
                string nombreFuncion = "sp_abm_lotto";

                respuesta = await this._c_conexion.abmObjeto<Lotto>(nombreFuncion, AbmAccion.ELIMINAR_BAJA, new Lotto { Id = id });

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<Lotto> FindById(int id)
        {
            try
            {
                Lotto datos = new Lotto();
                string nombreFuncion = "sp_get_lotto";

                Hashtable parametros = new Hashtable();
                parametros.Add("Id", id);

                datos = await this._c_conexion.traerObjeto<Lotto>(nombreFuncion, parametros);

                return datos;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<RespuestaDB> Modify(Lotto data)
        {
            try
            {
                RespuestaDB respuesta = new RespuestaDB();
                string nombreFuncion = "sp_abm_lotto";

                respuesta = await this._c_conexion.abmObjeto<Lotto>(nombreFuncion, AbmAccion.MODIFICAR, data);

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<RespuestaDB> Save(Lotto data)
        {
            try
            {
                RespuestaDB respuesta = new RespuestaDB();
                string nombreFuncion = "sp_abm_lotto";

                data.Id = data.Id == null ? 0 : data.Id;

                Hashtable parametros = new Hashtable();
                parametros.Add("action", AbmAccion.GUARDAR);
                parametros.Add("Id", data.Id);
                parametros.Add("Id_Prodotto", data.Id_Prodotto);
                parametros.Add("CodiceLotto", data.CodiceLotto);
                parametros.Add("SogliaMinima", data.SogliaMinima);
                parametros.Add("SogliaMassima", data.SogliaMassima);
                parametros.Add("Tolleranza", data.Tolleranza);
                parametros.Add("PesoStandard", data.PesoStandard);


                respuesta = await this._c_conexion.abmObjeto<Lotto>(nombreFuncion, AbmAccion.GUARDAR, data);

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<IEnumerable<LottoList>> SearchList(string value, string parameter, int currentPageNumber, int amountShow)
        {
            try
            {
                IEnumerable<LottoList> arrayDatos = new LottoList[] { };
                string nombreFuncion = "sp_list_lotto";

                Hashtable parametros = new Hashtable();
                parametros.Add("bus_value", value == null ? "" : value);
                parametros.Add("bus_parameter", parameter);
                parametros.Add("currentPageNumber", currentPageNumber);
                parametros.Add("amountShow", amountShow);

                arrayDatos = await this._c_conexion.traerArrayObjeto<LottoList>(nombreFuncion, parametros);

                return arrayDatos;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
