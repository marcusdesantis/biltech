using backend_api_core.Interfaces;
using backend_api_core.Models;
using backend_api_core.Utils;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_api_core.Data
{
    public class ModuloData : IModulo
    {
        private readonly IC_conexion _c_conexion;

        public ModuloData(IC_conexion c_conexion)
        {
            this._c_conexion = c_conexion;
        }

        public async Task<RespuestaDB> Delete(int id)
        {
            try
            {
                RespuestaDB respuesta = null;
                string nombreFuncion = "sp_abm_modulo";

                respuesta = await this._c_conexion.abmObjeto<Modulo>(nombreFuncion, AbmAccion.ELIMINAR_BAJA, new Modulo { id = id });

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<Modulo> FindById(int id)
        {
            try
            {
                Modulo datos = new Modulo();
                string nombreFuncion = "sp_get_modulo";

                Hashtable parametros = new Hashtable();
                parametros.Add("id", id);

                datos = await this._c_conexion.traerObjeto<Modulo>(nombreFuncion, parametros);

                return datos;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<RespuestaDB> Modify(Modulo data)
        {
            try
            {
                RespuestaDB respuesta = new RespuestaDB();
                string nombreFuncion = "sp_abm_modulo";

                respuesta = await this._c_conexion.abmObjeto<Modulo>(nombreFuncion, AbmAccion.MODIFICAR, data);

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<RespuestaDB> Save(Modulo data)
        {
            try
            {
                RespuestaDB respuesta = new RespuestaDB();
                string nombreFuncion = "sp_abm_modulo";

                data.id = data.id== null ? 0 : data.id;

                Hashtable parametros = new Hashtable();
                parametros.Add("action", AbmAccion.GUARDAR);
                parametros.Add("id", data.id);
                parametros.Add("Nome", data.Nome);
                
                respuesta = await this._c_conexion.abmObjeto<Modulo>(nombreFuncion, AbmAccion.GUARDAR, data);

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<IEnumerable<ModuloList>> SearchList(string value, string parameter, int currentPageNumber, int amountShow)
        {
            try
            {
                IEnumerable<ModuloList> arrayDatos = new ModuloList[] { };
                string nombreFuncion = "sp_list_modulo";

                Hashtable parametros = new Hashtable();
                parametros.Add("bus_value", value == null ? "" : value);
                parametros.Add("bus_parameter", parameter);
                parametros.Add("currentPageNumber", currentPageNumber);
                parametros.Add("amountShow", amountShow);

                arrayDatos = await this._c_conexion.traerArrayObjeto<ModuloList>(nombreFuncion, parametros);

                return arrayDatos;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
