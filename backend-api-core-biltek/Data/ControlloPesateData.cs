using backend_api_core.Interfaces;
using backend_api_core.Models;
using backend_api_core.Utils;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_api_core.Data
{
    public class ControlloPesateData : IControlloPesate
    {
        private readonly IC_conexion _c_conexion;

        public ControlloPesateData(IC_conexion c_conexion)
        {
            this._c_conexion = c_conexion;
        }

        public async Task<RespuestaDB> Delete(int id)
        {
            try
            {
                RespuestaDB respuesta = null;
                string nombreFuncion = "sp_abm_controllopesate";

                respuesta = await this._c_conexion.abmObjeto<ControlloPesate>(nombreFuncion, AbmAccion.ELIMINAR_BAJA, new ControlloPesate { Id = id });

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<ControlloPesate> FindById(int id)
        {
            try
            {
                ControlloPesate datos = new ControlloPesate();
                string nombreFuncion = "sp_get_controllopesate";

                Hashtable parametros = new Hashtable();
                parametros.Add("Id", id);

                datos = await this._c_conexion.traerObjeto<ControlloPesate>(nombreFuncion, parametros);

                return datos;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<RespuestaDB> Modify(ControlloPesate data)
        {
            try
            {
                RespuestaDB respuesta = new RespuestaDB();
                string nombreFuncion = "sp_abm_controllopesate";

                respuesta = await this._c_conexion.abmObjeto<ControlloPesate>(nombreFuncion, AbmAccion.MODIFICAR, data);

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<RespuestaDB> Save(ControlloPesate data)
        {
            try
            {
                RespuestaDB respuesta = new RespuestaDB();
                string nombreFuncion = "sp_abm_controllopesate";

                data.Id = data.Id == null ? 0 : data.Id;

                Hashtable parametros = new Hashtable();
                parametros.Add("action", AbmAccion.GUARDAR);
                parametros.Add("Id", data.Id);
                parametros.Add("Id_Prodotto", data.Id_Prodotto);
                parametros.Add("NumeroControllo", data.NumeroControllo);
                parametros.Add("DataOra", data.DataOra);
                parametros.Add("Pesata", data.Pesata);
                parametros.Add("NumeroPesata", data.NumeroPesata);
                parametros.Add("Conforme", data.Conforme);
                parametros.Add("Annullato", data.Annullato);


                respuesta = await this._c_conexion.abmObjeto<ControlloPesate>(nombreFuncion, AbmAccion.GUARDAR, data);

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<IEnumerable<ControlloPesateList>> SearchList(string value, string parameter, int currentPageNumber, int amountShow)
        {
            try
            {
                IEnumerable<ControlloPesateList> arrayDatos = new ControlloPesateList[] { };
                string nombreFuncion = "sp_list_controllo_pesate";

                Hashtable parametros = new Hashtable();
                parametros.Add("bus_value", value == null ? "" : value);
                parametros.Add("bus_parameter", parameter);
                parametros.Add("currentPageNumber", currentPageNumber);
                parametros.Add("amountShow", amountShow);

                arrayDatos = await this._c_conexion.traerArrayObjeto<ControlloPesateList>(nombreFuncion, parametros);

                return arrayDatos;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
