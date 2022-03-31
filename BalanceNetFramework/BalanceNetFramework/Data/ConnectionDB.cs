using BalanceNetFramework.DB;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BalanceNetFramework.Data
{
    class ConnectionDB
    {
        public static MySqlConnection connection()
        {
            try
            {
                MySqlConnection connectionBD = new MySqlConnection(CredentialDB.DB);
                Console.WriteLine("Successful Connection");
                return connectionBD;
            }
            catch (MySqlException ex)
            {
                Console.WriteLine("Error: " + ex.Message);
                Console.WriteLine("Connection Failed");
                return null;
            }
        }
    }
}
