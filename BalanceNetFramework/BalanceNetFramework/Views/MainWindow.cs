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
        private Respuesta _responseToken = new Respuesta();
        private ManagerBalance _balance = null;
        BalanceModel _selected = null;
        //BalanceResultModel _balanceResultModel = new BalanceResultModel();
        public static MainWindow _instance;
        string idProduct;
        string idBalance;
        string nameUnitMeasure;
        int minValue = 0;
        int maxValue = 0;
        decimal tolerance = 0;
        decimal toleranceStart = 0;
        decimal standardWeight = 0;
        decimal toleranceMax = 0;
        decimal toleranceMin = 0;
        string weightReceivedScale = "";
        string codiceLotto = "";
        int numberWeightControl = 0;
        int controlNumber = 0;
        int numberWeight = 0;
        int idLotto = 0;


        //Respuesta responseToken
        public MainWindow()
        {
            InitializeComponent();
            this.CenterToScreen();

            // this.MaximizeBox = false;

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
            catch (Exception ex)
            {
                ManagerBalance.log.Error(ex.Message);
            }

        }

        public async void cargarValoresInicialesAsync(Respuesta responseToken)
        {
            this._responseToken = responseToken;

            // this.MaximizeBox = false;

            _instance = this;

            _balance = new ManagerBalance(responseToken);
            //_balance = new ManagerBalance();
            List<BalanceModel>  balanceList = await _balance.GetConfiguration();
            if (balanceList.Count() > 0)
            {
                cbBalance.DataSource = balanceList;
                cbBalance.DisplayMember = "Nome";
                cbBalance.ValueMember = "Id";
                try
                {

                    idBalance = cbBalance.SelectedValue.ToString();
                    SetFields(Int32.Parse(idBalance));
                }
                catch (Exception ex)
                {
                    ManagerBalance.log.Error(ex.Message);
                }
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
            catch (Exception ex)
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
            //lbWeightBalance.Text = "0.00";
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
                        //lbWeightBalance.Text = "0.00";
                        detailProduct.Text = "";

                    }


                }
                else
                {
                    ManagerBalance.log.Error("Scale not found error.");
                    Console.WriteLine("Scale not found error.");
                }
            }
            catch (Exception ex)
            {
                ManagerBalance.log.Error(ex.Message);
            }


            //handle = !cmb.IsDropDownOpen;
            //Handle();
        }

        private void cbProduct_SelectedIndexChanged(object sender, EventArgs e)
        {

            balanceGauge.Value=0;
            weightReceivedScale = "";
            Reload();
            timer1.Start();

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
                                Console.WriteLine("Please type the command to send.");
                            }
                            else
                            {
                                if (lblModel.Text.Equals("PX3020"))
                                {
                                    ManagerBalance.log.Error("The model of this scale cannot be shipped.");
                                    Console.WriteLine("The model of this scale cannot be shipped.");
                                }
                                else
                                {
                                    Console.WriteLine("Sent command.");
                                    _balance.DataSend(command);
                                }

                            }
                        }
                        else
                        {
                            ManagerBalance.log.Error("Please select the product.");
                            Console.WriteLine("Please select the product.");
                        }
                    }
                    else
                    {
                        ManagerBalance.log.Error("An error has occurred, cannot connect to the scale.");
                        Console.WriteLine("An error has occurred, cannot connect to the scale.");
                    }
                }
                catch (Exception ex)
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
                        if (lblModel.Text.Equals("PX3020"))
                        {
                            ManagerBalance.log.Error("The model of this scale cannot be shipped.");
                            Console.WriteLine("The model of this scale cannot be shipped.");

                        }
                        else
                        {
                            string command = "Z";
                            _balance.DataSend(command);
                            Console.WriteLine("Sent Z.");
                        }

                    }
                    else
                    {
                        ManagerBalance.log.Error("An error has occurred, cannot connect to the scale.");
                        Console.WriteLine("An error has occurred, cannot connect to the scale.");
                    }
                }
            }
            catch (Exception ex)
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
                        if (lblModel.Text.Equals("PX3020"))
                        {
                            ManagerBalance.log.Error("The model of this scale cannot be shipped.");
                            Console.WriteLine("The model of this scale cannot be shipped.");
                        }
                        else
                        {
                            string command = "T";
                            _balance.DataSend(command);
                            Console.WriteLine("Sent T.");
                        }
                    }
                    else
                    {
                        ManagerBalance.log.Error("An error has occurred, cannot connect to the scale.");
                        Console.WriteLine("An error has occurred, cannot connect to the scale.");
                    }
                }
            }
            catch (Exception ex)
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
                    decimal _min = toleranceMin;
                    decimal _max = toleranceMax;
                    decimal _value = Int32.Parse(data[0]);

                    if(_min!=0 && _max != 0)
                    {
                        if (_value > _max || _min > _value)
                        {

                            lbAlert.Invoke(new Action(() =>
                            {
                                weightReceivedScale = weight;
                                //lbWeightBalance.Invoke(new Action(() => lbWeightBalance.Text = weight + " " + nameUnitMeasure));
                                balanceGauge.Invoke(new Action(() => balanceGauge.Value = Convert.ToInt32(_value)));
                                detailProduct.Invoke(new Action(() => detailProduct.Text = name.Substring(0, 1).ToUpper() + name.Substring(1) + " - " + weight + " " + nameUnitMeasure));

                                lbAlert.Text = string.Format("Il peso non rispetta il limite consentito per il prodotto {0}.", name);
                                lbAlert.ForeColor = Color.Red;
                            }));
                            System.Threading.Thread.Sleep(7000);
                            ManagerBalance.log.Error($"Il peso non rispetta il limite consentito per il prodotto {name}.");
                            lbAlert.Invoke(new Action(() => lbAlert.Text = string.Empty));

                        }
                        else
                        {
                            weightReceivedScale = weight;
                            //lbWeightBalance.Invoke(new Action(() => lbWeightBalance.Text = weight + " " + nameUnitMeasure));
                            balanceGauge.Invoke(new Action(() => balanceGauge.Value = Convert.ToInt32(_value)));
                            detailProduct.Invoke(new Action(() => detailProduct.Text = name.Substring(0, 1).ToUpper() + name.Substring(1) + " - " + weight + " " + nameUnitMeasure));

                        }
                    }
                    else
                    {
                        if (_value > maxValue || _min > minValue)
                        {

                            lbAlert.Invoke(new Action(() =>
                            {
                                weightReceivedScale = weight;
                                //lbWeightBalance.Invoke(new Action(() => lbWeightBalance.Text = weight + " " + nameUnitMeasure));
                                balanceGauge.Invoke(new Action(() => balanceGauge.Value = Convert.ToInt32(_value)));
                                detailProduct.Invoke(new Action(() => detailProduct.Text = name.Substring(0, 1).ToUpper() + name.Substring(1) + " - " + weight + " " + nameUnitMeasure));

                                lbAlert.Text = string.Format("Il peso non rispetta il limite consentito per il prodotto {0}.", name);
                                lbAlert.ForeColor = Color.Red;
                            }));
                            System.Threading.Thread.Sleep(7000);
                            ManagerBalance.log.Error($"Il peso non rispetta il limite consentito per il prodotto {name}.");
                            lbAlert.Invoke(new Action(() => lbAlert.Text = string.Empty));

                        }
                        else
                        {
                            weightReceivedScale = weight;
                            //lbWeightBalance.Invoke(new Action(() => lbWeightBalance.Text = weight + " " + nameUnitMeasure));
                            balanceGauge.Invoke(new Action(() => balanceGauge.Value = Convert.ToInt32(_value)));
                            detailProduct.Invoke(new Action(() => detailProduct.Text = name.Substring(0, 1).ToUpper() + name.Substring(1) + " - " + weight + " " + nameUnitMeasure));

                        }

                    }

                 
                }
                else
                {
                    //lbWeightBalance.Invoke(new Action(() => lbWeightBalance.Text = "0.00 " + nameUnitMeasure));
                    balanceGauge.Invoke(new Action(() => balanceGauge.Value = 0));
                    detailProduct.Invoke(new Action(() => detailProduct.Text = ""));
                    ManagerBalance.log.Error("The format sent by the scale is different or incorrect.");
                    Console.WriteLine("Error: The format sent by the scale is different or incorrect.");

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

                string sql = "SELECT * From prodotto WHERE Attivo=1";
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

        public string GetNameUnitMeasure(string idProduct)
        {
            string name = "";
            string id = "";
            string weight = "";

            try
            {

                string sql = "select p.Id, u.Id_UnitaMisura, u.Nome, p.PesoStandard FROM biltek_bd.prodotto as p INNER JOIN  biltek_bd.unitamisura as u ON p.Id_UnitaMisura=u.Id_UnitaMisura where p.Id=@idProduct AND p.Attivo=1 AND u.Attivo=1";
                MySqlConnection connectionBD = ConnectionDB.connection();
                connectionBD.Open();

                try
                {
                    MySqlCommand command = new MySqlCommand(sql, connectionBD);
                    command.Parameters.AddWithValue("@idProduct", idProduct);

                    MySqlDataReader reader = command.ExecuteReader();

                    while (reader.Read())
                    {
                        id = reader.GetString("Id_UnitaMisura");
                        name = reader.GetString("Nome");
                        weight = reader.GetString("PesoStandard");
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

            return id + "-" + name + "-" + weight;

        }

        public bool GetMinAndMaxValue(string idProduct)
        {
            bool state = false;
            bool range = true;
            decimal _porcTolerance = 0;
            decimal _numberRange = 0;
            decimal _pesoStandard = 0;
            try
            {

                string sql = "SELECT * From prodotto WHERE Id=@idProduct AND Attivo=1";
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
                        if (decimal.TryParse(reader.GetString("PesoStandard"), out _pesoStandard))
                        {
                            standardWeight = _pesoStandard;
                        }

                        var hasTolleranza = reader.IsDBNull(reader.GetOrdinal("Tolleranza")) ? false : true;

                        if (hasTolleranza)
                        {
                            if (decimal.TryParse(reader.GetString("Tolleranza"), out _porcTolerance))
                            {
                                tolerance = (int)(standardWeight * (_porcTolerance / 100));
                                toleranceStart = _porcTolerance;
                            }
                            else
                            {
                                tolerance = 0;
                                toleranceStart = 0;
                            }
                        }
                        else
                        {
                            tolerance = 0;
                            toleranceStart = 0;
                        }
                       


                    }

                    if (tolerance > 0)
                    {
                        toleranceMax = standardWeight + (int)tolerance;
                        toleranceMin = standardWeight - (int)tolerance;

                    }
                    else
                    {
                        toleranceMax = 0;
                        toleranceMin = 0;
                    }

                    balanceGauge.MinValue = minValue;
                    balanceGauge.MaxValue = maxValue;
                    balanceGauge.RangeStartValue = minValue;
                    balanceGauge.RangeEndValue = maxValue;
                    _numberRange = (maxValue - minValue);
                    int i = 51;
                    decimal result;
                    do
                    {
                        i--;
                        result = _numberRange / i;
                        var r = result.ToString().Length;


                        if (r == 2 || r == 1)
                        {
                            range = false;
                        }

                    } while (range);

                    balanceGauge.ScaleLinesMajorStepValue = i;
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

        public async Task<bool> GetNumberWeightControl(string idProduct)
        {
            bool state = false;

            try
            {

                string sql = "SELECT s.NumeroControllo, p.NumeroPesateControllo FROM biltek_bd.controlloschedulatore as s INNER JOIN  biltek_bd.prodotto as p ON s.Id_Prodotto = p.Id WHERE s.Attivo=1 AND p.Attivo=1 AND id_prodotto =@idProduct AND DATE_FORMAT(Ora,'%H:%i:%s') <= curtime() order by Ora desc limit 1; ";
                MySqlConnection connectionBD = ConnectionDB.connection();
                connectionBD.Open();

                try
                {
                    MySqlCommand command = new MySqlCommand(sql, connectionBD);
                    command.Parameters.AddWithValue("@idProduct", idProduct);

                    MySqlDataReader reader = (MySqlDataReader)await command.ExecuteReaderAsync();

                    while (reader.Read())
                    {
                        numberWeightControl = Int32.Parse(reader.GetString("NumeroPesateControllo"));
                        controlNumber = Int32.Parse(reader.GetString("NumeroControllo"));

                    }

                    if (reader.HasRows == false)
                    {
                        numberWeightControl = 0;
                        controlNumber = 0;
                    }

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

            try
            {

                string sqlControllo = "SELECT ifnull(NumeroPesata,0) NumeroPesata FROM biltek_bd.controllopeso WHERE Attivo=1 AND id_prodotto=@idProduct AND Ripristina=0 AND DATE_FORMAT(DataOra,'%d:%m:%Y') = DATE_FORMAT(Now(), '%d:%m:%Y') AND Annullato is null AND NumeroControllo=@numberControllo Order by DataOra desc Limit 1; ";
                MySqlConnection connectionBD = ConnectionDB.connection();
                connectionBD.Open();

                try
                {
                    MySqlCommand commandControllo = new MySqlCommand(sqlControllo, connectionBD);
                    commandControllo.Parameters.AddWithValue("@idProduct", idProduct);
                    commandControllo.Parameters.AddWithValue("@numberControllo", controlNumber);

                    MySqlDataReader readerControllo = (MySqlDataReader)await commandControllo.ExecuteReaderAsync();

                    while (readerControllo.Read())
                    {
                        numberWeight = Int32.Parse(readerControllo.GetString("NumeroPesata"));

                    }

                    if (readerControllo.HasRows == false)
                    {
                        numberWeight = 0;
                    }

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

            try
            {

                string sqlLotto = "select * from biltek_bd.lotto where Attivo=1 AND InUso=1 AND Id_Prodotto=@idProduct order by Id desc Limit 1";
                MySqlConnection connectionBD = ConnectionDB.connection();
                connectionBD.Open();

                try
                {
                    MySqlCommand commandLotto = new MySqlCommand(sqlLotto, connectionBD);
                    commandLotto.Parameters.AddWithValue("@idProduct", idProduct);

                    MySqlDataReader readerLotto = (MySqlDataReader)await commandLotto.ExecuteReaderAsync();

                    while (readerLotto.Read())
                    {
                        var hasIdLotto = readerLotto.IsDBNull(readerLotto.GetOrdinal("Id")) ? false : true;
                        if (hasIdLotto)
                        {
                            idLotto = Int32.Parse(readerLotto.GetString("Id"));
                            codiceLotto = readerLotto.GetString("CodiceLotto");
                        }
                        else
                        {
                            idLotto = 0;
                            codiceLotto = "";
                        }

                    }

                    if (readerLotto.HasRows == false)
                    {
                        idLotto = 0;
                    }

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

            if (state)
            {
                btnWeight.Text = $"Prendere peso di controllo ({numberWeight}/{numberWeightControl})  Controllo ({controlNumber})";
            }
            else
            {
                btnWeight.Visible = false;
            }

            return state;

        }

        void cleanRanges(float[] range)
        {
            for (int i = 0; i < range.Length; i++)
            {
                range[i] = 0;
            }
        }
        public string GetNameProduct(string idProduct)
        {
            string name = "";
            try
            {

                string sql = "SELECT * From prodotto WHERE Id=@idProduct AND Attivo=1";
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

        public string GetIdLastWeightControl(string idProduct, int numberControllo)
        {
            string id = "";
            try
            {

                string sql = "SELECT * FROM biltek_bd.controllopeso WHERE Attivo=1 AND id_prodotto =@idProduct AND NumeroControllo =@numberControllo AND DATE_FORMAT(DataOra, '%d:%m:%Y') = DATE_FORMAT(Now(), '%d:%m:%Y') AND Annullato is null Order by DataOra desc Limit 1; ";
                MySqlConnection connectionBD = ConnectionDB.connection();
                connectionBD.Open();

                try
                {
                    MySqlCommand command = new MySqlCommand(sql, connectionBD);
                    command.Parameters.AddWithValue("@idProduct", idProduct);
                    command.Parameters.AddWithValue("@numberControllo", numberControllo);

                    MySqlDataReader reader = command.ExecuteReader();

                    while (reader.Read())
                    {
                        id = reader.GetString("Id");
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

            return id;

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
                lblModel.Text = _selected.NomeModello.ToString();
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

        private async void button1_Click(object sender, EventArgs e)
        {
            this.Enabled = false;
            decimal _min = toleranceMin;
            decimal _max = toleranceMax;
            decimal pesate = 0;

            if (String.IsNullOrEmpty(weightReceivedScale) || weightReceivedScale=="0,00")
            {
                MessageBox.Show("Non ci sono valori da pesare.");
            }
            else
            {
                GetNumberWeightControl(idProduct);             
                if (numberWeight == numberWeightControl && controlNumber != 0)
                {
                    var message = _balance.GetMessageWeight(idProduct, controlNumber);
                    if (message.Equals("0"))
                    {
                        lbMessage.Text = "Il peso del prodotto è adecuato. Tutti i pesi sono nel margine di tolleranza.";
                        lbMessage.BackColor = Color.Green;
                        lbMessage.ForeColor = Color.White;
                        btnLotto.Enabled = true;
                        txtCodiceLotto.Enabled = true;
                        btnCloseLotto.Enabled = false;
                        btnCloseLotto.Enabled = false;
                        btnWeight.Enabled = false;
                        //txtCodiceLotto.Text = "";
                    }
                    else
                    {
                        if (message.Equals("1"))
                        {
                            lbMessage.Text = $"Il peso del prodotto non è adecuato. {message} dei pesi è fuori dal margine di tolleranza.";
                        }
                        else
                        {
                            lbMessage.Text = $"Il peso del prodotto non è adecuato. {message} dei pesi sono fuori dal margine di tolleranza.";
                        }
                        lbMessage.BackColor = Color.Red;
                        lbMessage.ForeColor = Color.White;
                        btnLotto.Enabled = true;
                        txtCodiceLotto.Enabled = true;
                        btnCloseLotto.Enabled = false;
                        btnCloseLotto.Enabled = false;
                        btnWeight.Enabled = false;
                        //txtCodiceLotto.Text = "";
                    }
                    lbMessage.Visible = true;
                    btnResetWeight.Visible = true;
                }
                else
                {
                    if (controlNumber != 0)
                    {
                        MisurazioneModel _misurazione = new MisurazioneModel();
                        DateTime dataCreazione = DateTime.Now;
                        string dateFormart = dataCreazione.ToString("yy-MM-dd HH:mm:ss");
                        _misurazione.Id_Bilancia = Convert.ToInt32(idBalance);
                        _misurazione.Id_Prodotto = Convert.ToInt32(idProduct);
                        _misurazione.Peso = weightReceivedScale;
                        _misurazione.Id_FormulaProdotto = 5;
                        _misurazione.Id_Utente = 3;
                        _misurazione.Attivo = true;
                        _misurazione.DataCreazione = dateFormart;
                        _balance.InsertMeasure(_misurazione);

                        decimal.TryParse(weightReceivedScale, out pesate);

                        ControlloPesateModel _pesate = new ControlloPesateModel();
                        _pesate.Id_Prodotto = Int32.Parse(idProduct);
                        _pesate.NumeroControllo = controlNumber;
                        _pesate.DataOra = dateFormart;
                        _pesate.Pesata = weightReceivedScale;
                        _pesate.NumeroPesata = numberWeight + 1;
                        _pesate.Id_Lotto = idLotto;
                        _pesate.Ripristina = false;

                        if (toleranceMin != 0 && toleranceMax != 0)
                        {
                            if (pesate > _max || _min > pesate)
                            {
                                _pesate.Adatto = false;
                            }
                            else
                            {
                                _pesate.Adatto = true;
                            }
                        }
                        else
                        {
                            if (pesate > maxValue || minValue > pesate)
                            {
                                _pesate.Adatto = false;
                            }
                            else
                            {
                                _pesate.Adatto = true;
                            }
                        }
                     
                        // _pesate.Annullato= "";
                        _pesate.Attivo = true;
                        await _balance.InsertControlWeight(_pesate);
                        await GetNumberWeightControl(idProduct);
                        if (numberWeight == 0)
                        {
                            repeatWeight.Visible = false;
                            txtCodiceLotto.Enabled = false;
                            btnLotto.Enabled = false;
                        }                       
                        else
                        {
                            repeatWeight.Visible = true;
                            //txtCodiceLotto.Enabled = true;
                            //btnLotto.Enabled = true;
                        }

                        if (numberWeight == numberWeightControl && controlNumber != 0)
                        {
                            var message = _balance.GetMessageWeight(idProduct, controlNumber);
                            if (message.Equals("0"))
                            {
                                lbMessage.Text = "Il peso del prodotto è adecuato. Tutti i pesi sono nel margine di tolleranza.";
                                lbMessage.BackColor = Color.Green;
                                lbMessage.ForeColor = Color.White;

                                btnLotto.Enabled = true;
                                txtCodiceLotto.Enabled = true;
                                btnCloseLotto.Enabled = false;
                                btnWeight.Enabled = false;
                                //txtCodiceLotto.Text = "";
                            }
                            else
                            {
                                if (message.Equals("1"))
                                {
                                    lbMessage.Text = $"Il peso del prodotto non è adecuato. {message} dei pesi è fuori dal margine di tolleranza.";
                                }
                                else
                                {
                                    lbMessage.Text = $"Il peso del prodotto non è adecuato. {message} dei pesi sono fuori dal margine di tolleranza.";
                                }
                                lbMessage.BackColor = Color.Red;
                                lbMessage.ForeColor = Color.White;

                                btnLotto.Enabled = true;
                                txtCodiceLotto.Enabled = true;
                                btnCloseLotto.Enabled = false;
                                btnWeight.Enabled = false;
                                //txtCodiceLotto.Text = "";
                            }
                            lbMessage.Visible = true;
                            btnResetWeight.Visible = true;
                        }
                    }


                }
            }

            System.Threading.Thread.Sleep(1000);
            this.Enabled = true;

        }

        public void Reload()
        {
            this.Enabled = false;
            try
            {
                lbMessage.Visible = false;
                btnResetWeight.Visible = false;
                idProduct = cbProduct.SelectedValue.ToString();
                var name = GetNameUnitMeasure(idProduct);
                var nameProduct = GetNameProduct(idProduct);
                String[] data = name.Split('-');
                nameUnitMeasure = data[1];
                if (string.IsNullOrEmpty(weightReceivedScale))
                {
                    weightReceivedScale = "0,00";
                }
                detailProduct.Text = nameProduct.Substring(0, 1).ToUpper() + nameProduct.Substring(1) + " - " +weightReceivedScale + " " + data[1];
                //lbWeightBalance.Text = "0.00 " + data[1];                             
                txtCodiceLotto.Text = "";
                GetMinAndMaxValue(idProduct);
                GetNumberWeightControl(idProduct);
                string weightStandardRemovePoint = data[2].Replace(".", ",");
                string tolereanceRemovePoint = Convert.ToString(toleranceStart).Replace(".", ",");
                lbStandardWeight.Text = "Peso Standard: " + weightStandardRemovePoint + " " + data[1]+ " - " + "Tolleranza: " + tolereanceRemovePoint + " %" + " - " + "Soglia Minima: "+minValue + " " +data[1] + " - " + "Soglia Massima: " + maxValue + " " + data[1];

                if (numberWeight > 0)
                {
                    repeatWeight.Visible = true;
                    txtCodiceLotto.Enabled = false;
                    btnLotto.Enabled = false;
                }
                else
                {
                    repeatWeight.Visible = false;
                    txtCodiceLotto.Enabled = false;
                    btnLotto.Enabled = false;                
                }

                if (idLotto == 0)
                {
                    btnWeight.Enabled = false;
                    txtCodiceLotto.Enabled = true;
                    btnLotto.Enabled = true;
                    btnCloseLotto.Enabled = false;
                }
                else
                {
                    txtCodiceLotto.Text = codiceLotto;
                    btnCloseLotto.Visible = true;
                    btnCloseLotto.Enabled = true;
                    btnWeight.Enabled = true;
                }

                if (numberWeight == numberWeightControl && controlNumber != 0)
                {
                    var message = _balance.GetMessageWeight(idProduct, controlNumber);
                    if (message.Equals("0"))
                    {
                        lbMessage.Text = "Il peso del prodotto è adecuato. Tutti i pesi sono nel margine di tolleranza.";
                        lbMessage.BackColor = Color.Green;
                        lbMessage.ForeColor = Color.White;

                        btnLotto.Enabled = true;
                        txtCodiceLotto.Enabled = true;
                        btnCloseLotto.Enabled = false;
                        btnWeight.Enabled = false;
                        //txtCodiceLotto.Text = "";
                    }
                    else
                    {
                        if (message.Equals("1"))
                        {
                            lbMessage.Text = $"Il peso del prodotto non è adecuato. {message} dei pesi è fuori dal margine di tolleranza.";
                        }
                        else
                        {
                            lbMessage.Text = $"Il peso del prodotto non è adecuato. {message} dei pesi sono fuori dal margine di tolleranza.";
                        }
                        lbMessage.BackColor = Color.Red;
                        lbMessage.ForeColor = Color.White;

                        btnLotto.Enabled = true;
                        txtCodiceLotto.Enabled = true;

                        btnCloseLotto.Enabled = false;
                        btnWeight.Enabled = false;
                        //txtCodiceLotto.Text = "";
                    }
                    lbMessage.Visible = true;
                    btnResetWeight.Visible = true;
                }

            }
            catch (Exception ex)
            {
                ManagerBalance.log.Error(ex.Message);
            }

            System.Threading.Thread.Sleep(1000);
            this.Enabled = true;
        }

        private void balanceGauge_ValueInRangeChanged(object sender, AGaugeApp.AGauge.ValueInRangeChangedEventArgs e)
        {

        }

        private void repeatPesata_Click(object sender, EventArgs e)
        {
            this.Enabled = false;
            lbMessage.Visible = false;
            btnResetWeight.Visible = false;
            if (numberWeight > 0)
            {
                if (numberWeight == numberWeightControl && controlNumber != 0)
                {
                    txtCodiceLotto.Enabled = false;
                    btnLotto.Enabled = false;
                }
                repeatWeight.Visible = true;
                var idControlPeso = GetIdLastWeightControl(idProduct, controlNumber);
                if (_balance.UpdateLastedControlWeight(idControlPeso, numberWeight))
                {
                    Reload();
                    if (numberWeight == 0)
                    {
                        repeatWeight.Visible = false;
                        txtCodiceLotto.Enabled = false;
                        btnLotto.Enabled = false;
                    }
                }
            }
            else
            {
                repeatWeight.Visible = false;
                txtCodiceLotto.Enabled = false;
                btnLotto.Enabled = false;
            }
            System.Threading.Thread.Sleep(1000);
            this.Enabled = true;

        }

        private void btnResetPesare_Click(object sender, EventArgs e)
        {
            if (_balance.ResetControlWeight(idProduct, controlNumber))
            {
                lbMessage.Visible = false;
                btnResetWeight.Visible = false;
                repeatWeight.Visible = false;
               
                txtCodiceLotto.Enabled = false;
                btnLotto.Enabled = false;

                Reload();
                _balance.UpdateLastedLotto(Convert.ToString(idLotto));
            }

        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            Reload();
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            var _codiceLotto = txtCodiceLotto.Text;


            try
            {

                if (numberWeight == numberWeightControl && controlNumber != 0)
                {
                    if (_balance.RepeatControlWeight(idProduct, controlNumber))
                    {
                        lbMessage.Visible = false;
                        btnResetWeight.Visible = false;
                        repeatWeight.Visible = false;
                        //btnWeight.Enabled = false;
                        Reload();
                        btnLotto.Enabled = false;
                        txtCodiceLotto.Enabled = false;
                        //txtCodiceLotto.Text = "";
                    }
                }
                else
                {
                    if (string.IsNullOrEmpty(_codiceLotto))
                    {
                        MessageBox.Show("Inserisci il codice del lotto.");
                    }
                    else
                    {
                        LotteModel _lotte = new LotteModel();
                        _lotte.Id_Prodotto = Convert.ToInt32(idProduct);
                        _lotte.CodiceLotto = _codiceLotto;
                        _lotte.SogliaMinima = minValue;
                        _lotte.SogliaMassima = maxValue;
                        _lotte.Tolleranza = tolerance;
                        _lotte.PesoStandard = standardWeight;
                        _lotte.InUso = true;
                        _lotte.Attivo = true;

                        if (_balance.InsertLotte(_lotte))
                        {
                            Reload();
                            txtCodiceLotto.Enabled = false;
                            btnLotto.Enabled = false;
                            btnWeight.Enabled = true;
                            Console.WriteLine("record salvato con successo");
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                ManagerBalance.log.Error(ex.Message);
            }

        }

        private void btnCloseLotto_Click(object sender, EventArgs e)
        {
            if (_balance.RepeatControlWeight(idProduct, controlNumber))
            {
                lbMessage.Visible = false;
                btnResetWeight.Visible = false;
                repeatWeight.Visible = false;
                //btnWeight.Enabled = false;
                _balance.CloseLotto(Convert.ToString(idLotto));
                Reload();
                //btnLotto.Enabled = true;
                //txtCodiceLotto.Enabled = true;
                txtCodiceLotto.Text = "";
                btnCloseLotto.Visible = false;
                btnWeight.Enabled = false;

                Console.WriteLine(Convert.ToString(numberWeight), numberWeightControl, controlNumber);
                //txtCodiceLotto.Text = "";
            }
        }
    }
}
