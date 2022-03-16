using Microsoft.Extensions.Configuration;
using System.Data;
using backend_api_core.Interfaces;
using System.Collections.Generic;
using Dapper;
using System.Threading.Tasks;
using System;
using System.Data.SqlClient;
using System.Collections;
using backend_api_core.Utils;
using System.Reflection;
using backend_api_core.Models;
using System.Data.Odbc;
using MySqlConnector;

namespace backend_api_core.Data
{
    public class C_conexion : IC_conexion
    {
        private IConfiguration appSettingsInstance;

        public C_conexion()
        {
            appSettingsInstance = new ConfigurationBuilder().AddJsonFile("appsettings.json").Build();
        }
        public async Task<T> traerObjeto<T>(string nombreProcedimiento, Hashtable parametros)
        {
            try
            {
                var datos = default(T);
                DynamicParameters dynamicParameters = new DynamicParameters();

                foreach (DictionaryEntry item in parametros ?? new Hashtable())
                {
                    dynamicParameters.Add(item.Key.ToString(), item.Value);
                }

                using (IDbConnection cnx = this.conexionMySQL)
                {
                    datos = await cnx.QuerySingleOrDefaultAsync<T>(
                        sql: nombreProcedimiento,
                        param: dynamicParameters,
                        commandType: CommandType.StoredProcedure
                    );
                    cnx.Close();
                }

                return datos;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<IEnumerable<T>> traerArrayObjeto<T>(string nombreProcedimiento, Hashtable parametros)
        {
            try
            {
                IEnumerable<T> datos = new T[] { };
                DynamicParameters dynamicParameters = new DynamicParameters();

                foreach (DictionaryEntry item in parametros ?? new Hashtable())
                {
                    dynamicParameters.Add(item.Key.ToString(), item.Value);
                }

                using (IDbConnection cnx = this.conexionMySQL)
                {
                    datos = await cnx.QueryAsync<T>(
                        sql: nombreProcedimiento,
                        param: dynamicParameters,
                        commandType: CommandType.StoredProcedure
                    );
                    cnx.Close();

                }

                return datos;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<RespuestaDB> abmObjeto<T>(string nombreProcedimiento, AbmAccion accion, T objeto)
        {
            try
            {
                RespuestaDB respuestaDB = new RespuestaDB();
                DynamicParameters dynamicParameters = new DynamicParameters();
                PropertyInfo[] arrayProperties = typeof(T).GetProperties();

                Hashtable parametros = new Hashtable();

                dynamicParameters.Add("action", (int)accion);

                foreach (PropertyInfo item in arrayProperties)
                {
                    object obj = item.GetValue(objeto, null);
                    dynamicParameters.Add($"{item.Name}", obj);
                }

                using (IDbConnection cnx = this.conexionMySQL)
                {
                    respuestaDB = await cnx.QuerySingleOrDefaultAsync<RespuestaDB>(
                        sql: nombreProcedimiento,
                        param: dynamicParameters,
                        commandType: CommandType.StoredProcedure
                    );
                    cnx.Close();
                }

                return respuestaDB;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<RespuestaDB> ejecutarProcConParametros(string nombreProcedimiento, object parametros)
        {
            try
            {
                RespuestaDB respuestaDB = new RespuestaDB();
                DynamicParameters dynamicParameters = new DynamicParameters();
                Hashtable param = (Hashtable)parametros;
                //Type auxType = parametros.GetType();
                //IList<PropertyInfo> arrayProperties = new List<PropertyInfo>(auxType.GetProperties());


                foreach (DictionaryEntry item in param ?? new Hashtable())
                {
                    dynamicParameters.Add(item.Key.ToString(), item.Value);
                }

                //foreach (PropertyInfo item in arrayProperties)
                //{
                //    dynamicParameters.Add(item.Name, item.GetValue(parametros, null));
                //}

                using (IDbConnection cnx = this.conexionMySQL)
                {
                    respuestaDB = await cnx.QuerySingleOrDefaultAsync<RespuestaDB>(
                        sql: nombreProcedimiento,
                        param: dynamicParameters,
                        commandType: CommandType.StoredProcedure
                    );
                    cnx.Close();
                }

                return respuestaDB;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public IDbConnection conexionMySQL
        {
            get
            {
                return new MySqlConnection(appSettingsInstance.GetConnectionString("CadenaConexionMySQL"));
            }
        }
    }
}
