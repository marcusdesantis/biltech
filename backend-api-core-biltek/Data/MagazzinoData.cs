using backend_api_core.Interfaces;
using backend_api_core.Models;
using backend_api_core.Utils;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_api_core.Data
{
    public class MagazzinoData : IMagazzino
    {
        private readonly IC_conexion _c_conexion;

        public MagazzinoData(IC_conexion c_conexion)
        {
            this._c_conexion = c_conexion;
        }

        public async Task<RespuestaDB> Delete(int id)
        {
            try
            {
                RespuestaDB respuesta = null;
                string nombreFuncion = "sp_abm_magazzino";

                respuesta = await this._c_conexion.abmObjeto<Magazzino>(nombreFuncion, AbmAccion.ELIMINAR_BAJA, new Magazzino { Id_Magazzino = id });

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<Magazzino> FindById(int id)
        {
            try
            {
                Magazzino datos = new Magazzino();
                string nombreFuncion = "sp_get_magazzino";

                Hashtable parametros = new Hashtable();
                parametros.Add("Id", id);

                datos = await this._c_conexion.traerObjeto<Magazzino>(nombreFuncion, parametros);

                return datos;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<RespuestaDB> Modify(Magazzino data)
        {
            try
            {
                RespuestaDB respuesta = new RespuestaDB();
                string nombreFuncion = "sp_abm_magazzino";

                respuesta = await this._c_conexion.abmObjeto<Magazzino>(nombreFuncion, AbmAccion.MODIFICAR, data);

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<RespuestaDB> Save(Magazzino data)
        {
            try
            {
                RespuestaDB respuesta = new RespuestaDB();
                string nombreFuncion = "sp_abm_magazzino";

                data.Id_Magazzino = data.Id_Magazzino == null ? 0 : data.Id_Magazzino;

                Hashtable parametros = new Hashtable();
                parametros.Add("action", AbmAccion.GUARDAR);
                parametros.Add("Id_Magazzino", data.Id_Magazzino);
                parametros.Add("Id_Prodotto", data.Id_Prodotto);
                parametros.Add("Lotto", data.Lotto);
                parametros.Add("Scadenza", data.Scadenza);
                parametros.Add("QuantitaDiCarico", data.QuantitaDiCarico);


                respuesta = await this._c_conexion.abmObjeto<Magazzino>(nombreFuncion, AbmAccion.GUARDAR, data);

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<IEnumerable<MagazzinoList>> SearchList(string value, string parameter, int currentPageNumber, int amountShow)
        {
            try
            {
                IEnumerable<MagazzinoList> arrayDatos = new MagazzinoList[] { };
                string nombreFuncion = "sp_list_magazzino";

                Hashtable parametros = new Hashtable();
                parametros.Add("bus_value", value == null ? "" : value);
                parametros.Add("bus_parameter", parameter);
                parametros.Add("currentPageNumber", currentPageNumber);
                parametros.Add("amountShow", amountShow);

                arrayDatos = await this._c_conexion.traerArrayObjeto<MagazzinoList>(nombreFuncion, parametros);

                return arrayDatos;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
