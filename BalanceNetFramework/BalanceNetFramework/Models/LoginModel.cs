using BalanceNetFramework.Data;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BalanceNetFramework.Models
{
    public class LoginModel
    {
        public string ctrlLogin(string user, string password)
        {

            string response = "";
            Users dataUser = null;

            if (string.IsNullOrEmpty(user) || string.IsNullOrEmpty(password))
            {
                response = "Devi compilare tutti i campi";
            }
            else
            {
                dataUser = UsersQuery(user);

                if (dataUser == null)
                {
                    response = "l'utente non esiste";
                }
                else
                {
                    if (dataUser.Password != password)
                    {
                        response = "Il nome utente e/o la password non corrispondono";
                    }
                    else
                    {
                        /*Session.id = datosUsuario.Id;
                        Session.usuario = usuario;
                        Session.nombre = datosUsuario.Nombre;
                        Session.id_tipo = datosUsuario.Id_tipo;*/
                    }
                }
            }
            return response;
        }

        public bool UserExists(string user)
        {
            bool state = false;
            try
            {
                MySqlDataReader reader;
                MySqlConnection connectionBD = ConnectionDB.connection();
                connectionBD.Open();

                string sql = "SELECT Id FROM Utente WHERE Utente=@user AND Attivo=@attivo";
                MySqlCommand comando = new MySqlCommand(sql, connectionBD);
                comando.Parameters.AddWithValue("@user", user);
                comando.Parameters.AddWithValue("@attivo", 1);

                reader = comando.ExecuteReader();

                if (reader.HasRows)
                {
                    state = true;
                }
                else
                {
                    state = false;
                }
            }
            catch (Exception ex)
            {
                ManagerBalance.log.Error(ex.Message);
                Console.WriteLine("Error: " + ex.Message);
            }

            return state;

        }

        public Users UsersQuery(string user)
        {
            Users usr = null;
            try
            {
                MySqlDataReader reader;
                MySqlConnection connectionBD = ConnectionDB.connection();
                connectionBD.Open();

                string sql = "SELECT Id, Utente ,Password, Email, Id_Ruoli, Attivo FROM utente WHERE Attivo=1 AND Utente=@user ";
                MySqlCommand comando = new MySqlCommand(sql, connectionBD);
                comando.Parameters.AddWithValue("@user", user);

                reader = comando.ExecuteReader();

                while (reader.Read())
                {
                    usr = new Users();
                    usr.Id = int.Parse(reader["id"].ToString());
                    usr.Utente = reader["Utente"].ToString();
                    usr.Password = reader["Password"].ToString();
                    usr.Email = reader["Email"].ToString();
                    usr.Id_Ruoli = int.Parse(reader["Id_Ruoli"].ToString());
                }
            }
            catch (Exception ex)
            {
                ManagerBalance.log.Error(ex.Message);
                Console.WriteLine("Error: " + ex.Message);
            }

            return usr;
        }
    }

    public class UserModel
    {
        public int Id { get; set; }
        public string usuario { get; set; }
        public string token { get; set; }
        public string nombre_usuario { get; set; }
        public string Cognome { get; set; }
        public string email { get; set; }
    }

    public class Respuesta
    {
        public string status { get; set; }
        public UserModel response { get; set; }
    }

    public class RespuestaCliente
    {
        public string status { get; set; }
        public ClienteModel response { get; set; }
    }

    public class ClienteModel
    {
        public string CardCode { get; set; }
        public string CardName { get; set; }
        public string Phone1 { get; set; }
        public string Phone2 { get; set; }
        public decimal Balance { get; set; }
        public short GroupNum { get; set; }
        public string U_MAQ02 { get; set; }
    }

    public class RespuestaConfig
    {
        public string status { get; set; }
        public List<BilanciaList> response { get; set; }
        public int total { get; set; }
    }

    public class BilanciaList
    {
        public int? id { get; set; }
        public string Nome { get; set; }
        public string Codice { get; set; }
        public int Id_Modello { get; set; }
        public string NomeModello { get; set; }
        public string PortCOM { get; set; }
        public int BaudRate { get; set; }
        public int DataBits { get; set; }
        public int Parity { get; set; }
        public int StopBit { get; set; }
        public int HandShake { get; set; }
        public string CommandForWeight { get; set; }
        public decimal WeightConversion { get; set; }
        public bool Attivo { get; set; }

        public int total { get; set; }


    }

}