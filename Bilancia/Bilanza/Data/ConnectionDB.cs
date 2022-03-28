using System;
using MySql.Data.MySqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Diagnostics;
using Newtonsoft.Json;
using System.IO;

namespace Bilancia.DB
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
