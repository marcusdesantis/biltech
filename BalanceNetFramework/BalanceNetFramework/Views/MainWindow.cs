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
        //BalanceResultModel _balanceResultModel = new BalanceResultModel();
        public static MainWindow _instance;
        string idProduct;
        string idBalance;
        int minValue = 0;
        int maxValue = 0;
        decimal Tolerance = 0;

        
        public MainWindow()
        {
            InitializeComponent();
            this.CenterToScreen();
            this.MaximizeBox = false;

            _instance = this;

            _balance = new ManagerBalance();

            cbBalance.DataSource = _balance.BalanceList;
            cbBalance.DisplayMember = "Nome";
            cbBalance.ValueMember = "Id";
            try
            {

                idBalance = cbBalance.SelectedValue.ToString();
                SetFields(Int32.Parse(idBalance));
            }
            catch(Exception ex)
            {
                ManagerBalance.log.Error(ex.Message);
            }
            
            

        }

        private void MainWindow_Load(object sender, EventArgs e)
        {
            
        }

        private void btnConnect_Click(object sender, EventArgs e)
        {
            try
            {
                if (Int32.Parse(idBalance) > 0)
                {
                    _balance.SelectBalance(Int32.Parse(idBalance));
                    if (!_balance.OpenSelectedBalanceConnection())
                    {
                        txtErrorMessage.Text = _balance.MessageError;
                        ManagerBalance.log.Error(_balance.MessageError);

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
            catch(Exception ex)
            {
                ManagerBalance.log.Error(ex.Message);
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

            try
            {
                if (!string.IsNullOrEmpty(idBalance))
                {
                    if (Regex.IsMatch(idBalance, @"^[0-9]+$"))
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
                    ManagerBalance.log.Error("Scale not found error");
                }
            }
            catch(Exception ex)
            {
                ManagerBalance.log.Error(ex.Message);
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
                try
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
                                    ManagerBalance.log.Error("The model of this scale cannot be shipped");
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
                            ManagerBalance.log.Error("Please select the product");
                            Console.WriteLine("Please select the product");
                        }
                    }
                    else
                    {
                        ManagerBalance.log.Error("An error has occurred, cannot connect to the scale");
                        Console.WriteLine("An error has occurred, cannot connect to the scale");
                    }
                }
                catch(Exception ex)
                {
                    ManagerBalance.log.Error(ex.Message);
                }
                
            }
        }

        private void btnReset_Click(object sender, EventArgs e)
        {
            try
            {
                if (_selected != null)
                {
                    if (!_balance.IsPortAvailable())
                    {
                        txtErrorMessage.Text = _balance.MessageError;
                        if (lblModello.Text.Equals("PX3020"))
                        {
                            ManagerBalance.log.Error("The model of this scale cannot be shipped");
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
                        ManagerBalance.log.Error("An error has occurred, cannot connect to the scale");
                        Console.WriteLine("An error has occurred, cannot connect to the scale");
                    }
                }
            }
            catch(Exception ex)
            {
                ManagerBalance.log.Error(ex.Message);
            }
           
        }

        private void btnTare_Click(object sender, EventArgs e)
        {
            try
            {
                if (_selected != null)
                {
                    if (!_balance.IsPortAvailable())
                    {
                        txtErrorMessage.Text = _balance.MessageError;
                        if (lblModello.Text.Equals("PX3020"))
                        {
                            ManagerBalance.log.Error("The model of this scale cannot be shipped");
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
                        ManagerBalance.log.Error("An error has occurred, cannot connect to the scale");
                        Console.WriteLine("An error has occurred, cannot connect to the scale");
                    }
                }
            }
            catch(Exception ex)
            {
                ManagerBalance.log.Error(ex.Message);
            }
           
        }

        public string GetIdProduct()
        { 
            return idProduct;
        } 
        public void SetWeight(string id, string weight, string sign)
        {
            try
            {
                String name = GetNameProduct(id);
                String[] data = weight.Split('.');
               
                if (data[0].Length > 0)
                {
                    float _min = balanceGauge.MinValue;
                    float _max = balanceGauge.MaxValue;
                    float _value = Int32.Parse(data[0]);
                  
                    
                    if(_value > _max || _min > _value   )
                    {

                        lblAlerta.Invoke(new Action(()=>
                        {
                            lblPesoBalance.Invoke(new Action(() => lblPesoBalance.Text = "0.00"));
                            balanceGauge.Invoke(new Action(() => balanceGauge.Value = 0));
                            detailProduct.Invoke(new Action(() => detailProduct.Text = ""));

                            lblAlerta.Text = string.Format("La pesatura viola i limiti di tolleranza del prodotto {0}.", name);
                            lblAlerta.ForeColor = Color.Red;
                        }));
                        System.Threading.Thread.Sleep(2000);
                        lblAlerta.Invoke(new Action(() => lblAlerta.Text = string.Empty));

                    }
                    else
                    {
                        lblPesoBalance.Invoke(new Action(() => lblPesoBalance.Text = weight + " " + sign.ToUpper()));
                        balanceGauge.Invoke(new Action(() => balanceGauge.Value = _value));
                        detailProduct.Invoke(new Action(() => detailProduct.Text = name.Substring(0, 1).ToUpper() + name.Substring(1) + " - " + weight + " " + sign.ToUpper()));
                    }
                }
                else
                {
                    lblPesoBalance.Invoke(new Action(() => lblPesoBalance.Text = "0.00"));
                    balanceGauge.Invoke(new Action(() => balanceGauge.Value = 0));
                    detailProduct.Invoke(new Action(() => detailProduct.Text = ""));
                }
            }
            catch (Exception ex)
            {
                ManagerBalance.log.Error(ex.Message);
                Console.WriteLine("Error: ", ex.Message);
               
            }  
          
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

        public bool GetMinAndMaxValue(string idProduct)
        {
            bool state = false;
            bool range = true;
            decimal _porcTolerance = 0;
            decimal _rangeRed = 0;
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
                        if(decimal.TryParse(reader.GetString("Tolleranza"), out _porcTolerance))
                        {
                            Tolerance = (int)(maxValue * (_porcTolerance / 100));
                        }
                        else
                        {
                            Tolerance = 0;
                        }
                    }
                    if(Tolerance > 0)
                    {
                        
                        balanceGauge.MinValue = maxValue - (int)Tolerance;
                        balanceGauge.MaxValue = maxValue + (int)Tolerance;                      
                        balanceGauge.RangeStartValue = maxValue - (int)Tolerance;
                        balanceGauge.RangeEndValue = maxValue + (int)Tolerance;
                        _rangeRed = ((maxValue + (int)Tolerance) - (maxValue - (int)Tolerance));
                        int i =11;
                        decimal result;
                        do
                        {
                            i--;
                            result = _rangeRed / i;
                            var r = result.ToString().Length;


                            if (r == 2 || r == 1)
                            {                               
                                range = false;
                            } 

                        } while (range);

                        balanceGauge.ScaleLinesMajorStepValue = i;
                       
                    }
                    else
                    {
                        balanceGauge.MinValue = minValue;
                        balanceGauge.MaxValue = maxValue;
                        balanceGauge.RangeStartValue = minValue;
                        balanceGauge.RangeEndValue = maxValue;
                        _rangeRed = ((maxValue + (int)Tolerance) - (maxValue - (int)Tolerance));
                        int i = 11;
                        decimal result;
                        do
                        {
                            i--;
                            result = _rangeRed / i;
                            var r = result.ToString().Length;


                            if (r == 2 || r == 1)
                            {
                                range = false;
                            }

                        } while (range);

                        balanceGauge.ScaleLinesMajorStepValue = i;

                    }
                    /*
                    balanceGauge.RangesStartValue[0] = (int)porcTolerance;
                    balanceGauge.RangesEndValue[0] = maxValue;
                    balanceGauge.RangesStartValue[1] = 0;
                    balanceGauge.RangesEndValue[1] = (int)(porcTolerance - 1);*/
                    cleanRanges(balanceGauge.RangesStartValue);
                    cleanRanges(balanceGauge.RangesEndValue);
                    balanceGauge.RangesStartValue[0] = balanceGauge.MinValue;
                    balanceGauge.RangesEndValue[0] = balanceGauge.MaxValue;
                    balanceGauge.Value = balanceGauge.MinValue;
                    balanceGauge.Value = 0;
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

        void cleanRanges(float[] range)
        {
            for(int i = 0; i < range.Length; i++)
            {
                range[i] = 0;
            }
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
                catch (Exception ex)
                {
                    ManagerBalance.log.Error(ex.Message);
                    Console.WriteLine(ex.Message);                

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
