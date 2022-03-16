using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;
using backend_api_core.Models;
using backend_api_core.Utils;
using Dapper;

namespace backend_api_core.Interfaces
{
    public interface IC_conexion
    {
        public IDbConnection conexionMySQL{get;}
        public Task<T> traerObjeto<T>(string nombreProcedimiento, Hashtable parametros);
        public Task<IEnumerable<T>> traerArrayObjeto<T>(string nombreProcedimiento, Hashtable parametros = null);
        public Task<RespuestaDB> abmObjeto<T>(string nombreProcedimiento, AbmAccion accion, T objeto);
        public Task<RespuestaDB> ejecutarProcConParametros(string nombreProcedimiento, object parametros);
    }
}
