using BalanceNetFramework.Data;
using BalanceNetFramework.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BalanceNetFramework
{
    public partial class MainWindow : Form
    {
        private ManagerBalance _balance = null;
        BalanceModel _selected = null;
        BalanceResultModel _balanceResultModel = new BalanceResultModel();
        public static MainWindow _instance;
        string idProduct;
        string idBalance;
        int minValue = 0;
        int maxValue = 0;

        
        public MainWindow()
        {
            InitializeComponent();
            this.CenterToScreen();
           


            _instance = this;

            _balance = new ManagerBalance();

            cbBalance.DataSource = _balance.BalanceList;
            cbBalance.DisplayMember = "Nome";
            cbBalance.ValueMember = "Id";

            idBalance = cbBalance.SelectedValue.ToString();
            SetFields(Int32.Parse(idBalance));

        }

        private void MainWindow_Load(object sender, EventArgs e)
        {
           
        }

        private void btnConnect_Click(object sender, EventArgs e)
        {
            if (Int32.Parse(idBalance) > 0)
            {
                _balance.SelectBalance(Int32.Parse(idBalance));
                if (!_balance.OpenSelectedBalanceConnection())
                {
                    txtErrorMessage.Text = _balance.MessageError;
                
                }
                else
                {
                    
                   GetProdottoDB();
                   panelProduct.Visible = true;
                   panelBalance.Visible = true;
                   btnDisconnect.Visible = true;
                   btnConnect.Visible = false;
                   
                }
            }
            
        }

        private void btnDisconnect_Click(object sender, EventArgs e)
        {
            _balance.ClosSelectedBalanceConnection();
            panelProduct.Visible = false;
            panelBalance.Visible = false;
            btnDisconnect.Visible = false;
            btnConnect.Visible = true;
            balanceGauge.Value = 0;
            lblPesoBalance.Text = "0.00";
            detailProduct.Text = "";
            //cbProduct.Items.Clear();
        }

        private void cbBalance_SelectedIndexChanged(object sender, EventArgs e)
        {
            ComboBox cmb = (sender as ComboBox);
            idBalance = cbBalance.SelectedValue.ToString();
            int convertIdBalance = 0;

            txtErrorMessage.Text = string.Empty;

            if (!string.IsNullOrEmpty(idBalance))
            {
                if(Regex.IsMatch(idBalance, @"^[0-9]+$"))
                {
                    convertIdBalance = Int32.Parse(idBalance);
                }

                if (SetFields(convertIdBalance))
                {

                    _balance.ClosSelectedBalanceConnection();
                    panelProduct.Visible = false;
                    panelBalance.Visible = false;
                    btnDisconnect.Visible = false;
                    btnConnect.Visible = true;
                    balanceGauge.Value = 0;
                    lblPesoBalance.Text = "0.00";
                    detailProduct.Text = "";
                    
                }
               
               
            }
            else
            {
                Console.WriteLine("Scale not found error");
            }
            //handle = !cmb.IsDropDownOpen;
            //Handle();
        }

        private void cbProduct_SelectedIndexChanged(object sender, EventArgs e)
        {
            idProduct = cbProduct.SelectedValue.ToString();
            detailProduct.Text = "";
            lblPesoBalance.Text = "0.00";
            GetMinAndMaxValue(idProduct);
        }

        private void btnSend_Click(object sender, EventArgs e)
        {
            if (_selected != null)
            {

                if (!_balance.IsPortAvailable())
                {
                    txtErrorMessage.Text = _balance.MessageError;
                    string select_prodotto = Convert.ToString(cbProduct.SelectedItem);
                    if (!select_prodotto.Equals(""))
                    {
                        string command = Convert.ToString(boxCommand.Text);
                        if (string.IsNullOrEmpty(command))
                        {
                            Console.WriteLine("Please type the command to send");
                        }
                        else
                        {
                            if (lblModello.Text.Equals("PX3020"))
                            {
                                Console.WriteLine("The model of this scale cannot be shipped");
                            }
                            else
                            {
                                Console.WriteLine("Sent command");
                                _balance.DataSend(command);
                            }

                        }
                    }
                    else
                    {
                        Console.WriteLine("Please select the product");
                    }
                }
                else
                {

                    Console.WriteLine("An error has occurred, cannot connect to the scale");
                }
            }
        }

        private void btnReset_Click(object sender, EventArgs e)
        {
            if (_selected != null)
            {
                if (!_balance.IsPortAvailable())
                {
                    txtErrorMessage.Text = _balance.MessageError;
                    if (lblModello.Text.Equals("PX3020"))
                    {
                        Console.WriteLine("The model of this scale cannot be shipped");
                    }
                    else
                    {
                        string command = "Z";
                        _balance.DataSend(command);
                    }
                   
                }
                else
                {
                    Console.WriteLine("An error has occurred, cannot connect to the scale");
                }
            }
        }

        private void btnTare_Click(object sender, EventArgs e)
        {
            if (_selected != null)
            {
                if (!_balance.IsPortAvailable())
                {
                    txtErrorMessage.Text = _balance.MessageError;
                    if (lblModello.Text.Equals("PX3020"))
                    {
                        Console.WriteLine("The model of this scale cannot be shipped");
                    }
                    else
                    {
                        string command = "T";
                        _balance.DataSend(command);
                    }
                }
                else
                {
                    Console.WriteLine("An error has occurred, cannot connect to the scale");
                }
            }
        }

        public string GetIdProduct()
        { 
            return idProduct;
        } 
        public void SetWeight(string id, string weight, string sign)
        {
            String name = GetNameProduct(id);
            String[] data = weight.Split('.');
            lblPesoBalance.Invoke(new Action(() => lblPesoBalance.Text = weight + " " + sign.ToUpper()));
            balanceGauge.Invoke(new Action(() => balanceGauge.Value = Int32.Parse(data[0])));
            detailProduct.Invoke(new Action(() => detailProduct.Text = name.Substring(0, 1).ToUpper() + name.Substring(1) + " " + weight + " " + sign.ToUpper()));

        }

        public bool GetProdottoDB()
        {
            bool state = false;
            try
            {

                string sql = "SELECT * From prodotto WHERE Active=1";
                MySqlConnection connectionBD = ConnectionDB.connection();
                connectionBD.Open();

                try
                {
                    MySqlCommand command = new MySqlCommand(sql, connectionBD);

                    MySqlDataAdapter mysqldt = new MySqlDataAdapter(command);
                    DataTable dt = new DataTable();
                    mysqldt.Fill(dt);

                    cbProduct.Invoke(new Action(() => cbProduct.ValueMember = "Id"));
                    cbProduct.Invoke(new Action(() => cbProduct.DisplayMember = "Nome"));
                    cbProduct.Invoke(new Action(() => cbProduct.DataSource = dt));

                    idProduct = cbProduct.SelectedValue.ToString();

                    GetMinAndMaxValue(idProduct);

                    state = true;

                }
                catch (MySqlException ex)
                {
                    Console.WriteLine(ex);
                    state = false;

                }
                finally
                {
                    connectionBD.Close();

                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex);
            }

            return state;

        }

        public bool GetMinAndMaxValue(string idProduct)
        {
            bool state = false;
            try
            {

                string sql = "SELECT * From prodotto WHERE Id=@idProduct";
                MySqlConnection connectionBD = ConnectionDB.connection();
                connectionBD.Open();

                try
                {
                    MySqlCommand command = new MySqlCommand(sql, connectionBD);
                    command.Parameters.AddWithValue("@idProduct", idProduct);

                    MySqlDataReader reader = command.ExecuteReader();

                    while (reader.Read())
                    {
                        minValue = Int32.Parse(reader.GetString("SogliaMinima"));
                        maxValue = Int32.Parse(reader.GetString("SogliaMassima"));
                    }

                    balanceGauge.MinValue = minValue;
                    balanceGauge.MaxValue = maxValue;

                    state = true;

                }
                catch (MySqlException ex)
                {
                    Console.WriteLine(ex);
                    state = false;

                }
                finally
                {
                    connectionBD.Close();

                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex);
            }

            return state;

        }

        public string GetNameProduct(string idProduct)
        {
            string name = "";
            try
            {

                string sql = "SELECT * From prodotto WHERE Id=@idProduct";
                MySqlConnection connectionBD = ConnectionDB.connection();
                connectionBD.Open();

                try
                {
                    MySqlCommand command = new MySqlCommand(sql, connectionBD);
                    command.Parameters.AddWithValue("@idProduct", idProduct);

                    MySqlDataReader reader = command.ExecuteReader();

                    while (reader.Read())
                    {
                        name = reader.GetString("Nome");
                    }

                }
                catch (MySqlException ex)
                {
                    Console.WriteLine(ex);                

                }
                finally
                {
                    connectionBD.Close();

                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex);
            }

            return name;

        }


        public bool SetFields(int idBalance)
        {
            bool state = false;
            _selected = _balance.BalanceList.Where(x => x.Id.Equals(idBalance)).FirstOrDefault();

            if (_selected != null)
            {

                lblPorto.Text = _selected.PortCOM;
                lblBaudRate.Text = _selected.BaudRate.ToString();
                lblParity.Text = _selected.Parity.ToString();
                lblStopBit.Text = _selected.StopBit.ToString();
                lblHandShake.Text = _selected.HandShake.ToString();
                lblDataBits.Text = _selected.DataBits.ToString();
                lblCommand.Text = _selected.CommandForWeight;
                lblWeightConvertion.Text = _selected.WeightConversion.ToString();
                lblModello.Text = _selected.NomeModello.ToString();
                boxCommand.Text = _selected.CommandForWeight.ToString();

                state = true;

            }
            else
            {
                state = false;
            }
            return state;
        }

        private void btnMeasurement_Click(object sender, EventArgs e)
        {
            GraphicWindow g = new GraphicWindow();
            g.Show();
        }
    }
}
