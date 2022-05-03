using backend_api_core.Interfaces;
using backend_api_core.Models;
using backend_api_core.Utils;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_api_core.Data
{
    public class VerificaMisurazioneData : IVerificaMisurazione
    {
        private readonly IC_conexion _c_conexion;

        public VerificaMisurazioneData(IC_conexion c_conexion)
        {
            this._c_conexion = c_conexion;
        }

        public async Task<RespuestaDB> Delete(int id)
        {
            try
            {
                RespuestaDB respuesta = null;
                string nombreFuncion = "sp_abm_verificamisurazione";

                respuesta = await this._c_conexion.abmObjeto<VerificaMisurazione>(nombreFuncion, AbmAccion.ELIMINAR_BAJA, new VerificaMisurazione { id = id });

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<VerificaMisurazione> FindById(int id)
        {
            try
            {
                VerificaMisurazione datos = new VerificaMisurazione();
                string nombreFuncion = "sp_get_verificamisurazione";

                Hashtable parametros = new Hashtable();
                parametros.Add("Id", id);

                datos = await this._c_conexion.traerObjeto<VerificaMisurazione>(nombreFuncion, parametros);

                return datos;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<RespuestaDB> Modify(VerificaMisurazione data)
        {
            try
            {
                RespuestaDB respuesta = new RespuestaDB();
                string nombreFuncion = "sp_abm_verificamisurazione";

                respuesta = await this._c_conexion.abmObjeto<VerificaMisurazione>(nombreFuncion, AbmAccion.MODIFICAR, data);

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<RespuestaDB> Save(VerificaMisurazione data)
        {
            try
            {
                RespuestaDB respuesta = new RespuestaDB();
                string nombreFuncion = "sp_abm_verificamisurazione";

                data.id = data.id == null ? 0 : data.id;

                Hashtable parametros = new Hashtable();
                parametros.Add("action", AbmAccion.GUARDAR);
                parametros.Add("id", data.id);
                parametros.Add("id_Misurazione", data.id_Misurazione);

                respuesta = await this._c_conexion.abmObjeto<VerificaMisurazione>(nombreFuncion, AbmAccion.GUARDAR, data);

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<IEnumerable<VerificaMisurazioneList>> SearchList(string value, string parameter, int currentPageNumber, int amountShow)
        {
            try
            {
                IEnumerable<VerificaMisurazioneList> arrayDatos = new VerificaMisurazioneList[] { };
                string nombreFuncion = "sp_list_verificamisurazione";

                Hashtable parametros = new Hashtable();
                parametros.Add("bus_value", value == null ? "" : value);
                parametros.Add("bus_parameter", parameter);
                parametros.Add("currentPageNumber", currentPageNumber);
                parametros.Add("amountShow", amountShow);

                arrayDatos = await this._c_conexion.traerArrayObjeto<VerificaMisurazioneList>(nombreFuncion, parametros);

                return arrayDatos;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
