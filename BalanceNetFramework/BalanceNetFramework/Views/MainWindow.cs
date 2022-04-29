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
        string nameUnitaMisura;
        int minValue = 0;
        int maxValue = 0;
        decimal Tolerance = 0;
        decimal PesoStandard = 0;
        decimal toleranceMax = 0;
        decimal toleranceMin = 0;
        string weightStandard = "";
        int numeroPesateControllo = 0;
        int numeroControllo = 0;
        int numeroPesata = 0;



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
            catch (Exception ex)
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
            try
            {
                lbMessage.Visible = false;
                btnResetPesare.Visible = false;
                idProduct = cbProduct.SelectedValue.ToString();
                var name = GetNameUnitaMisura(idProduct);
                String[] data = name.Split('-');
                nameUnitaMisura = data[1];
                detailProduct.Text = "";
                lblPesoBalance.Text = "0.00 " + data[1];
                standardPeso.Text = "Peso Standard: " + data[2]+ data[1]; 
                GetMinAndMaxValue(idProduct);
                GetNumberPesateControllo(idProduct);
                if (numeroPesata > 0)
                {
                    repeatPesata.Visible = true;
                }
                else
                {
                    repeatPesata.Visible = false;
                }

                if (numeroPesata == numeroPesateControllo)
                {
                    var message = _balance.GetMessagePesare(idProduct, numeroControllo);
                    if (message.Equals("0"))
                    {
                        lbMessage.Text = "Il peso del prodotto è adecuato. Tutti i pesi sono nel margine di tolleranza.";
                        lbMessage.BackColor = Color.Green;
                        lbMessage.ForeColor = Color.White;
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
                    }
                    lbMessage.Visible = true;
                    btnResetPesare.Visible = true;
                }

            }
            catch (Exception ex)
            {
                ManagerBalance.log.Error(ex.Message);
            }
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
                                if (lblModello.Text.Equals("PX3020"))
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
                        if (lblModello.Text.Equals("PX3020"))
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
                        if (lblModello.Text.Equals("PX3020"))
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


                    if (_value > _max || _min > _value)
                    {

                        lblAlerta.Invoke(new Action(() =>
                        {
                            weightStandard = weight;
                            lblPesoBalance.Invoke(new Action(() => lblPesoBalance.Text = weight + " " + nameUnitaMisura));
                            balanceGauge.Invoke(new Action(() => balanceGauge.Value = Convert.ToInt32(_value)));
                            detailProduct.Invoke(new Action(() => detailProduct.Text = name.Substring(0, 1).ToUpper() + name.Substring(1) + " - " + weight + " " + nameUnitaMisura));

                            lblAlerta.Text = string.Format("Il peso non rispetta il limite consentito per il prodotto {0}.", name);
                            lblAlerta.ForeColor = Color.Red;
                        }));
                        System.Threading.Thread.Sleep(2000);
                        ManagerBalance.log.Error($"Il peso non rispetta il limite consentito per il prodotto {name}.");
                        lblAlerta.Invoke(new Action(() => lblAlerta.Text = string.Empty));

                    }
                    else
                    {
                        weightStandard = weight;
                        lblPesoBalance.Invoke(new Action(() => lblPesoBalance.Text = weight + " " + nameUnitaMisura));
                        balanceGauge.Invoke(new Action(() => balanceGauge.Value = Convert.ToInt32(_value)));
                        detailProduct.Invoke(new Action(() => detailProduct.Text = name.Substring(0, 1).ToUpper() + name.Substring(1) + " - " + weight + " " + nameUnitaMisura));

                    }
                }
                else
                {
                    lblPesoBalance.Invoke(new Action(() => lblPesoBalance.Text = "0.00 " + nameUnitaMisura));
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

        public string GetNameUnitaMisura(string idProduct)
        {
            string name = "";
            string id = "";
            string peso = "";

            try
            {

                string sql = "select p.Id, u.Id_UnitaMisura, u.Nome, p.PesoStandard FROM biltek_bd.prodotto as p INNER JOIN  biltek_bd.unitamisura as u ON p.Id_UnitaMisura=u.Id_UnitaMisura where p.Id=@idProduct";
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
                        peso = reader.GetString("PesoStandard");
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

            return id + "-" + name + "-" + peso;

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
                        if (decimal.TryParse(reader.GetString("PesoStandard"), out _pesoStandard))
                        {
                            PesoStandard = _pesoStandard;
                        }
                        if (decimal.TryParse(reader.GetString("Tolleranza"), out _porcTolerance))
                        {
                            Tolerance = (int)(PesoStandard * (_porcTolerance / 100));
                        }
                        else
                        {
                            Tolerance = 0;
                        }



                    }

                    if (Tolerance > 0)
                    {
                        toleranceMax = PesoStandard + (int)Tolerance;
                        toleranceMin = PesoStandard - (int)Tolerance;

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

        public async Task<bool> GetNumberPesateControllo(string idProduct)
        {
            bool state = false;

            try
            {

                string sql = "SELECT s.NumeroControllo, p.NumeroPesateControllo FROM biltek_bd.schedulercontrollo as s INNER JOIN  biltek_bd.prodotto as p ON s.Id_Prodotto = p.Id WHERE id_prodotto =@idProduct AND DATE_FORMAT(Ora,'%H:%i:%s') <= curtime() order by Ora desc limit 1; ";
                MySqlConnection connectionBD = ConnectionDB.connection();
                connectionBD.Open();

                try
                {
                    MySqlCommand command = new MySqlCommand(sql, connectionBD);
                    command.Parameters.AddWithValue("@idProduct", idProduct);

                    MySqlDataReader reader = (MySqlDataReader)await command.ExecuteReaderAsync();

                    while (reader.Read())
                    {
                        numeroPesateControllo = Int32.Parse(reader.GetString("NumeroPesateControllo"));
                        numeroControllo = Int32.Parse(reader.GetString("NumeroControllo"));

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

                string sqlControllo = "SELECT ifnull(NumeroPesata,0) NumeroPesata FROM biltek_bd.controllopesate WHERE id_prodotto=@idProduct AND DATE_FORMAT(DataOra,'%d:%m:%Y') = DATE_FORMAT(Now(), '%d:%m:%Y') AND Annullato is null AND NumeroControllo=@numberControllo Order by DataOra desc Limit 1; ";
                MySqlConnection connectionBD = ConnectionDB.connection();
                connectionBD.Open();

                try
                {
                    MySqlCommand commandControllo = new MySqlCommand(sqlControllo, connectionBD);
                    commandControllo.Parameters.AddWithValue("@idProduct", idProduct);
                    commandControllo.Parameters.AddWithValue("@numberControllo", numeroControllo);

                    MySqlDataReader readerControllo = (MySqlDataReader)await commandControllo.ExecuteReaderAsync();

                    while (readerControllo.Read())
                    {
                        numeroPesata = Int32.Parse(readerControllo.GetString("NumeroPesata"));

                    }

                    if (readerControllo.HasRows == false)
                    {
                        numeroPesata = 0;
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
                btnPesata.Text = $"Prendere peso di controllo ({numeroPesata}/{numeroPesateControllo})  Controllo ({numeroControllo})";
            }
            else
            {
                btnPesata.Visible = false;
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

        public string GetIdLatestcontrollopesate(string idProduct, int numeroControllo)
        {
            string id = "";
            try
            {

                string sql = "SELECT * FROM biltek_bd.controllopesate WHERE id_prodotto =@idProduct AND NumeroControllo =@numeroControllo AND DATE_FORMAT(DataOra, '%d:%m:%Y') = DATE_FORMAT(Now(), '%d:%m:%Y') AND Annullato is null Order by DataOra desc Limit 1; ";
                MySqlConnection connectionBD = ConnectionDB.connection();
                connectionBD.Open();

                try
                {
                    MySqlCommand command = new MySqlCommand(sql, connectionBD);
                    command.Parameters.AddWithValue("@idProduct", idProduct);
                    command.Parameters.AddWithValue("@numeroControllo", numeroControllo);

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

        private async void button1_Click(object sender, EventArgs e)
        {
            this.Enabled = false;
            decimal _min = toleranceMin;
            decimal _max = toleranceMax;
            decimal pesate = 0;

            if (String.IsNullOrEmpty(weightStandard))
            {
                MessageBox.Show("Non ci sono valori da pesare.");
            }
            else
            {

                if (numeroPesata == numeroPesateControllo)
                {
                    var message = _balance.GetMessagePesare(idProduct, numeroControllo);
                    if (message.Equals("0"))
                    {
                        lbMessage.Text = "Il peso del prodotto è adecuato. Tutti i pesi sono nel margine di tolleranza.";
                        lbMessage.BackColor = Color.Green;
                        lbMessage.ForeColor = Color.White;
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
                    }
                    lbMessage.Visible = true;
                    btnResetPesare.Visible = true;
                }
                else
                {
                    MisurazioneModel _misurazione = new MisurazioneModel();
                    DateTime dataCreazione = DateTime.Now;
                    string dateFormart = dataCreazione.ToString("yy-MM-dd HH:mm:ss");
                    /*_misurazione.Id_Bilancia = Convert.ToInt32(idBalance);
                    _misurazione.Id_Prodotto = Convert.ToInt32(idProduct);
                    _misurazione.Peso = weightStandard;
                    _misurazione.Id_FormulaProdotto = 5;
                    _misurazione.Id_Utente = 1;
                    _misurazione.Active = true;
                    _misurazione.DataCreazione = dateFormart;
                    _balance.InsertMisurazione(_misurazione);*/

                    decimal.TryParse(weightStandard, out pesate);

                    ControlloPesateModel _pesate = new ControlloPesateModel();
                    _pesate.Id_Prodotto = Int32.Parse(idProduct);
                    _pesate.NumeroControllo = numeroControllo;
                    _pesate.DataOra = dateFormart;
                    _pesate.Pesata = weightStandard;
                    _pesate.NumeroPesata = numeroPesata + 1;
                    if (pesate > _max || _min > pesate)
                    {
                        _pesate.Conforme = false;
                    }
                    else
                    {
                        _pesate.Conforme = true;
                    }
                    // _pesate.Annullato= "";
                    _pesate.Active = true;
                    await _balance.InsertControllopesate(_pesate);
                    await GetNumberPesateControllo(idProduct);
                    if (numeroPesata == 0)
                    {
                        repeatPesata.Visible = false;
                    }
                    else
                    {
                        repeatPesata.Visible = true;
                    }

                    if (numeroPesata == numeroPesateControllo)
                    {
                        var message =  _balance.GetMessagePesare(idProduct, numeroControllo);
                        if (message.Equals("0"))
                        {
                            lbMessage.Text = "Il peso del prodotto è adecuato. Tutti i pesi sono nel margine di tolleranza.";
                            lbMessage.BackColor = Color.Green;
                            lbMessage.ForeColor = Color.White;
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
                        }
                        lbMessage.Visible = true;
                        btnResetPesare.Visible = true;
                    }

                }
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
            btnResetPesare.Visible = false;
            if (numeroPesata > 0)
            {
                repeatPesata.Visible = true;
                var idControlloPesate = GetIdLatestcontrollopesate(idProduct, numeroControllo);
                if (_balance.UpdateLastedControlloPesate(idControlloPesate, numeroPesata))
                {
                    GetNumberPesateControllo(idProduct);
                    if (numeroPesata == 0)
                    {
                        repeatPesata.Visible = false;
                    }
                }
            }
            else
            {
                repeatPesata.Visible = false;
            }
            System.Threading.Thread.Sleep(1000);
            this.Enabled = true;

        }

        private void btnResetPesare_Click(object sender, EventArgs e)
        {
            if (_balance.ResetControlloPesate(idProduct, numeroControllo))
            {
                lbMessage.Visible = false;
                btnResetPesare.Visible = false;
                repeatPesata.Visible = false;
                GetNumberPesateControllo(idProduct);
            }

        }
    }
}
