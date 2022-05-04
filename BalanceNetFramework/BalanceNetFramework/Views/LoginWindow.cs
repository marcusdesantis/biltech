using BalanceNetFramework.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BalanceNetFramework.Views
{
    public partial class LoginWindow : Form
    {
        public LoginWindow()
        {
            InitializeComponent();
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            string user = txtUser.Text;
            string password = txtPassword.Text;

            try
            {
                LoginModel ctrl = new LoginModel();
                string respuesta = ctrl.ctrlLogin(user, password);
                if (respuesta.Length > 0)
                {
                    MessageBox.Show(respuesta, "Avvertimento", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                {
                    MainWindow m = new MainWindow();
                    m.Visible = true;
                    this.Visible = false;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Avvertimento", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }
    }
}
