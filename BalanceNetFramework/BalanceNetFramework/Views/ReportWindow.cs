using BalanceNetFramework.Data;
using BalanceNetFramework.Models;
using Microsoft.Reporting.WinForms;
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
    public partial class ReportWindow : Form
    {
        public static ReportWindow _instance;
        int option = 0;
        public ReportWindow()
        {
            InitializeComponent();
            _instance = this;
        }

        private void Form2_Load(object sender, EventArgs e)
        {
          
            GetProductDB();
            cbProductReport.SelectedItem = null;
            cbProductReport.SelectedText = "";
            GetBalanceDB();
            cbBalanceReport.SelectedItem = null;
            cbBalanceReport.SelectedText = "";

        }

        private void GetReport(DateTime startDate, DateTime endDate, int? idBalance, int? idProduct)
        {
            ReportModel reportModel = new ReportModel();
            reportModel.CreateReport(startDate, endDate, idBalance, idProduct);

            reportViewer1.LocalReport.DataSources.Add(new ReportDataSource("misurazioneReport", reportModel.ListMisurazione));
            reportViewer1.LocalReport.DataSources.Add(new ReportDataSource("misurazioneList", reportModel.ListMisurazione));
            this.reportViewer1.RefreshReport();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.reportViewer1.LocalReport.DataSources.Clear();
            var fromDate = dateStart.Value;
            var toDate = dateEnd.Value;

            var dataStart = fromDate.ToString("yyyy-MM-dd");
            var dataEnd = toDate.ToString("yyyy-MM-dd");

            if (cbBalanceReport.SelectedValue == null && cbProductReport.SelectedValue == null && checkFilterDate.Checked == false)
            {

                MessageBox.Show("Seleziona un filtro.");

            }

            if (cbBalanceReport.SelectedValue == null && cbProductReport.SelectedValue == null && checkFilterDate.Checked)
            {
                if (fromDate > toDate)
                {
                    if (dataStart.Equals(dataEnd))
                    {
                        option = 1;
                        GetReport(fromDate, toDate, 0, 0);
                    }
                    else
                    {
                        MessageBox.Show("La data di inizio non può essere successiva alla data fine.");
                    }

                }
                else
                {
                    option = 1;
                    GetReport(fromDate, toDate, 0, 0);
                }
            }

            if (cbBalanceReport.SelectedValue != null && cbProductReport.SelectedValue == null && checkFilterDate.Checked == false)
            {
                option = 2;
                int idBalance = Convert.ToInt32(cbBalanceReport.SelectedValue.ToString());
                GetReport(fromDate, toDate, idBalance, 0);
            }

            if (cbBalanceReport.SelectedValue == null && cbProductReport.SelectedValue != null && checkFilterDate.Checked == false)
            {
                option = 3;
                int idProduct = Convert.ToInt32(cbProductReport.SelectedValue.ToString());
                GetReport(fromDate, toDate, 0, idProduct);
            }

            if (cbBalanceReport.SelectedValue != null && cbProductReport.SelectedValue != null && checkFilterDate.Checked == false)
            {
                option = 4;
                int idBalance = Convert.ToInt32(cbBalanceReport.SelectedValue.ToString());
                int idProduct = Convert.ToInt32(cbProductReport.SelectedValue.ToString());
                GetReport(fromDate, toDate, idBalance, idProduct);
            }

            if (cbBalanceReport.SelectedValue != null && cbProductReport.SelectedValue == null && checkFilterDate.Checked)
            {
                if (fromDate > toDate)
                {
                    if (dataStart.Equals(dataEnd))
                    {
                        option = 5;
                        int idBalance = Convert.ToInt32(cbBalanceReport.SelectedValue.ToString());
                        GetReport(fromDate, toDate, idBalance, 0);
                    }
                    else
                    {
                        MessageBox.Show("La data di inizio non può essere successiva alla data fine.");
                    }

                }
                else
                {
                    option = 5;
                    int idBalance = Convert.ToInt32(cbBalanceReport.SelectedValue.ToString());
                    GetReport(fromDate, toDate, idBalance, 0);
                }
                
            }

            if (cbBalanceReport.SelectedValue == null && cbProductReport.SelectedValue != null && checkFilterDate.Checked)
            {
                if (fromDate > toDate)
                {
                    if (dataStart.Equals(dataEnd))
                    {
                        option = 6;
                        int idProduct = Convert.ToInt32(cbProductReport.SelectedValue.ToString());
                        GetReport(fromDate, toDate, 0, idProduct);
                    }
                    else
                    {
                        MessageBox.Show("La data di inizio non può essere successiva alla data fine.");
                    }

                }
                else
                {
                    option = 6;
                    int idProduct = Convert.ToInt32(cbProductReport.SelectedValue.ToString());
                    GetReport(fromDate, toDate, 0, idProduct);
                }

            }

            if (cbBalanceReport.SelectedValue != null && cbProductReport.SelectedValue != null && checkFilterDate.Checked)
            {
                if (fromDate > toDate)
                {
                    if (dataStart.Equals(dataEnd))
                    {
                        option = 7;
                        int idBalance = Convert.ToInt32(cbBalanceReport.SelectedValue.ToString());
                        int idProduct = Convert.ToInt32(cbProductReport.SelectedValue.ToString());
                        GetReport(fromDate, toDate, idBalance, idProduct);
                    }
                    else
                    {
                        MessageBox.Show("La data di inizio non può essere successiva alla data fine.");
                    }

                }
                else
                {
                    option = 7;
                    int idBalance = Convert.ToInt32(cbBalanceReport.SelectedValue.ToString());
                    int idProduct = Convert.ToInt32(cbProductReport.SelectedValue.ToString());
                    GetReport(fromDate, toDate, idBalance, idProduct);
                }

            }

        }

        public int GetOption()
        {
            return option;
        }

        public bool GetProductDB()
        {
            bool state = false;
            try
            {

                string sql = "SELECT * From prodotto WHERE Attivo=1";
                MySqlConnection connectionBD = ConnectionDB.connection();
                connectionBD.Open();

                try
                {
                    MySqlCommand command = new MySqlCommand(sql, connectionBD);

                    MySqlDataAdapter mysqldt = new MySqlDataAdapter(command);
                    DataTable dt = new DataTable();
                   /* DataRow fila = dt.NewRow();
                    fila["Id, Nome, Id"] = "Seleccionar";
                    dt.Rows.InsertAt(fila, 0);*/

                    mysqldt.Fill(dt);

                    cbProductReport.Invoke(new Action(() => cbProductReport.ValueMember = "Id"));
                    cbProductReport.Invoke(new Action(() => cbProductReport.DisplayMember = "Nome"));
                    cbProductReport.Invoke(new Action(() => cbProductReport.DataSource = dt));

                    //idProduct = cbProduct.SelectedValue.ToString();
                  
                    state = true;

                }
                catch (Exception ex)
                {
                    ManagerBalance.log.Error(ex.Message);
                    Console.WriteLine(ex.Message);
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
                Console.WriteLine("Error: " + ex.Message);
            }

            return state;

        }

        public bool GetBalanceDB()
        {
            bool state = false;
            try
            {

                string sql = "SELECT * From bilancia WHERE Attivo=1";
                MySqlConnection connectionBD = ConnectionDB.connection();
                connectionBD.Open();

                try
                {
                    MySqlCommand command = new MySqlCommand(sql, connectionBD);

                    MySqlDataAdapter mysqldt = new MySqlDataAdapter(command);
                    DataTable dt = new DataTable();

                    mysqldt.Fill(dt);

                    cbBalanceReport.Invoke(new Action(() => cbBalanceReport.ValueMember = "Id"));
                    cbBalanceReport.Invoke(new Action(() => cbBalanceReport.DisplayMember = "Nome"));
                    cbBalanceReport.Invoke(new Action(() => cbBalanceReport.DataSource = dt));

                    state = true;

                }
                catch (Exception ex)
                {
                    ManagerBalance.log.Error(ex.Message);
                    Console.WriteLine(ex.Message);
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
                Console.WriteLine("Error: " + ex.Message);
            }

            return state;

        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (this.checkFilterDate.Checked)
            {
                this.panelDate.Visible = true;
            }
            else
            {
                this.panelDate.Visible = false;
            }
        }
    }
}
