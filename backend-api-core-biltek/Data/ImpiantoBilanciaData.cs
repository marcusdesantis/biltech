using backend_api_core.Interfaces;
using backend_api_core.Models;
using backend_api_core.Utils;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_api_core.Data
{
    public class ImpiantoBilanciaData : IImpiantoBilancia
    {
        private readonly IC_conexion _c_conexion;

        public ImpiantoBilanciaData(IC_conexion c_conexion)
        {
            this._c_conexion = c_conexion;
        }

        public async Task<RespuestaDB> Delete(int id)
        {
            try
            {
                RespuestaDB respuesta = null;
                string nombreFuncion = "sp_abm_impiantobilancia";

                respuesta = await this._c_conexion.abmObjeto<ImpiantoBilancia>(nombreFuncion, AbmAccion.ELIMINAR_BAJA, new ImpiantoBilancia { id = id });

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<ImpiantoBilancia> FindById(int id)
        {
            try
            {
                ImpiantoBilancia datos = new ImpiantoBilancia();
                string nombreFuncion = "sp_get_impiantobilancia";

                Hashtable parametros = new Hashtable();
                parametros.Add("id", id);

                datos = await this._c_conexion.traerObjeto<ImpiantoBilancia>(nombreFuncion, parametros);

                return datos;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<RespuestaDB> Modify(ImpiantoBilancia data)
        {
            try
            {
                RespuestaDB respuesta = new RespuestaDB();
                string nombreFuncion = "sp_abm_impiantobilancia";

                respuesta = await this._c_conexion.abmObjeto<ImpiantoBilancia>(nombreFuncion, AbmAccion.MODIFICAR, data);

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<RespuestaDB> Save(ImpiantoBilancia data)
        {
            try
            {
                RespuestaDB respuesta = new RespuestaDB();
                string nombreFuncion = "sp_abm_impiantobilancia";

                data.id = data.id== null ? 0 : data.id;

                Hashtable parametros = new Hashtable();
                parametros.Add("action", AbmAccion.GUARDAR);
                parametros.Add("id", data.id);
                parametros.Add("id_Impianto", data.id_Impianto);
                parametros.Add("id_bilancia", data.id_bilancia);

                respuesta = await this._c_conexion.abmObjeto<ImpiantoBilancia>(nombreFuncion, AbmAccion.GUARDAR, data);

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<IEnumerable<ImpiantoBilanciaList>> SearchList(string value, string parameter, int currentPageNumber, int amountShow)
        {
            try
            {
                IEnumerable<ImpiantoBilanciaList> arrayDatos = new ImpiantoBilanciaList[] { };
                string nombreFuncion = "sp_list_impianto_bilancia";

                Hashtable parametros = new Hashtable();
                parametros.Add("bus_value", value == null ? "" : value);
                parametros.Add("bus_parameter", parameter);
                parametros.Add("currentPageNumber", currentPageNumber);
                parametros.Add("amountShow", amountShow);

                arrayDatos = await this._c_conexion.traerArrayObjeto<ImpiantoBilanciaList>(nombreFuncion, parametros);

                return arrayDatos;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
