using backend_api_core.Interfaces;
using backend_api_core.Models;
using backend_api_core.Utils;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_api_core.Data
{
    public class MisurazioneData : IMisurazione
    {
        private readonly IC_conexion _c_conexion;

        public MisurazioneData(IC_conexion c_conexion)
        {
            this._c_conexion = c_conexion;
        }

        public async Task<RespuestaDB> Delete(int id)
        {
            try
            {
                RespuestaDB respuesta = null;
                string nombreFuncion = "sp_abm_misurazione";

                respuesta = await this._c_conexion.abmObjeto<Misurazione>(nombreFuncion, AbmAccion.ELIMINAR_BAJA, new Misurazione { id = id });

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<Misurazione> FindById(int id)
        {
            try
            {
                Misurazione datos = new Misurazione();
                string nombreFuncion = "sp_get_misurazione";

                Hashtable parametros = new Hashtable();
                parametros.Add("id", id);

                datos = await this._c_conexion.traerObjeto<Misurazione>(nombreFuncion, parametros);

                return datos;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<RespuestaDB> Modify(Misurazione data)
        {
            try
            {
                RespuestaDB respuesta = new RespuestaDB();
                string nombreFuncion = "sp_abm_misurazione";

                respuesta = await this._c_conexion.abmObjeto<Misurazione>(nombreFuncion, AbmAccion.MODIFICAR, data);

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<RespuestaDB> Save(Misurazione data)
        {
            try
            {
                RespuestaDB respuesta = new RespuestaDB();
                string nombreFuncion = "sp_abm_misurazione";

                data.id = data.id== null ? 0 : data.id;

                Hashtable parametros = new Hashtable();
                parametros.Add("action", AbmAccion.GUARDAR);
                parametros.Add("id", data.id);
                parametros.Add("id_bilancia", data.id_bilancia);
                parametros.Add("id_prodotto", data.id_prodotto);
                parametros.Add("peso", data.peso);
                parametros.Add("id_FormulaProdotto", data.id_FormulaProdotto);

                respuesta = await this._c_conexion.abmObjeto<Misurazione>(nombreFuncion, AbmAccion.GUARDAR, data);

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<IEnumerable<MisurazioneList>> SearchList(string value, string parameter, int currentPageNumber, int amountShow)
        {
            try
            {
                IEnumerable<MisurazioneList> arrayDatos = new MisurazioneList[] { };
                string nombreFuncion = "sp_list_misurazione";

                Hashtable parametros = new Hashtable();
                parametros.Add("bus_value", value == null ? "" : value);
                parametros.Add("bus_parameter", parameter);
                parametros.Add("currentPageNumber", currentPageNumber);
                parametros.Add("amountShow", amountShow);

                arrayDatos = await this._c_conexion.traerArrayObjeto<MisurazioneList>(nombreFuncion, parametros);

                return arrayDatos;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
