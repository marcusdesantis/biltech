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
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BalanceNetFramework
{
    public partial class MainWindow : Form
    {
        private ManagerBalance _balance = null;
        private List<string> _listBalanceNames = new List<string>();
        private List<string> _listProdottoNames = new List<string>();
        BalanceModel _selected = null;
        bool handle = false;
        BalanceResultModel _balanceResultModel = new BalanceResultModel();
        public static MainWindow _instance;
        string idProduct;
        string text;
        int minValue = 0;
        int maxValue = 0;
        public MainWindow()
        {
            InitializeComponent();
            _instance = this;

           // _balance = new ManagerBalance(@"C:\Users\alex\Documents\abisoft\Bilanza v2\biltech\BalanceNetFramework\BalanceNetFramework\BalanceConfig.json");
            _balance = new ManagerBalance();

            
            foreach (BalanceModel b in _balance.BalanceList)
            {
                _listBalanceNames.Add(b.Nome);               
                //cbBalance.Items.Add(b.Nome);
            }

            cbBalance.DataSource = _balance.BalanceList;
            cbBalance.DisplayMember = "Nome";
            cbBalance.ValueMember = "Id";

        }

        private void btnConnect_Click(object sender, EventArgs e)
        {
            if (_selected != null)
            {
                _balance.SelectBalance(_selected.Id);
                if (!_balance.OpenSelectedBalanceConnection())
                {
                    txtErrorMessage.Text = _balance.MessageError;
                    Console.WriteLine("444444");
                }
                else
                {
                    
                   GetProdottoDB();
                   panelProduct.Visible = true;
                   panelBalance.Visible = true;
                   btnDisconnect.Visible = true;
                   btnConnect.Visible = false;
                    Console.WriteLine("12333");

                }
            }
            Console.WriteLine("555555");
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
            //cbProduct.Items.Clear();
        }

        private void cbBalance_SelectedIndexChanged(object sender, EventArgs e)
        {
            ComboBox cmb = (sender as ComboBox);
            string selBal = cbBalance.SelectedValue.ToString();
           
            txtErrorMessage.Text = string.Empty;
            Console.WriteLine("El id es:", selBal);

            if (!string.IsNullOrEmpty(selBal))
            {
                int selbal1 = Int32.Parse(selBal);
                _selected =  _balance.BalanceList.Where(x => x.Id.Equals(selbal1)).FirstOrDefault();
                Console.WriteLine("El id es:", selBal);

                if (_selected != null)
                {
                    lblPorto.Text = _selected.PortCOM;
                    lblBaudRate.Text = _selected.BaudRate.ToString();
                    lblParity.Text = _selected.Parity.ToString();
                    lblStopBit.Text = _selected.StopBit.ToString();
                    lblHandShake.Text = _selected.HandShake.ToString();
                    lblDataBits.Text = _selected.DataBits.ToString();
                    lblCommand.Text = _selected.CommandForWeight;
                    //lblParser.Text = _selected.ParserFormat;
                    lblWeightConvertion.Text = _selected.WeightConversion.ToString();
                    //lblModello.Text = _selected.Modello.ToString();
                    //lblModello.Invoke(new Action(() => lblModello.Text = _selected.Modello.ToString()));
                    boxCommand.Text = _selected.CommandForWeight.ToString();

                    Console.WriteLine(lblPorto);

                    _balance.ClosSelectedBalanceConnection();
                    panelProduct.Visible = false;
                    panelBalance.Visible = false;
                    btnDisconnect.Visible = false;
                    btnConnect.Visible = true;
                    balanceGauge.Value = 0;
                    lblPesoBalance.Text = "0.00";

                }
                else
                {
                    //spParameters.IsVisible = false;
                }
            }
            else
            {
                ///*spParameters.IsVisible = false;
            }
            //handle = !cmb.IsDropDownOpen;
            //Handle();
        }

        private void cbProduct_SelectedIndexChanged(object sender, EventArgs e)
        {
            idProduct = cbProduct.SelectedValue.ToString();
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
                    string command = "Z";
                    _balance.DataSend(command);
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
                    string command = "T";
                    _balance.DataSend(command);
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
        public void SetWeight(string weight, string sign)
        {
            
            String[] data = weight.Split('.');
            lblPesoBalance.Invoke(new Action(() => lblPesoBalance.Text = weight + " " + sign.ToUpper()));
            balanceGauge.Invoke(new Action(() => balanceGauge.Value = Int32.Parse(data[0])));
            
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


        private void MainWindow_Load(object sender, EventArgs e)
        {
            
        }

     
    }
}
