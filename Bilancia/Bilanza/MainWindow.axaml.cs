using Avalonia.Controls;
using Bilanza.Data;
using Bilanza.Models;
using System.Collections.Generic;
using System.Linq;


namespace Bilanza
{
    public partial class MainWindow : Window
    {
        private ManagerBalance _balance = null;
        private List<string> _listBalanceNames = new List<string>();
        BalanceModel _selected = null;
        bool handle = false;
        public MainWindow()
        {
            InitializeComponent();
            
            btnConnect.Click += BtnConnect_Click;
            btnWeight.Click += BtnWeight_Click;
            btnDisconnect.Click += BtnDisconnect_Click;
            _balance = new ManagerBalance(@"C:\Projects\biltech\Bilancia\Bilanza\BilanciaConfig.json");
            
            foreach(BalanceModel b in _balance.BalanceList)
            {
                _listBalanceNames.Add(b.Balance);
            }
            cbBalances.Items = _listBalanceNames;
        }

        private void BtnDisconnect_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
        {
            _balance.ClosSelectedBalanceConnection();
        }

        private void BtnWeight_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
        {
            if (_selected != null)
            {

                if (!_balance.SendWeightRequest2SelectedBalance())
                {
                    txtErrorMessage.Text = _balance.MessageError;
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
                    btnWeight.IsVisible = true;
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
                    spParameters.IsVisible = true;
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
    }
}
