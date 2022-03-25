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
        private ManagerBalance _bilancia = null;
        private List<string> _listBalanceNames = new List<string>();
        private List<string> _listBilanciaNames = new List<string>();
        BalanceModel _selected = null;
        BilanciaModel _selectedBilancia = null;
        bool handle = false;
        BalanceResultModel _balanceResultModel = new BalanceResultModel();
        public MainWindow()
        {
            InitializeComponent();

            btnConnect.Click += BtnConnect_Click;
            btnWeight.Click += BtnWeight_Click;
            btnDisconnect.Click += BtnDisconnect_Click;
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
            _listBilanciaNames = new List<string>();
            cbBalanciaDB.Items = _listBilanciaNames;
            cbBalanciaDB.IsVisible = false;
        }

        private void BtnWeight_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
        {
            if (_selected != null)
            {

                if (!_balance.IsPortAvailable())
                {
                    BalanceResultModel _result = new BalanceResultModel();
                    txtErrorMessage.Text = _balance.MessageError;
                   
                    Console.WriteLine("Port -> " + Porto.Text);
                    Console.WriteLine("Command -> " + txtWeightConvertion.Text);

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
                if(!_balance.OpenSelectedBalanceConnection())
                {
                    txtErrorMessage.Text = _balance.MessageError;
                } 
                else
                {
                    btnWeight.IsVisible = false;
                    cbBalanciaDB.IsVisible = true;
                    GetBilanciaDB();
                    btnConnect.IsVisible = false;
                    btnDisconnect.IsVisible = true;
   
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
                if(_selected != null)
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
                    spParameters.IsVisible = true;
                    cbBalanciaDB.IsVisible = false;
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

        private void ComboBox_SelectionChangedBilancia(object sender, SelectionChangedEventArgs e)
        {
            ComboBox cmb = (sender as ComboBox);
            string selBal = cmb.SelectedItem.ToString();
            txtErrorMessage.Text = string.Empty;

            if (!string.IsNullOrEmpty(selBal))
            {

                if (selBal.Equals("PX3202"))
                {
                    Console.WriteLine("data is not sent");
                }
                else
                {
                    Console.WriteLine("data is sent");


                    if (!_balance.IsPortAvailable())
                    {

                        Console.WriteLine("Port -> " + Porto.Text);
                        Console.WriteLine("Command -> " + txtWeightConvertion.Text);

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
            else
            {
                spParameters.IsVisible = false;
            }
   
        }

        public bool GetBilanciaDB()
        {
            try
            {
               
                string sql = "SELECT * From prodotto WHERE Active=1";
                MySqlConnection connectionBD = ConnectionBD.connection();
                connectionBD.Open();

                try
                {
                    MySqlCommand comando = new MySqlCommand(sql, connectionBD);

                    MySqlDataReader reader = comando.ExecuteReader();

                    //cbBalanciaDB.Items = _listBilanciaNames;   
                    _listBilanciaNames = new List<string>();

                    while (reader.Read())
                    {
                        _listBilanciaNames.Add(reader.GetString("Nome"));
                    }

                    cbBalanciaDB.Items = _listBilanciaNames;

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
                Console.WriteLine("Error -> " + ex);
            }

            return false;

        }


    }

}
