using System;
using MySql.Data.MySqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Diagnostics;

namespace Bilancia.DB
{
    class ConnectionBD
    {

        public static MySqlConnection connection()
        {
            string servidor = "localhost";
            string bd = "biltek_bd";
            string usuario = "root";
            string password = "";

            string cadenaConexion = "Database=" + bd + "; Data Source=" + servidor + "; User Id= " + usuario + "; Password=" + password + "";

            try
            {
                MySqlConnection conexionBD = new MySqlConnection(cadenaConexion);
                Console.WriteLine("Conexión exitosa");
                return conexionBD;
            }
            catch (MySqlException ex)
            {
                Console.WriteLine("Error: " + ex.Message);
                Console.WriteLine("Conexón Fallida");
                return null;
            }
        }
    }
}
