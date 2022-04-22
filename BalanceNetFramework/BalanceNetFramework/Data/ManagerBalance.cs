using BalanceNetFramework.Models;
using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.IO.Ports;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Threading.Tasks;

namespace BalanceNetFramework.Data
{
    public class ManagerBalance
    {

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

        public ManagerBalance()
        {

            //loadDataConfigurationBalanceJson(configFilePath);
            LoadDataConfigurationBalanceDB();

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


        public void loadDataConfigurationBalance(BalanceModel balanceModel)
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
                        _misurazione.Active = true;
                        _misurazione.DataCreazione = dateFormart;*/
                        String[] weight = GetDataBalance(dataValue);
                        MainWindow._instance.SetWeight(idProdotto, weight[0], weight[1]);
                    }
                    catch (Exception ex)
                    {
                        ManagerBalance.log.Error(ex.Message);
                        Console.WriteLine("Error: ", ex.Message);
                        /*System.IO.StreamWriter sr = new System.IO.StreamWriter("error.log", true);
                        sr.WriteLine(ex.Message);*/

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
                        loadDataConfigurationBalance(_balanceSelected);
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

        public bool LoadDataConfigurationBalanceDB()
        {
            bool state = false;

            try
            {

                string sql = "SELECT b.Id, b.Nome, b.Codice, b.PortCOM, b.BaudRate, b.DataBits, b.Parity, b.StopBit, b.HandShake, b.CommandForWeight, b.WeightConversion, m.Id as IdModello , m.Nome as NomeModello FROM bilancia as b INNER JOIN modello as m ON b.Id_Modello = m.Id";
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
        public static bool InsertMisurazione(MisurazioneModel misurazione)
        {
            bool state = false;
            try
            {

                string sql = "INSERT INTO misurazione (Id_Bilancia, Id_Prodotto, Peso, Id_FormulaProdotto, Active, DataCreazione) VALUES (@idBilancia,@idProdotto,@peso,@idFormulaProdotto,@active,@date)";

                MySqlConnection connectionBD = ConnectionDB.connection();
                connectionBD.Open();

                try
                {
                    MySqlCommand command = new MySqlCommand(sql, connectionBD);
                    command.Parameters.AddWithValue("@idBilancia", misurazione.Id_Bilancia);
                    command.Parameters.AddWithValue("@idProdotto", misurazione.Id_Prodotto);
                    command.Parameters.AddWithValue("@peso", misurazione.Peso);
                    command.Parameters.AddWithValue("@idFormulaProdotto", misurazione.Id_FormulaProdotto);
                    command.Parameters.AddWithValue("@active", misurazione.Active);
                    command.Parameters.AddWithValue("@date", misurazione.DataCreazione);

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

        public static string GetIdProdotto(string nome)
        {
            string id = "0";
            try
            {

                string sql = "SELECT Id From prodotto WHERE Active=1 AND Nome=@parameter";
                MySqlConnection connectionBD = ConnectionDB.connection();
                connectionBD.Open();

                try
                {
                    MySqlCommand command = new MySqlCommand(sql, connectionBD);
                    command.Parameters.AddWithValue("@parameter", nome);
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
                        string sql = "SELECT m.Id,p.Nome, m.Peso, m.DataCreazione FROM misurazione as m INNER JOIN prodotto as p ON m.Id_Prodotto = p.Id WHERE m.DataCreazione BETWEEN @fromDate AND DATE_ADD(@toDate, INTERVAL 1 DAY)";
                        MySqlCommand command = new MySqlCommand(sql, connectionBD);
                        command.Parameters.AddWithValue("@fromDate", fromDate.ToString("yyyy-MM-dd"));
                        command.Parameters.AddWithValue("@toDate", toDate.ToString("yyyy-MM-dd"));
                        var reader = command.ExecuteReader();
                        table.Load(reader);
                        reader.Dispose();
                        break;

                    case 2:
                        string sql1 = "SELECT m.Id,p.Nome, m.Peso, m.DataCreazione FROM misurazione as m INNER JOIN prodotto as p ON m.Id_Prodotto = p.Id WHERE m.Id_Bilancia=@idBilancia";
                        MySqlCommand command1 = new MySqlCommand(sql1, connectionBD);
                        command1.Parameters.AddWithValue("@idBilancia", idBalance);
                        var reader1 = command1.ExecuteReader();
                        table.Load(reader1);
                        reader1.Dispose();
                        break;

                    case 3:
                        string sql2 = "SELECT m.Id,p.Nome, m.Peso, m.DataCreazione FROM misurazione as m INNER JOIN prodotto as p ON m.Id_Prodotto = p.Id WHERE m.Id_Prodotto=@idProdotto";
                        MySqlCommand command2 = new MySqlCommand(sql2, connectionBD);
                        command2.Parameters.AddWithValue("@idProdotto", idProduct);
                        var reader2 = command2.ExecuteReader();
                        table.Load(reader2);
                        reader2.Dispose();
                        break;

                    case 4:
                        string sql3 = "SELECT m.Id,p.Nome, m.Peso, m.DataCreazione FROM misurazione as m INNER JOIN prodotto as p ON m.Id_Prodotto = p.Id WHERE m.Id_Bilancia=@idBilancia AND m.Id_Prodotto=@idProdotto";
                        MySqlCommand command3 = new MySqlCommand(sql3, connectionBD);
                        command3.Parameters.AddWithValue("@idBilancia", idBalance);
                        command3.Parameters.AddWithValue("@idProdotto", idProduct);
                        var reader3 = command3.ExecuteReader();
                        table.Load(reader3);
                        reader3.Dispose();
                        break;

                    case 5:
                        string sql4 = "SELECT m.Id,p.Nome, m.Peso, m.DataCreazione FROM misurazione as m INNER JOIN prodotto as p ON m.Id_Prodotto = p.Id WHERE m.Id_Bilancia=@idBilancia AND m.DataCreazione BETWEEN @fromDate AND DATE_ADD(@toDate, INTERVAL 1 DAY)";
                        MySqlCommand command4 = new MySqlCommand(sql4, connectionBD);
                        command4.Parameters.AddWithValue("@idBilancia", idBalance);
                        command4.Parameters.AddWithValue("@fromDate", fromDate.ToString("yyyy-MM-dd"));
                        command4.Parameters.AddWithValue("@toDate", toDate.ToString("yyyy-MM-dd"));
                        var reader4 = command4.ExecuteReader();
                        table.Load(reader4);
                        reader4.Dispose();
                        break;

                    case 6:
                        string sql5 = "SELECT m.Id,p.Nome, m.Peso, m.DataCreazione FROM misurazione as m INNER JOIN prodotto as p ON m.Id_Prodotto = p.Id WHERE m.Id_Prodotto=@idProdotto AND m.DataCreazione BETWEEN @fromDate AND DATE_ADD(@toDate, INTERVAL 1 DAY)";
                        MySqlCommand command5 = new MySqlCommand(sql5, connectionBD);
                        command5.Parameters.AddWithValue("@idProdotto", idProduct);
                        command5.Parameters.AddWithValue("@fromDate", fromDate.ToString("yyyy-MM-dd"));
                        command5.Parameters.AddWithValue("@toDate", toDate.ToString("yyyy-MM-dd"));
                        var reader5 = command5.ExecuteReader();
                        table.Load(reader5);
                        reader5.Dispose();
                        break;

                    case 7:
                        string sql6 = "SELECT m.Id,p.Nome, m.Peso, m.DataCreazione FROM misurazione as m INNER JOIN prodotto as p ON m.Id_Prodotto = p.Id WHERE m.Id_Bilancia=@idBilancia AND m.Id_Prodotto=@idProdotto AND m.DataCreazione BETWEEN @fromDate AND DATE_ADD(@toDate, INTERVAL 1 DAY)";
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
