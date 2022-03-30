using Avalonia.Controls;
using Bilanza.Data;
using Bilanza.Models;
using System.Collections.Generic;
using System.Linq;
using System;
using Bilancia.DB;
using System.Diagnostics;
using MySql.Data.MySqlClient;
using System.Data;
using System.IO.Ports;

namespace Bilanza
{
    public partial class MainWindow : Window
    {
        private ManagerBalance _balance = null;
        private List<string> _listBalanceNames = new List<string>();
        private List<string> _listProdottoNames = new List<string>();
        BalanceModel _selected = null;
        bool handle = false;
        BalanceResultModel _balanceResultModel = new BalanceResultModel();
        public static MainWindow _instance;
        public MainWindow()
        {
            InitializeComponent();
            _instance = this;

            btnConnect.Click += BtnConnect_Click;
            btnWeight.Click += BtnWeight_Click;
            btnDisconnect.Click += BtnDisconnect_Click;
            btnSend.Click += BtnSend_Click;
            btnReset.Click += BtnReset_Click;
            btnTare.Click += BtnTare_Click;
            //_balance = new ManagerBalance(@"C:\Projects\biltech\Bilancia\Bilanza\BilanciaConfig.json");
            _balance = new ManagerBalance(@"C:\Users\alex\Documents\abisoft\Bilanza v2\biltech\Bilancia\Bilanza\BilanciaConfig.json");
            
            foreach(BalanceModel b in _balance.BalanceList)
            {
                _listBalanceNames.Add(b.Balance);
            }
            cbBalances.Items = _listBalanceNames;


        }

        private void BtnDisconnect_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
        {
            _balance.ClosSelectedBalanceConnection();
            
            btnDisconnect.IsVisible = false;
            btnConnect.IsVisible= true;
            cbProdotto.IsVisible = false;
        }

        private void BtnWeight_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
        {
            if (_selected != null)
            {

                if (!_balance.IsPortAvailable())
                {
                    BalanceResultModel _result = new BalanceResultModel();
                    txtErrorMessage.Text = _balance.MessageError;
                   
                    Console.WriteLine("Port: " + Porto.Text);
                    Console.WriteLine("Command: " + txtWeightConvertion.Text);

                    _balance.DataSend(txtWeightConvertion.Text.ToString());

                    spParameters.IsVisible = true;

                } 
                else
                {
                    txtFirst.Text = _balance.BalanceResult.First;
                    txtWeight.Text = _balance.BalanceResult.WeightKg.ToString();
                    txtWeight_100.Text = _balance.BalanceResult.Weight_100.ToString();
                    txtDate.Text = _balance.BalanceResult.Date;
                    txtSecond.Text = _balance.BalanceResult.Second;
                    txtCode.Text = _balance.BalanceResult.Code;

                }
            }
        }

        private void BtnConnect_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
        {
            if (_selected != null)
            {
                _balance.SelectBalance(_selected.Balance);
                if (!_balance.OpenSelectedBalanceConnection())
                {
                    txtErrorMessage.Text = _balance.MessageError;
                } 
                else
                {
                    btnWeight.IsVisible = false;
                    cbProdotto.IsVisible = true;
                    GetProdottoDB();
                    btnConnect.IsVisible = false;
                    btnDisconnect.IsVisible = true;
   
                }
            }
        }

        private void BtnSend_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
        {
            if (_selected != null)
            {
 
                if (!_balance.IsPortAvailable())
                {
                    txtErrorMessage.Text = _balance.MessageError;
                    string select_prodotto = Convert.ToString(cbProdotto.SelectedItem);
                    if (!select_prodotto.Equals(""))
                    {
                        string command = Convert.ToString(boxCommand.Text);
                        Console.WriteLine("Command, ", command);
                        if (string.IsNullOrEmpty(command))
                        {
                            Console.WriteLine("Please type the command to send");
                        }
                        else
                        {
                            if (txtModello.Text.Equals("PX3020"))
                            {
                                Console.WriteLine("The model of this scale cannot be shipped");
                            }
                            else
                            {
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

        private void BtnReset_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
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

        private void BtnTare_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
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

        private void ComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {            
            ComboBox cmb = (sender as ComboBox);
            string selBal = cmb.SelectedItem.ToString();
            txtErrorMessage.Text = string.Empty;

            if(!string.IsNullOrEmpty(selBal)) 
            {
                _selected = _balance.BalanceList.Where(x => x.Balance.Equals(selBal)).FirstOrDefault();
                
                if (_selected != null)
                {
                    Porto.Text = _selected.PortCOM;
                    txtBaudRate.Text = _selected.BaudRate.ToString();
                    txtParity.Text = _selected.Parity.ToString();
                    txtStopBits.Text = _selected.StopBit.ToString();
                    txtHandShake.Text = _selected.HandShake.ToString();
                    txtDataBits.Text = _selected.DataBits.ToString();
                    txtCommand.Text = _selected.CommandForWeight;
                    txtParserFormat.Text = _selected.ParserFormat;
                    txtWeightConvertion.Text = _selected.WeightConversion.ToString();
                    txtModello.Text = _selected.Modello.ToString();
                    boxCommand.Text = _selected.CommandForWeight.ToString();
                    spParameters.IsVisible = true;
                    cbProdotto.IsVisible = false;
                    _balance.ClosSelectedBalanceConnection();
                }
                else
                {
                    spParameters.IsVisible = false;
                }
            }
            else
            {
                spParameters.IsVisible = false;
            }
            //handle = !cmb.IsDropDownOpen;
            //Handle();
        }

        public bool Result(string weight)
        {
            txtWeight.Text = "123";
            return true;
        }

        private void ComboBox_SelectionChangedProdotto(object sender, SelectionChangedEventArgs e)
        {
            try
            {
                ComboBox cmb = (sender as ComboBox);
                string selBal = cmb.SelectedItem.ToString();

                txtErrorMessage.Text = string.Empty;

                //_selectedProdotto = _balance.ProdottoList.Where(x => x.Nome.Equals(selBal)).FirstOrDefault();

                if (!string.IsNullOrEmpty(selBal))
                {
                    spParameters.IsVisible = true;
                }
                else
                {
                    spParameters.IsVisible = false;
                }
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex);
            }
           
        }

        public bool GetProdottoDB()
        {
            try
            {
               
                string sql = "SELECT * From prodotto WHERE Active=1";
                MySqlConnection connectionBD = ConnectionDB.connection();
                connectionBD.Open();

                try
                {
                    MySqlCommand command = new MySqlCommand(sql, connectionBD);

                    MySqlDataReader reader = command.ExecuteReader(); 
              
                    while (reader.Read())
                    {
                        _listProdottoNames.Add(reader.GetString("Nome"));
                    }

                    cbProdotto.Items = _listProdottoNames;

                    return true;

                }
                catch (MySqlException ex)
                {
                    Console.WriteLine(ex);
                    return false;

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

            return false;

        }


    }

}
