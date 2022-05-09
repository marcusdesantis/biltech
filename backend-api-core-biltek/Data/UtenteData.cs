using backend_api_core.Interfaces;
using backend_api_core.Models;
using backend_api_core.Utils;
using Microsoft.AspNetCore.Hosting;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_api_core.Data
{
    public class UtenteData : IUtente
    {
        private readonly IC_conexion _c_conexion;
        private Utente _Utente = new Utente();

        public Utente Utente
        {
            get
            {
                return _Utente;
            }
        }
        public UtenteData(IC_conexion c_conexion )
        {
            this._c_conexion = c_conexion;
        }

        public async Task<RespuestaDB> Delete(int id)
        {
            try
            {
                RespuestaDB respuesta = null;
                string nombreFuncion = "sp_abm_utente";

                respuesta = await this._c_conexion.abmObjeto<Utente>(nombreFuncion, AbmAccion.ELIMINAR_BAJA, new Utente { Id = id });

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<Utente> FindById(int id)
        {
            try
            {
                Utente datos = new Utente();
                string nombreFuncion = "sp_get_utente";

                Hashtable parametros = new Hashtable();
                parametros.Add("Id", id);

                datos = await this._c_conexion.traerObjeto<Utente>(nombreFuncion, parametros);

                return datos;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<Utente> FindByUtente(string utente)
        {
            try
            {
                Utente datos = new Utente();
                string nombreFuncion = "sp_get_utente_by_utente";

                Hashtable parametros = new Hashtable();
                parametros.Add("utente", utente);

                datos = await this._c_conexion.traerObjeto<Utente>(nombreFuncion, parametros);

                return datos;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<bool> isAuthenticate(Utente utente)
        {
            bool respuesta = false;
            Utente usuario = new Utente();
            usuario = await FindByUtente(utente.utente);

            if (usuario != null)
            {
                if (utente.Password.Equals(usuario.Password))
                {
                    _Utente = usuario;
                    respuesta = true;
                }
            }
            return respuesta;
        }

        public async Task<RespuestaDB> Modify(Utente data)
        {
            try
            {
                RespuestaDB respuesta = new RespuestaDB();
                string nombreFuncion = "sp_abm_utente";

                respuesta = await this._c_conexion.abmObjeto<Utente>(nombreFuncion, AbmAccion.MODIFICAR, data);

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<RespuestaDB> Save(Utente data)
        {
            try
            {
                RespuestaDB respuesta = new RespuestaDB();
                string nombreFuncion = "sp_abm_utente";

                data.Id = data.Id == null ? 0 : data.Id;

                Hashtable parametros = new Hashtable();
                parametros.Add("action", AbmAccion.GUARDAR);
                parametros.Add("Id", data.Id);
                parametros.Add("Utente", data.utente);
                parametros.Add("Password", data.Password);
                parametros.Add("Email", data.Email);
                parametros.Add("Id_Ruoli", data.Id_Ruoli);


                respuesta = await this._c_conexion.abmObjeto<Utente>(nombreFuncion, AbmAccion.GUARDAR, data);

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<IEnumerable<UtenteList>> SearchList(string value, string parameter, int currentPageNumber, int amountShow)
        {
            try
            {
                IEnumerable<UtenteList> arrayDatos = new UtenteList[] { };
                string nombreFuncion = "sp_list_utente";

                Hashtable parametros = new Hashtable();
                parametros.Add("bus_value", value == null ? "" : value);
                parametros.Add("bus_parameter", parameter);
                parametros.Add("currentPageNumber", currentPageNumber);
                parametros.Add("amountShow", amountShow);

                arrayDatos = await this._c_conexion.traerArrayObjeto<UtenteList>(nombreFuncion, parametros);

                return arrayDatos;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
