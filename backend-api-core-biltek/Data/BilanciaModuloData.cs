using backend_api_core.Interfaces;
using backend_api_core.Models;
using backend_api_core.Utils;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_api_core.Data
{
    public class BilanciaModuloData : IBilanciaModulo
    {
        private readonly IC_conexion _c_conexion;

        public BilanciaModuloData(IC_conexion c_conexion)
        {
            this._c_conexion = c_conexion;
        }

        public async Task<RespuestaDB> Delete(int id)
        {
            try
            {
                RespuestaDB respuesta = null;
                string nombreFuncion = "sp_abm_bilanciamodulo";

                respuesta = await this._c_conexion.abmObjeto<BilanciaModulo>(nombreFuncion, AbmAccion.ELIMINAR_BAJA, new BilanciaModulo { id = id });

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<BilanciaModulo> FindById(int id)
        {
            try
            {
                BilanciaModulo datos = new BilanciaModulo();
                string nombreFuncion = "sp_get_bilancia_modulo";

                Hashtable parametros = new Hashtable();
                parametros.Add("id", id);

                datos = await this._c_conexion.traerObjeto<BilanciaModulo>(nombreFuncion, parametros);

                return datos;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<RespuestaDB> Modify(BilanciaModulo data)
        {
            try
            {
                RespuestaDB respuesta = new RespuestaDB();
                string nombreFuncion = "sp_abm_bilanciamodulo";

                respuesta = await this._c_conexion.abmObjeto<BilanciaModulo>(nombreFuncion, AbmAccion.MODIFICAR, data);

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<RespuestaDB> Save(BilanciaModulo data)
        {
            try
            {
                RespuestaDB respuesta = new RespuestaDB();
                string nombreFuncion = "sp_abm_bilanciamodulo";

                data.id = data.id== null ? 0 : data.id;

                Hashtable parametros = new Hashtable();
                parametros.Add("action", AbmAccion.GUARDAR);
                parametros.Add("id", data.id);
                parametros.Add("Id_Bilancia", data.Id_Bilancia);
                parametros.Add("Id_Modulo", data.Id_Modulo);


                respuesta = await this._c_conexion.abmObjeto<BilanciaModulo>(nombreFuncion, AbmAccion.GUARDAR, data);

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<IEnumerable<BilanciaModuloList>> SearchList(string value, string parameter, int currentPageNumber, int amountShow)
        {
            try
            {
                IEnumerable<BilanciaModuloList> arrayDatos = new BilanciaModuloList[] { };
                string nombreFuncion = "sp_list_bilancia_modulo";

                Hashtable parametros = new Hashtable();
                parametros.Add("bus_value", value == null ? "" : value);
                parametros.Add("bus_parameter", parameter);
                parametros.Add("currentPageNumber", currentPageNumber);
                parametros.Add("amountShow", amountShow);

                arrayDatos = await this._c_conexion.traerArrayObjeto<BilanciaModuloList>(nombreFuncion, parametros);

                return arrayDatos;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
