using backend_api_core.Interfaces;
using backend_api_core.Models;
using backend_api_core.Utils;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_api_core.Data
{
    public class ControlloSchedulatoreData : IControlloSchedulatore
    {
        private readonly IC_conexion _c_conexion;

        public ControlloSchedulatoreData(IC_conexion c_conexion)
        {
            this._c_conexion = c_conexion;
        }

        public async Task<RespuestaDB> Delete(int id)
        {
            try
            {
                RespuestaDB respuesta = null;
                string nombreFuncion = "sp_abm_controlloschedulatore";

                respuesta = await this._c_conexion.abmObjeto<ControlloSchedulatore>(nombreFuncion, AbmAccion.ELIMINAR_BAJA, new ControlloSchedulatore { Id = id });

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<ControlloSchedulatore> FindById(int id)
        {
            try
            {
                ControlloSchedulatore datos = new ControlloSchedulatore();
                string nombreFuncion = "sp_get_controlloschedulatore";

                Hashtable parametros = new Hashtable();
                parametros.Add("Id", id);

                datos = await this._c_conexion.traerObjeto<ControlloSchedulatore>(nombreFuncion, parametros);

                return datos;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<RespuestaDB> Modify(ControlloSchedulatore data)
        {
            try
            {
                RespuestaDB respuesta = new RespuestaDB();
                string nombreFuncion = "sp_abm_controlloschedulatore";

                respuesta = await this._c_conexion.abmObjeto<ControlloSchedulatore>(nombreFuncion, AbmAccion.MODIFICAR, data);

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<RespuestaDB> Save(ControlloSchedulatore data)
        {
            try
            {
                RespuestaDB respuesta = new RespuestaDB();
                string nombreFuncion = "sp_abm_controlloschedulatore";

                data.Id = data.Id == null ? 0 : data.Id;

                Hashtable parametros = new Hashtable();
                parametros.Add("action", AbmAccion.GUARDAR);
                parametros.Add("Id", data.Id);
                parametros.Add("Id_Prodotto", data.Id_Prodotto);
                parametros.Add("NumeroControllo", data.NumeroControllo);
                parametros.Add("Ora", data.Ora);


                respuesta = await this._c_conexion.abmObjeto<ControlloSchedulatore>(nombreFuncion, AbmAccion.GUARDAR, data);

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<IEnumerable<ControlloSchedulatoreList>> SearchList(string value, string parameter, int currentPageNumber, int amountShow)
        {
            try
            {
                IEnumerable<ControlloSchedulatoreList> arrayDatos = new ControlloSchedulatoreList[] { };
                string nombreFuncion = "sp_list_controllo_schedulatore";

                Hashtable parametros = new Hashtable();
                parametros.Add("bus_value", value == null ? "" : value);
                parametros.Add("bus_parameter", parameter);
                parametros.Add("currentPageNumber", currentPageNumber);
                parametros.Add("amountShow", amountShow);

                arrayDatos = await this._c_conexion.traerArrayObjeto<ControlloSchedulatoreList>(nombreFuncion, parametros);

                return arrayDatos;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
