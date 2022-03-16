using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace backend_api_core.Utils
{
    public class TipoDato
    {
        //public string name { get; set; }
        //public string value { get; set; }
        //public string dbtype { get; set; }
        private Hashtable hashtable;

        public TipoDato()
        {
            hashtable = new Hashtable();

            hashtable.Add("Byte", DbType.Byte); // byte
            hashtable.Add("Int16", DbType.Int16);
            hashtable.Add("Int32", DbType.Int32); // int
            hashtable.Add("Int64", DbType.Int64); // long
            hashtable.Add("Decimal", DbType.Decimal); // decimal
            hashtable.Add("Double", DbType.Double); // double

            hashtable.Add("String", DbType.String);

            hashtable.Add("Boolean", DbType.Boolean);

            hashtable.Add("Date", DbType.Date);
            hashtable.Add("DateTime", DbType.DateTime);
            hashtable.Add("Time", DbType.Time);

            hashtable.Add("Binary", DbType.Binary);
        }

        public DbType obtenerTipoDatoSQL(object valor)
        {
            Type tipoDato = valor.GetType();

            string fullName = tipoDato.FullName;
            string name = tipoDato.Name;

            return hashtable.ContainsKey(name) ? (DbType)hashtable[name] : DbType.String;
        }

    }
}
