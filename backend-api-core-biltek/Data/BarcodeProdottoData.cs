using backend_api_core.Interfaces;
using backend_api_core.Models;
using backend_api_core.Utils;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_api_core.Data
{
    public class BarcodeProdottoData : IBarcodeProdotto
    {
        private readonly IC_conexion _c_conexion;

        public BarcodeProdottoData(IC_conexion c_conexion)
        {
            this._c_conexion = c_conexion;
        }

        public async Task<RespuestaDB> Delete(int id)
        {
            try
            {
                RespuestaDB respuesta = null;
                string nombreFuncion = "sp_abm_barcodeprodotto";

                respuesta = await this._c_conexion.abmObjeto<BarcodeProdotto>(nombreFuncion, AbmAccion.ELIMINAR_BAJA, new BarcodeProdotto { Id_BarcodeProdotto = id });

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<BarcodeProdotto> FindById(int id)
        {
            try
            {
                BarcodeProdotto datos = new BarcodeProdotto();
                string nombreFuncion = "sp_get_barcodeprodotto";

                Hashtable parametros = new Hashtable();
                parametros.Add("Id", id);

                datos = await this._c_conexion.traerObjeto<BarcodeProdotto>(nombreFuncion, parametros);

                return datos;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<RespuestaDB> Modify(BarcodeProdotto data)
        {
            try
            {
                RespuestaDB respuesta = new RespuestaDB();
                string nombreFuncion = "sp_abm_barcodeprodotto";

                respuesta = await this._c_conexion.abmObjeto<BarcodeProdotto>(nombreFuncion, AbmAccion.MODIFICAR, data);

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<RespuestaDB> Save(BarcodeProdotto data)
        {
            try
            {
                RespuestaDB respuesta = new RespuestaDB();
                string nombreFuncion = "sp_abm_barcodeprodotto";

                data.Id_BarcodeProdotto = data.Id_BarcodeProdotto == null ? 0 : data.Id_BarcodeProdotto;

                Hashtable parametros = new Hashtable();
                parametros.Add("action", AbmAccion.GUARDAR);
                parametros.Add("Id_BarcodeProdotto", data.Id_BarcodeProdotto);
                parametros.Add("Barcode", data.Barcode);
                parametros.Add("Id_Prodotto", data.Id_Prodotto);


                respuesta = await this._c_conexion.abmObjeto<BarcodeProdotto>(nombreFuncion, AbmAccion.GUARDAR, data);

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<IEnumerable<BarcodeProdottoList>> SearchList(string value, string parameter, int currentPageNumber, int amountShow)
        {
            try
            {
                IEnumerable<BarcodeProdottoList> arrayDatos = new BarcodeProdottoList[] { };
                string nombreFuncion = "sp_list_barcode_prodotto";

                Hashtable parametros = new Hashtable();
                parametros.Add("bus_value", value == null ? "" : value);
                parametros.Add("bus_parameter", parameter);
                parametros.Add("currentPageNumber", currentPageNumber);
                parametros.Add("amountShow", amountShow);

                arrayDatos = await this._c_conexion.traerArrayObjeto<BarcodeProdottoList>(nombreFuncion, parametros);

                return arrayDatos;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
