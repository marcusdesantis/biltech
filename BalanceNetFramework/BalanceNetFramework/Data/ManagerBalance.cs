using BalanceNetFramework.Models;
using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.IO.Ports;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Threading.Tasks;

namespace BalanceNetFramework.Data
{
    public class ManagerBalance
    {
        public Respuesta _responseToken = new Respuesta();
        public static readonly log4net.ILog log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        List<BalanceModel> _balanceList = new List<BalanceModel>();

        List<ProdottoModel> _productList;
        BalanceModel _balanceSelected = null;

        String _messageError = string.Empty;
        SerialPort serialPort1;
        string dataValue = null;
        bool _error = false;

        BalanceResultModel _balanceResultModel = new BalanceResultModel();
        MisurazioneModel _misurazione = new MisurazioneModel();

        public BalanceResultModel BalanceResult
        {
            get
            {
                return _balanceResultModel;
            }
        }
        public bool Error
        {
            get
            {
                return _error;
            }
        }
        public string MessageError
        {
            get
            {
                return _messageError;
            }
        }

        public List<BalanceModel> BalanceList
        {
            get
            {
                return _balanceList;
            }
        }

        public List<ProdottoModel> ProductList
        {
            get
            {
                return _productList;
            }
        }

        //Respuesta responseToken
        public ManagerBalance()
        {
            LoadDataConfigurationBalanceDB();
            // _responseToken = responseToken;
            //loadDataConfigurationBalanceJson(configFilePath);

        }

        private Parity Integer2Parity(int parity)
        {
            Parity _parity = Parity.None;

            switch (parity)
            {
                case 0:
                    _parity = Parity.None;
                    break;
                case 1:
                    _parity = Parity.Odd;
                    break;
                case 2:
                    _parity = Parity.Even;
                    break;
                case 3:
                    _parity = Parity.Mark;
                    break;
                case 4:
                    _parity = Parity.Space;
                    break;
                default:
                    break;
            }

            return _parity;
        }

        public async void GetConfiguration()
        {
            bool retval = await LoadDataConfigurationBalanceRemote();
        }
        private StopBits Integer2StopBits(int stopBits)
        {
            StopBits _stopBits = StopBits.None;

            switch (stopBits)
            {
                case 0:
                    _stopBits = StopBits.None;
                    break;
                case 1:
                    _stopBits = StopBits.One;
                    break;
                case 2:
                    _stopBits = StopBits.Two;
                    break;
                case 3:
                    _stopBits = StopBits.OnePointFive;
                    break;
                default:
                    break;
            }

            return _stopBits;
        }

        private Handshake Integer2HandShake(int handShake)
        {
            Handshake _handShake = Handshake.None;

            switch (handShake)
            {
                case 0:
                    _handShake = Handshake.None;
                    break;
                case 1:
                    _handShake = Handshake.XOnXOff;
                    break;
                case 2:
                    _handShake = Handshake.RequestToSend;
                    break;
                case 3:
                    _handShake = Handshake.RequestToSendXOnXOff;
                    break;
                default:
                    break;
            }

            return _handShake;
        }

        public bool OpenSelectedBalanceConnection()
        {
            bool retVal = false;
            if (_balanceSelected != null && serialPort1 != null)
            {
                if (!serialPort1.IsOpen)
                {
                    try
                    {
                        serialPort1.Open();
                        retVal = true;
                    }
                    catch (Exception ex)
                    {
                        _error = true;
                        serialPort1.Close();
                        _messageError = ex.Message;
                    }
                }
                else
                {
                    serialPort1.Close();
                }
            }
            return retVal;
        }

        public void ClosSelectedBalanceConnection()
        {
            if (serialPort1 != null && serialPort1.IsOpen)
            {
                serialPort1.Close();
                serialPort1.Dispose();
            }
        }

        public bool IsPortAvailable()
        {
            bool retVal = false;
            if (_balanceSelected != null && serialPort1 != null && serialPort1.IsOpen)
            {
                try
                {
                    //serialPort1.Write(_balanceSelected.CommandForWeight);
                    _error = false;
                    _messageError = string.Empty;
                }
                catch (Exception ex)
                {
                    _error = true;
                    _messageError = ex.Message;
                    ManagerBalance.log.Error(ex.Message);
                }
            }

            return retVal;
        }


        public void LoadDataConfigurationBalance(BalanceModel balanceModel)
        {
            try
            {

                serialPort1 = new SerialPort(balanceModel.PortCOM, balanceModel.BaudRate, Integer2Parity(balanceModel.Parity), balanceModel.DataBits, Integer2StopBits(balanceModel.StopBit));

                serialPort1.Handshake = Integer2HandShake(balanceModel.HandShake);
                serialPort1.DataReceived += new SerialDataReceivedEventHandler(DataReceived);
                serialPort1.ReadTimeout = 500;
                serialPort1.WriteTimeout = 500;

            }
            catch (Exception ex)
            {
                ManagerBalance.log.Error(ex.Message);
                _messageError = ex.Message;
            }
        }


        public void DataSend(String command)
        {
            Thread.Sleep(500);
            try
            {
                serialPort1.WriteLine(command);

            }
            catch (Exception ex)
            {
                ManagerBalance.log.Error(ex.Message);
                Console.WriteLine("Error: " + ex.Message);
            }


        }

        private void DataReceived(object sender, SerialDataReceivedEventArgs e)
        {
            Thread.Sleep(500);

            dataValue = serialPort1.ReadExisting();

            if (!string.IsNullOrEmpty(dataValue) && !dataValue.Equals("\n"))
            {


                string idProdotto = Convert.ToString(MainWindow._instance.GetIdProduct());

                if (!idProdotto.Equals("") && !idProdotto.Equals("0"))
                {

                    try
                    {


                        /*String name;
                        String[] netWeight;

                        String[] data = CodeToArray(dataValue);

                        name = GetBalanceName(data);
                        netWeight = GetBalanceWeight(data);*/

                        /*DateTime dataCreazione = DateTime.Now;
                        string dateFormart = dataCreazione.ToString("yy-MM-dd HH:mm:ss");

                        _misurazione.Id_Bilancia = 4;
                        _misurazione.Id_Prodotto = Int32.Parse(idProdotto);
                        _misurazione.Peso = netWeight[0];
                        _misurazione.Id_FormulaProdotto = 5;
                        _misurazione.Attivo = true;
                        _misurazione.DataCreazione = dateFormart;*/
                        String[] weight = GetDataBalance(dataValue);
                        MainWindow._instance.SetWeight(idProdotto, weight[0], weight[1]);
                    }
                    catch (Exception ex)
                    {
                        ManagerBalance.log.Error(ex.Message);
                        Console.WriteLine("Error: ", ex.Message);
                    }

                    /*if (InsertMisurazione(_misurazione))
                        {

                        Console.WriteLine("Name Bilancia: " + name);
                        Console.WriteLine("Net Weight: " + netWeight[0]);

                    }
                    else
                    {
                        Console.WriteLine("Error inserting");
                    }*/

                }
                else
                {
                    ManagerBalance.log.Error("Please select the prodotto.");
                    Console.WriteLine("Please select the prodotto.");
                }

            }
            else
            {
                _error = true;
                _messageError = "";
                ManagerBalance.log.Error("The balance information is empty.");
                Console.WriteLine("The balance information is empty.");
            }
        }

        public bool SelectBalance(int idBalance)
        {
            bool retVal = false;

            if (_balanceList != null)
            {
                if (_balanceList.Count > 0)
                {

                    BalanceModel _balance = _balanceList.Where(x => x.Id.Equals(idBalance)).FirstOrDefault();
                    if (_balance != null)
                    {
                        _balanceSelected = _balance;
                        LoadDataConfigurationBalance(_balanceSelected);
                        retVal = true;
                    }
                    else
                    {
                        ManagerBalance.log.Error("It is not possible to obtain information about your configuration.");
                        _messageError = "It is not possible to obtain information about your configuration.";
                    }
                }
            }
            return retVal;
        }

        public async Task<bool> LoadDataConfigurationBalanceRemote()
        {
            bool state = false;
            string _Url = @"http://localhost:5030/";
            HttpClient _client = new HttpClient();
            _client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", _responseToken.response.token);

            //HttpResponseMessage response = await _client.PostAsync("api/Bilancia/GetConfig", new StringContent("", Encoding.UTF8, "application/json"));
            HttpResponseMessage response = await _client.GetAsync("api/Bilancia/GetConfig/");

            var responseContent = await response.Content.ReadAsStringAsync();
            var contentResponse = JsonConvert.DeserializeObject<Respuesta>(responseContent);

            return state;

        }
        public bool LoadDataConfigurationBalanceDB()
        {
            bool state = false;

            try
            {

                string sql = "SELECT b.Id, b.Nome, b.Codice, b.PortCOM, b.BaudRate, b.DataBits, b.Parity, b.StopBit, b.HandShake, b.CommandForWeight, b.WeightConversion, m.Id as IdModello , m.Nome as NomeModello FROM bilancia as b INNER JOIN modello as m ON b.Id_Modello = m.Id WHERE b.Attivo=1 AND m.Attivo=1";
                MySqlConnection connectionBD = ConnectionDB.connection();
                connectionBD.Open();

                try
                {
                    MySqlCommand command = new MySqlCommand(sql, connectionBD);

                    MySqlDataReader reader = command.ExecuteReader();

                    while (reader.Read())
                    {
                        BalanceModel b = new BalanceModel();
                        b.Id = Int32.Parse(reader.GetString("Id"));
                        b.Nome = reader.GetString("Nome");
                        b.Codice = reader.GetString("Codice");
                        b.PortCOM = reader.GetString("PortCOM");
                        b.BaudRate = Int32.Parse(reader.GetString("BaudRate"));
                        b.DataBits = Int32.Parse(reader.GetString("DataBits"));
                        b.Parity = Int32.Parse(reader.GetString("Parity"));
                        b.StopBit = Int32.Parse(reader.GetString("StopBit"));
                        b.HandShake = Int32.Parse(reader.GetString("HandShake"));
                        b.CommandForWeight = reader.GetString("CommandForWeight");
                        b.WeightConversion = Decimal.Parse(reader.GetString("WeightConversion"));
                        b.IdModello = Int32.Parse(reader.GetString("IdModello"));
                        b.NomeModello = reader.GetString("NomeModello");
                        _balanceList.Add(b);
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

            return state;
        }
        public bool InsertMeasure(MisurazioneModel measure)
        {
            bool state = false;
            try
            {

                string sql = "INSERT INTO misurazione (Id_Bilancia, Id_Prodotto, Peso, Id_FormulaProdotto, Id_Utente, Attivo, DataCreazione) VALUES (@idBilancia,@idProdotto,@peso,@idFormulaProdotto,@idUtente,@active,@date)";

                MySqlConnection connectionBD = ConnectionDB.connection();
                connectionBD.Open();

                try
                {
                    MySqlCommand command = new MySqlCommand(sql, connectionBD);
                    command.Parameters.AddWithValue("@idBilancia", measure.Id_Bilancia);
                    command.Parameters.AddWithValue("@idProdotto", measure.Id_Prodotto);
                    command.Parameters.AddWithValue("@peso", measure.Peso);
                    command.Parameters.AddWithValue("@idFormulaProdotto", measure.Id_FormulaProdotto);
                    command.Parameters.AddWithValue("@idUtente", measure.Id_Utente);
                    command.Parameters.AddWithValue("@active", measure.Attivo);
                    command.Parameters.AddWithValue("@date", measure.DataCreazione);

                    command.ExecuteNonQuery();
                    Console.WriteLine("Insert Success");

                    state = true;

                }
                catch (Exception ex)
                {
                    ManagerBalance.log.Error(ex.Message);
                    Console.WriteLine("Insert Error: " + ex.Message);
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

        public async Task<bool> InsertControlWeight(ControlloPesateModel controlWeight)
        {
            bool state = false;
            try
            {

                string sql = "INSERT INTO controllopeso (Id_Prodotto, Id_Lotto, NumeroControllo, DataOra, Pesata, NumeroPesata, Adatto, Annullato, Ripristina,Attivo) VALUES (@Id_Prodotto, @Id_Lotto, @NumeroControllo, @DataOra, @Pesata, @NumeroPesata, @Adatto, @Annullato, @Ripristina, @Attivo)";

                MySqlConnection connectionBD = ConnectionDB.connection();
                connectionBD.Open();

                try
                {
                    MySqlCommand command = new MySqlCommand(sql, connectionBD);
                    command.Parameters.AddWithValue("@Id_Prodotto", controlWeight.Id_Prodotto);
                    command.Parameters.AddWithValue("@Id_Lotto", controlWeight.Id_Lotto);
                    command.Parameters.AddWithValue("@NumeroControllo", controlWeight.NumeroControllo);
                    command.Parameters.AddWithValue("@DataOra", controlWeight.DataOra);
                    command.Parameters.AddWithValue("@Pesata", controlWeight.Pesata);
                    command.Parameters.AddWithValue("@NumeroPesata", controlWeight.NumeroPesata);
                    command.Parameters.AddWithValue("@Adatto", controlWeight.Adatto);
                    command.Parameters.AddWithValue("@Annullato", controlWeight.Annullato);
                    command.Parameters.AddWithValue("@Ripristina", controlWeight.Ripristina);
                    command.Parameters.AddWithValue("@Attivo", controlWeight.Attivo);

                    await command.ExecuteNonQueryAsync();
                    Console.WriteLine("Insert Success");

                    state = true;

                }
                catch (Exception ex)
                {
                    ManagerBalance.log.Error(ex.Message);
                    Console.WriteLine("Insert Error: " + ex.Message);
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

        public bool InsertLotte(LotteModel lotte)
        {
            bool state = false;
            try
            {

                string sql = "INSERT INTO lotto (Id_Prodotto, CodiceLotto, SogliaMinima, SogliaMassima, Tolleranza, PesoStandard, Attivo) VALUES (@Id_Prodotto, @CodiceLotto, @SogliaMinima, @SogliaMassima, @Tolleranza, @PesoStandard, @Attivo);";

                MySqlConnection connectionBD = ConnectionDB.connection();
                connectionBD.Open();

                try
                {
                    MySqlCommand command = new MySqlCommand(sql, connectionBD);
                    command.Parameters.AddWithValue("@Id_Prodotto", lotte.Id_Prodotto);
                    command.Parameters.AddWithValue("@CodiceLotto", lotte.CodiceLotto);
                    command.Parameters.AddWithValue("@SogliaMinima", lotte.SogliaMinima);
                    command.Parameters.AddWithValue("@SogliaMassima", lotte.SogliaMassima);
                    command.Parameters.AddWithValue("@Tolleranza", lotte.Tolleranza);
                    command.Parameters.AddWithValue("@PesoStandard", lotte.PesoStandard);
                    command.Parameters.AddWithValue("@Attivo", lotte.Attivo);

                    command.ExecuteNonQuery();
                    Console.WriteLine("Insert Success");

                    state = true;

                }
                catch (Exception ex)
                {
                    ManagerBalance.log.Error(ex.Message);
                    Console.WriteLine("Insert Error: " + ex.Message);
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

        public bool UpdateLastedControlWeight(string id, int numberWeight)
        {
            bool state = false;
            try
            {

                string sql = "update biltek_bd.controllopeso set Annullato=@annullato, NumeroPesata=@numberWeight, Attivo=@active where Id=@id";

                MySqlConnection connectionBD = ConnectionDB.connection();
                connectionBD.Open();

                DateTime dataCreazione = DateTime.Now;
                string dateFormart = dataCreazione.ToString("yy-MM-dd HH:mm:ss");

                try
                {
                    MySqlCommand command = new MySqlCommand(sql, connectionBD);
                    command.Parameters.AddWithValue("@id", id);
                    command.Parameters.AddWithValue("@Annullato", dateFormart);
                    command.Parameters.AddWithValue("@numberWeight", numberWeight - 1);
                    command.Parameters.AddWithValue("@active", 0);

                    command.ExecuteNonQuery();
                    Console.WriteLine("update Success");

                    state = true;

                }
                catch (Exception ex)
                {
                    ManagerBalance.log.Error(ex.Message);
                    Console.WriteLine("Insert Error: " + ex.Message);
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

        public bool UpdateLastedLotto(string id)
        {
            bool state = false;
            try
            {

                string sql = "update biltek_bd.lotto set Attivo=1 where Id=@id";

                MySqlConnection connectionBD = ConnectionDB.connection();
                connectionBD.Open();

                try
                {
                    MySqlCommand command = new MySqlCommand(sql, connectionBD);
                    command.Parameters.AddWithValue("@id", id);

                    command.ExecuteNonQuery();
                    Console.WriteLine("update Success");

                    state = true;

                }
                catch (Exception ex)
                {
                    ManagerBalance.log.Error(ex.Message);
                    Console.WriteLine("Insert Error: " + ex.Message);
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

        public bool ResetControlWeight(string id, int numberControl)
        {
            bool state = false;
            try
            {

                string sql = "update biltek_bd.controllopeso set Annullato=@annulla, Attivo=@active WHERE Id_Prodotto=@idProduct and NumeroControllo=@numberControl and DATE_FORMAT(DataOra,'%d:%m:%Y') = DATE_FORMAT(Now(), '%d:%m:%Y') and Annullato is null; ";

                MySqlConnection connectionBD = ConnectionDB.connection();
                connectionBD.Open();

                DateTime dataCreazione = DateTime.Now;
                string dateFormart = dataCreazione.ToString("yy-MM-dd HH:mm:ss");

                try
                {
                    MySqlCommand command = new MySqlCommand(sql, connectionBD);
                    command.Parameters.AddWithValue("@annulla", dateFormart);
                    command.Parameters.AddWithValue("@active", 0);
                    command.Parameters.AddWithValue("@idProduct", id);
                    command.Parameters.AddWithValue("@numberControl", numberControl);

                    command.ExecuteNonQuery();
                    Console.WriteLine("update Success");

                    state = true;

                }
                catch (Exception ex)
                {
                    ManagerBalance.log.Error(ex.Message);
                    Console.WriteLine("Insert Error: " + ex.Message);
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

        public bool RepeatControlWeight(string id, int numberControl)
        {
            bool state = false;
            try
            {

                string sql = "update biltek_bd.controllopeso set Ripristina=@Ripristina WHERE Id_Prodotto=@idProduct and NumeroControllo=@numberControl and DATE_FORMAT(DataOra,'%d:%m:%Y') = DATE_FORMAT(Now(), '%d:%m:%Y') and Annullato is null; ";

                MySqlConnection connectionBD = ConnectionDB.connection();
                connectionBD.Open();

                DateTime dataCreazione = DateTime.Now;
                string dateFormart = dataCreazione.ToString("yy-MM-dd HH:mm:ss");

                try
                {
                    MySqlCommand command = new MySqlCommand(sql, connectionBD);
                    command.Parameters.AddWithValue("@Ripristina", 1);
                    command.Parameters.AddWithValue("@idProduct", id);
                    command.Parameters.AddWithValue("@numberControl", numberControl);

                    command.ExecuteNonQuery();
                    Console.WriteLine("update Success");

                    state = true;

                }
                catch (Exception ex)
                {
                    ManagerBalance.log.Error(ex.Message);
                    Console.WriteLine("Insert Error: " + ex.Message);
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

        public string GetMessageWeight(string idProduct, int numberControl)
        {
            string message = "";
            try
            {

                string sql = "SELECT count(* ) nonAdatto FROM biltek_bd.controllopeso WHERE Attivo=1 AND id_prodotto =@idProduct and Annullato is null and Adatto = 0 and NumeroControllo=@numberControl and DATE_FORMAT(DataOra,'%d:%m:%Y') = DATE_FORMAT(Now(), '%d:%m:%Y'); ";

                MySqlConnection connectionBD = ConnectionDB.connection();
                connectionBD.Open();

                try
                {
                    MySqlCommand command = new MySqlCommand(sql, connectionBD);
                    command.Parameters.AddWithValue("@idProduct", idProduct);
                    command.Parameters.AddWithValue("@numberControl", numberControl);

                    MySqlDataReader reader = command.ExecuteReader();

                    while (reader.Read())
                    {
                        message = reader.GetString("nonAdatto");
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

            return message;

        }

        public static string GetIdProdotto(string name)
        {
            string id = "0";
            try
            {

                string sql = "SELECT Id From prodotto WHERE Attivo=1 AND Nome=@name";
                MySqlConnection connectionBD = ConnectionDB.connection();
                connectionBD.Open();

                try
                {
                    MySqlCommand command = new MySqlCommand(sql, connectionBD);
                    command.Parameters.AddWithValue("@name", name);
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

        public DataTable GetReport(DateTime fromDate, DateTime toDate, int? idBalance, int? idProduct)
        {


            MySqlConnection connectionBD = ConnectionDB.connection();
            var table = new DataTable();

            try
            {
                connectionBD.Open();
                int option = ReportWindow._instance.GetOption();

                switch (option)
                {
                    case 1:
                        string sql = "SELECT m.Id,p.Nome, m.Peso, m.DataCreazione FROM misurazione as m INNER JOIN prodotto as p ON m.Id_Prodotto = p.Id WHERE p.Attivo=1 AND m.Attivo=1 AND m.DataCreazione BETWEEN @fromDate AND DATE_ADD(@toDate, INTERVAL 1 DAY)";
                        MySqlCommand command = new MySqlCommand(sql, connectionBD);
                        command.Parameters.AddWithValue("@fromDate", fromDate.ToString("yyyy-MM-dd"));
                        command.Parameters.AddWithValue("@toDate", toDate.ToString("yyyy-MM-dd"));
                        var reader = command.ExecuteReader();
                        table.Load(reader);
                        reader.Dispose();
                        break;

                    case 2:
                        string sql1 = "SELECT m.Id,p.Nome, m.Peso, m.DataCreazione FROM misurazione as m INNER JOIN prodotto as p ON m.Id_Prodotto = p.Id WHERE m.Id_Bilancia=@idBilancia AND p.Attivo=1 AND m.Attivo=1";
                        MySqlCommand command1 = new MySqlCommand(sql1, connectionBD);
                        command1.Parameters.AddWithValue("@idBilancia", idBalance);
                        var reader1 = command1.ExecuteReader();
                        table.Load(reader1);
                        reader1.Dispose();
                        break;

                    case 3:
                        string sql2 = "SELECT m.Id,p.Nome, m.Peso, m.DataCreazione FROM misurazione as m INNER JOIN prodotto as p ON m.Id_Prodotto = p.Id WHERE m.Id_Prodotto=@idProdotto AND p.Attivo=1 AND m.Attivo=1";
                        MySqlCommand command2 = new MySqlCommand(sql2, connectionBD);
                        command2.Parameters.AddWithValue("@idProdotto", idProduct);
                        var reader2 = command2.ExecuteReader();
                        table.Load(reader2);
                        reader2.Dispose();
                        break;

                    case 4:
                        string sql3 = "SELECT m.Id,p.Nome, m.Peso, m.DataCreazione FROM misurazione as m INNER JOIN prodotto as p ON m.Id_Prodotto = p.Id WHERE m.Id_Bilancia=@idBilancia AND m.Id_Prodotto=@idProdotto AND p.Attivo=1 AND m.Attivo=1";
                        MySqlCommand command3 = new MySqlCommand(sql3, connectionBD);
                        command3.Parameters.AddWithValue("@idBilancia", idBalance);
                        command3.Parameters.AddWithValue("@idProdotto", idProduct);
                        var reader3 = command3.ExecuteReader();
                        table.Load(reader3);
                        reader3.Dispose();
                        break;

                    case 5:
                        string sql4 = "SELECT m.Id,p.Nome, m.Peso, m.DataCreazione FROM misurazione as m INNER JOIN prodotto as p ON m.Id_Prodotto = p.Id WHERE m.Id_Bilancia=@idBilancia AND m.DataCreazione BETWEEN @fromDate AND DATE_ADD(@toDate, INTERVAL 1 DAY) AND p.Attivo=1 AND m.Attivo=1";
                        MySqlCommand command4 = new MySqlCommand(sql4, connectionBD);
                        command4.Parameters.AddWithValue("@idBilancia", idBalance);
                        command4.Parameters.AddWithValue("@fromDate", fromDate.ToString("yyyy-MM-dd"));
                        command4.Parameters.AddWithValue("@toDate", toDate.ToString("yyyy-MM-dd"));
                        var reader4 = command4.ExecuteReader();
                        table.Load(reader4);
                        reader4.Dispose();
                        break;

                    case 6:
                        string sql5 = "SELECT m.Id,p.Nome, m.Peso, m.DataCreazione FROM misurazione as m INNER JOIN prodotto as p ON m.Id_Prodotto = p.Id WHERE m.Id_Prodotto=@idProdotto AND m.DataCreazione BETWEEN @fromDate AND DATE_ADD(@toDate, INTERVAL 1 DAY) AND p.Attivo=1 AND m.Attivo=1";
                        MySqlCommand command5 = new MySqlCommand(sql5, connectionBD);
                        command5.Parameters.AddWithValue("@idProdotto", idProduct);
                        command5.Parameters.AddWithValue("@fromDate", fromDate.ToString("yyyy-MM-dd"));
                        command5.Parameters.AddWithValue("@toDate", toDate.ToString("yyyy-MM-dd"));
                        var reader5 = command5.ExecuteReader();
                        table.Load(reader5);
                        reader5.Dispose();
                        break;

                    case 7:
                        string sql6 = "SELECT m.Id,p.Nome, m.Peso, m.DataCreazione FROM misurazione as m INNER JOIN prodotto as p ON m.Id_Prodotto = p.Id WHERE m.Id_Bilancia=@idBilancia AND m.Id_Prodotto=@idProdotto AND m.DataCreazione BETWEEN @fromDate AND DATE_ADD(@toDate, INTERVAL 1 DAY) AND p.Attivo=1 AND m.Attivo=1";
                        MySqlCommand command6 = new MySqlCommand(sql6, connectionBD);
                        command6.Parameters.AddWithValue("@idBilancia", idBalance);
                        command6.Parameters.AddWithValue("@idProdotto", idProduct);
                        command6.Parameters.AddWithValue("@fromDate", fromDate.ToString("yyyy-MM-dd"));
                        command6.Parameters.AddWithValue("@toDate", toDate.ToString("yyyy-MM-dd"));
                        var reader6 = command6.ExecuteReader();
                        table.Load(reader6);
                        reader6.Dispose();
                        break;

                    default:
                        break;
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

            return table;

        }

        public static String[] CodeToArray(String value)
        {
            String[] array = new string[3];
            try
            {
                String code = value;
                code = code.Replace(" ", "");
                code = code.Replace("\r\n", "|");
                code = code.Replace("\\r\\n", "|");
                String[] data = code.Split('|');

                foreach (var sub in data)
                {
                    if (sub.StartsWith("NomeBilancia"))
                    {
                        array[0] = sub;
                    }

                    if (sub.StartsWith("Netto"))
                    {
                        array[1] = sub;
                    }
                    Console.WriteLine($"Data: {sub}");
                }
            }
            catch (Exception ex)
            {
                ManagerBalance.log.Error(ex.Message);

            }

            return array;
        }

        public static String GetBalanceName(String[] data)
        {
            string name = "";
            try
            {
                if (data[0] != null)
                {
                    name = data[0].Replace(":", ": ");
                    name = name.Replace("NomeBilancia:", "");
                }

            }
            catch (Exception ex)
            {
                ManagerBalance.log.Error(ex.Message);

            }
            return name;
        }

        public static String[] GetBalanceWeight(String[] data)
        {
            String[] array = new string[2];
            try
            {
                if (data[1] != null)
                {
                    string weight = data[1].Replace("Netto:", "");

                    var resultWeight = Regex.Match(weight, @"(\d+(\.\d+)?)|(\.\d+)").Value;
                    var resulSymbol = new String(weight.SkipWhile(p => !Char.IsLetter(p)).ToArray());

                    array[0] = resultWeight;
                    array[1] = resulSymbol;
                }

            }
            catch (Exception ex)
            {
                ManagerBalance.log.Error(ex.Message);

            }
            return array;
        }

        public static String[] GetDataBalance(String value)
        {
            String[] array = new string[2];
            var resultWeight = "";
            var resulSymbol = "";
            try
            {
                String data = value;
                data = data.Replace(" ", "");
                data = data.Replace("\r\n", "");
                data = data.Replace("\\r\\n", "");
                data = data.Replace("S", "");
                data = data.Replace("s", "");
                data = data.Replace("?", "");
                data = data.Replace("R", "");

                resultWeight = Regex.Match(data, @"(\d+(\.\d+)?)|(\.\d+)").Value;
                resulSymbol = new String(data.SkipWhile(p => !Char.IsLetter(p)).ToArray());

                array[0] = resultWeight;
                array[1] = resulSymbol;

            }
            catch (Exception ex)
            {
                ManagerBalance.log.Error(ex.Message);
                Console.WriteLine("Error: ", ex.Message);
            }
            return array;
        }
    }
}
