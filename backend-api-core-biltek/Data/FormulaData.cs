using backend_api_core.Interfaces;
using backend_api_core.Models;
using backend_api_core.Utils;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_api_core.Data
{
    public class FormulaData: IFormula
    {
        private readonly IC_conexion _c_conexion;

        public FormulaData(IC_conexion c_conexion)
        {
            this._c_conexion = c_conexion;
        }

        public async Task<RespuestaDB> Delete(int id)
        {
            try
            {
                RespuestaDB respuesta = null;
                string nombreFuncion = "sp_abm_formula";

                respuesta = await this._c_conexion.abmObjeto<Formula>(nombreFuncion, AbmAccion.ELIMINAR_BAJA, new Formula { id = id });

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<Formula> FindById(int id)
        {
            try
            {
                Formula datos = new Formula();
                string nombreFuncion = "sp_get_formula";

                Hashtable parametros = new Hashtable();
                parametros.Add("id", id);

                datos = await this._c_conexion.traerObjeto<Formula>(nombreFuncion, parametros);

                return datos;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<RespuestaDB> Modify(Formula data)
        {
            try
            {
                RespuestaDB respuesta = new RespuestaDB();
                string nombreFuncion = "sp_abm_formula";

                respuesta = await this._c_conexion.abmObjeto<Formula>(nombreFuncion, AbmAccion.MODIFICAR, data);

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<RespuestaDB> Save(Formula data)
        {
            try
            {
                RespuestaDB respuesta = new RespuestaDB();
                string nombreFuncion = "sp_abm_formula";

                data.id = data.id== null ? 0 : data.id;

                Hashtable parametros = new Hashtable();
                parametros.Add("action", AbmAccion.GUARDAR);
                parametros.Add("id", data.id);
                parametros.Add("Nome", data.Nome);
                parametros.Add("Algoritmo", data.Algoritmo);

                respuesta = await this._c_conexion.abmObjeto<Formula>(nombreFuncion, AbmAccion.GUARDAR, data);

                return respuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<IEnumerable<FormulaList>> SearchList(string value, string parameter, int currentPageNumber, int amountShow)
        {
            try
            {
                IEnumerable<FormulaList> arrayDatos = new FormulaList[] { };
                string nombreFuncion = "sp_list_formula";

                Hashtable parametros = new Hashtable();
                parametros.Add("bus_value", value == null ? "" : value);
                parametros.Add("bus_parameter", parameter);
                parametros.Add("currentPageNumber", currentPageNumber);
                parametros.Add("amountShow", amountShow);

                arrayDatos = await this._c_conexion.traerArrayObjeto<FormulaList>(nombreFuncion, parametros);

                return arrayDatos;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
