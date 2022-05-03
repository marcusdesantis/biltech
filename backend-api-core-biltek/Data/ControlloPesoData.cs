using backend_api_core.Interfaces;
using backend_api_core.Models;
using backend_api_core.Utils;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_api_core.Data
{
    public class ControlloPesoData : IControlloPeso
    {
        private readonly IC_conexion _c_conexion;

        public ControlloPesoData(IC_conexion c_conexion)
        {
            this._c_conexion = c_conexion;
        }

        public async Task<RespuestaDB> Delete(int id)
        {
            try
            {
                RespuestaDB respuesta = null;
                string nombreFuncion = "sp_abm_controllopeso";

                respuesta = await this._c_conexion.abmObjeto<ControlloPeso>(nombreFuncion, AbmAccion.ELIMINAR_BAJA, new ControlloPeso { Id = id });

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<ControlloPeso> FindById(int id)
        {
            try
            {
                ControlloPeso datos = new ControlloPeso();
                string nombreFuncion = "sp_get_controllopeso";

                Hashtable parametros = new Hashtable();
                parametros.Add("Id", id);

                datos = await this._c_conexion.traerObjeto<ControlloPeso>(nombreFuncion, parametros);

                return datos;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<RespuestaDB> Modify(ControlloPeso data)
        {
            try
            {
                RespuestaDB respuesta = new RespuestaDB();
                string nombreFuncion = "sp_abm_controllopeso";

                respuesta = await this._c_conexion.abmObjeto<ControlloPeso>(nombreFuncion, AbmAccion.MODIFICAR, data);

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<RespuestaDB> Save(ControlloPeso data)
        {
            try
            {
                RespuestaDB respuesta = new RespuestaDB();
                string nombreFuncion = "sp_abm_controllopeso";

                data.Id = data.Id == null ? 0 : data.Id;

                Hashtable parametros = new Hashtable();
                parametros.Add("action", AbmAccion.GUARDAR);
                parametros.Add("Id", data.Id);
                parametros.Add("Id_Prodotto", data.Id_Prodotto);
                parametros.Add("NumeroControllo", data.NumeroControllo);
                parametros.Add("DataOra", data.DataOra);
                parametros.Add("Pesata", data.Pesata);
                parametros.Add("NumeroPesata", data.NumeroPesata);
                parametros.Add("Adatto", data.Adatto);
                parametros.Add("Annullato", data.Annullato);


                respuesta = await this._c_conexion.abmObjeto<ControlloPeso>(nombreFuncion, AbmAccion.GUARDAR, data);

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<IEnumerable<ControlloPesoList>> SearchList(string value, string parameter, int currentPageNumber, int amountShow)
        {
            try
            {
                IEnumerable<ControlloPesoList> arrayDatos = new ControlloPesoList[] { };
                string nombreFuncion = "sp_list_controllo_peso";

                Hashtable parametros = new Hashtable();
                parametros.Add("bus_value", value == null ? "" : value);
                parametros.Add("bus_parameter", parameter);
                parametros.Add("currentPageNumber", currentPageNumber);
                parametros.Add("amountShow", amountShow);

                arrayDatos = await this._c_conexion.traerArrayObjeto<ControlloPesoList>(nombreFuncion, parametros);

                return arrayDatos;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
