using backend_api_core.Interfaces;
using backend_api_core.Models;
using backend_api_core.Utils;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_api_core.Data
{
    public class UnitamisuraData : IUnitamisura
    {
        private readonly IC_conexion _c_conexion;

        public UnitamisuraData(IC_conexion c_conexion)
        {
            this._c_conexion = c_conexion;
        }

        public async Task<RespuestaDB> Delete(int id)
        {
            try
            {
                RespuestaDB respuesta = null;
                string nombreFuncion = "sp_abm_unitamisura";

                respuesta = await this._c_conexion.abmObjeto<Unitamisura>(nombreFuncion, AbmAccion.ELIMINAR_BAJA, new Unitamisura { Id_UnitaMisura = id });

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<Unitamisura> FindById(int id)
        {
            try
            {
                Unitamisura datos = new Unitamisura();
                string nombreFuncion = "sp_get_unitamisura";

                Hashtable parametros = new Hashtable();
                parametros.Add("Id", id);

                datos = await this._c_conexion.traerObjeto<Unitamisura>(nombreFuncion, parametros);

                return datos;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<RespuestaDB> Modify(Unitamisura data)
        {
            try
            {
                RespuestaDB respuesta = new RespuestaDB();
                string nombreFuncion = "sp_abm_unitamisura";

                respuesta = await this._c_conexion.abmObjeto<Unitamisura>(nombreFuncion, AbmAccion.MODIFICAR, data);

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<RespuestaDB> Save(Unitamisura data)
        {
            try
            {
                RespuestaDB respuesta = new RespuestaDB();
                string nombreFuncion = "sp_abm_unitamisura";

                data.Id_UnitaMisura = data.Id_UnitaMisura == null ? 0 : data.Id_UnitaMisura;

                Hashtable parametros = new Hashtable();
                parametros.Add("action", AbmAccion.GUARDAR);
                parametros.Add("Id_UnitaMisura", data.Id_UnitaMisura);
                parametros.Add("Nome", data.Nome);


                respuesta = await this._c_conexion.abmObjeto<Unitamisura>(nombreFuncion, AbmAccion.GUARDAR, data);

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<IEnumerable<UnitamisuraList>> SearchList(string value, string parameter, int currentPageNumber, int amountShow)
        {
            try
            {
                IEnumerable<UnitamisuraList> arrayDatos = new UnitamisuraList[] { };
                string nombreFuncion = "sp_list_unitamisura";

                Hashtable parametros = new Hashtable();
                parametros.Add("bus_value", value == null ? "" : value);
                parametros.Add("bus_parameter", parameter);
                parametros.Add("currentPageNumber", currentPageNumber);
                parametros.Add("amountShow", amountShow);

                arrayDatos = await this._c_conexion.traerArrayObjeto<UnitamisuraList>(nombreFuncion, parametros);

                return arrayDatos;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
