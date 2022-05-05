using BalanceNetFramework.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BalanceNetFramework.Services
{
    public class UserService
    {
        public Users GetUserByCredential(string user, string password){
            Users dataUser = new Users();
            try
            {
                if (string.IsNullOrEmpty(user) || string.IsNullOrEmpty(password))
                {
                    return null;

                }
                else
                {
                    dataUser.Id = 1;
                    dataUser.Email = "yasmani1604@gmail.com";
                    dataUser.Id_Ruoli = 1;
                    dataUser.Password = "123";
                    dataUser.Utente = "admin";
                }
               
                /*
                LoginModel ctrl = new LoginModel();
                string respuesta = ctrl.ctrlLogin(user, password);*/

            }
            catch (Exception ex)
            {
                //MessageBox.Show(ex.Message, "Avvertimento", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }

            return dataUser;
        }

    }
}
