using BalanceNetFramework.Models;
using BalanceNetFramework.Provider;
using BalanceNetFramework.Services;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.OAuth;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BalanceNetFramework.Views
{
    public partial class LoginWindow : Form
    {
        public LoginWindow()
        {
            this.CenterToScreen();
            InitializeComponent();
        }

        private void btnLogin_Click(object sender, EventArgs e, OAuthGrantResourceOwnerCredentialsContext context)
        {
            //string user = txtUser.Text;
            //string password = txtPassword.Text;

            //OAuthAppProvider oauth = new OAuthAppProvider();
            //oauth.GrantResourceOwnerCredentials();

            var username = context.UserName;
            var password = context.Password;
            var userService = new UserService();
            Users user = userService.GetUserByCredential(username, password);

            if (user != null)
            {
                var claims = new List<Claim>()
                    {
                        new Claim(ClaimTypes.Name, user.Utente),
                        new Claim("UserID", Convert.ToString(user.Id))
                    };

                ClaimsIdentity oAutIdentity = new ClaimsIdentity(claims, Startup.OAuthOptions.AuthenticationType);
                context.Validated(new AuthenticationTicket(oAutIdentity, new AuthenticationProperties() { }));
            }
            else
            {
                context.SetError("invalid_grant", "Error");
            }


            //string respuesta = GetUserByCredential(user, password);
            /*if (respuesta.Length > 0)
            {
                MessageBox.Show(respuesta, "Avvertimento", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MainWindow m = new MainWindow();
                m.Visible = true;
                this.Visible = false;
            }*/


        }

        private string userServ(string user, string password)
        {
            throw new NotImplementedException();
        }

        private void LoginWindow_Load(object sender, EventArgs e)
        {

        }

        private async void btnLogin_Click(object sender, EventArgs e)
        {
           
            string _user = txtUser.Text;
            string _password = txtPassword.Text;

            ApiClientService _client = new ApiClientService();
            Users _utente = new Users() { Id = 0, Utente = _user, Password = _password };

            var resp = await _client.Login(_utente);
            //if(loginController.Login(_utente))
            if (resp != null && resp.status == "success")
            {
               // MainWindow form1 = new MainWindow(resp);
                this.Hide();
               // form1.usuario = resp.response;
                //form1.cargarUsuario();
                //form1.Show();
            }
            else
            {
                MessageBox.Show("Usuario no autorizado");
            }

        }
    }
}
