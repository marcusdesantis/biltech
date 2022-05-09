using backend_api_core.Interfaces;
using backend_api_core.Models;
using backend_api_core.Utils;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_api_core.Data
{
    public class BilanciaData: IBilancia
    {
        private readonly IC_conexion _c_conexion;

        public BilanciaData(IC_conexion c_conexion)
        {
            this._c_conexion = c_conexion;
        }

        public async Task<RespuestaDB> Delete(int id)
        {
            try
            {
                RespuestaDB respuesta = null;
                string nombreFuncion = "sp_abm_bilancia";

                respuesta = await this._c_conexion.abmObjeto<Bilancia>(nombreFuncion, AbmAccion.ELIMINAR_BAJA, new Bilancia { id = id });

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<Bilancia> FindById(int id)
        {
            try
            {
                Bilancia datos = new Bilancia();
                string nombreFuncion = "sp_get_bilancia";

                Hashtable parametros = new Hashtable();
                parametros.Add("id", id);

                datos = await this._c_conexion.traerObjeto<Bilancia>(nombreFuncion, parametros);

                return datos;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<RespuestaDB> Modify(Bilancia data)
        {
            try
            {
                RespuestaDB respuesta = new RespuestaDB();
                string nombreFuncion = "sp_abm_bilancia";

                respuesta = await this._c_conexion.abmObjeto<Bilancia>(nombreFuncion, AbmAccion.MODIFICAR, data);

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<RespuestaDB> Save(Bilancia data)
        {
            try
            {
                RespuestaDB respuesta = new RespuestaDB();
                string nombreFuncion = "sp_abm_bilancia";

                data.id = data.id== null ? 0 : data.id;

                Hashtable parametros = new Hashtable();
                parametros.Add("action", AbmAccion.GUARDAR);
                parametros.Add("id", data.id);
                parametros.Add("Nome", data.Nome);
                parametros.Add("Codice", data.Codice);
                parametros.Add("Id_Modello", data.Id_Modello);
                parametros.Add("PortCOM", data.PortCOM);
                parametros.Add("BaudRate", data.BaudRate);
                parametros.Add("DataBits", data.DataBits);
                parametros.Add("Parity", data.Parity);
                parametros.Add("StopBit", data.StopBit);
                parametros.Add("HandShake", data.HandShake);
                parametros.Add("CommandForWeight", data.CommandForWeight);
                parametros.Add("WeightConversion", data.WeightConversion);

                respuesta = await this._c_conexion.abmObjeto<Bilancia>(nombreFuncion, AbmAccion.GUARDAR, data);

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<IEnumerable<BilanciaList>> SearchList(string value, string parameter, int currentPageNumber, int amountShow)
        {
            try
            {
                IEnumerable<BilanciaList> arrayDatos = new BilanciaList[] { };
                string nombreFuncion = "sp_list_bilancia";

                Hashtable parametros = new Hashtable();
                parametros.Add("bus_value", value == null ? "" : value);
                parametros.Add("bus_parameter", parameter);
                parametros.Add("currentPageNumber", currentPageNumber);
                parametros.Add("amountShow", amountShow);

                arrayDatos = await this._c_conexion.traerArrayObjeto<BilanciaList>(nombreFuncion, parametros);

                return arrayDatos;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<IEnumerable<BilanciaList>> ConfigList()
        {
            try
            {
                IEnumerable<BilanciaList> arrayDatos = new BilanciaList[] { };
                string nombreFuncion = "sp_conf_bilancia";

                Hashtable parametros = new Hashtable();

                arrayDatos = await this._c_conexion.traerArrayObjeto<BilanciaList>(nombreFuncion, parametros);

                return arrayDatos;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
