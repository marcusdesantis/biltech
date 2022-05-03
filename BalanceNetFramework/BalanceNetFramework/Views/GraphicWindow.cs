using BalanceNetFramework.Data;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BalanceNetFramework
{
    public partial class GraphicWindow : Form
    {
        public GraphicWindow()
        {
            InitializeComponent();
            //this.CenterToScreen();
            if (GetLastMeasure())
            {
                graphicMeasure.Visible = true;
            }
            else
            {
                graphicMeasure.Visible = false;
            }
        }

        private void GraphicWindow_Load(object sender, EventArgs e)
        {

        }

        public bool GetLastMeasure()
        {
            bool state = false;
            try
            {

                string sql = "SELECT m.Id, m.Peso, p.Nome FROM misurazione as m INNER JOIN prodotto as p ON m.Id_Prodotto = p.Id  WHERE m.Attivo=1 AND  p.Attivo=1 ORDER BY m.Id DESC LIMIT 5";
                MySqlConnection connectionBD = ConnectionDB.connection();
                connectionBD.Open();

                try
                {
                    MySqlCommand command = new MySqlCommand(sql, connectionBD);
                    MySqlDataReader reader = command.ExecuteReader();

                    while (reader.Read())
                    {
                        graphicMeasure.Series["Peso"].Points.AddXY(reader["Nome"].ToString().ToUpper(), reader.GetInt32("Peso"));                      
                    }
                 
                    state = true;

                }
                catch (Exception ex)
                {
                    ManagerBalance.log.Error(ex.Message);                  
                    state = false;

                }
                finally
                {
                    connectionBD.Close();

                }
            }
            catch (Exception ex)
            {
                ManagerBalance.log.Error(ex.Message);
            }

            return state;

        }

        private void btnMeasurement_Click(object sender, EventArgs e)
        {
            ReportWindow r = new ReportWindow();
            r.Show();
        }
    }
}
