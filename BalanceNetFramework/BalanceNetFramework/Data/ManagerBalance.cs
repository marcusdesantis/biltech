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
        List<BalanceModel> _balanceList = new List<BalanceModel>();
        
        List<ProdottoModel> _prodottoList;
        BalanceModel _balanceSelected = null;

        String _messageError = string.Empty;
        SerialPort serialPort1;
        string dataValue = null;
        bool _error = false;

        public static MainWindow frm;

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

        public List<ProdottoModel> ProdottoList
        {
            get
            {
                return _prodottoList;
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
                Console.WriteLine("Error: " + ex);
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


                        String name;
                        String[] netWeight;

                        String[] data = CodeToArray(dataValue);

                        name = GetBalanceName(data);
                        netWeight = GetBalanceWeight(data);

                        DateTime dataCreazione = DateTime.Now;
                        string dateFormart = dataCreazione.ToString("yy-MM-dd HH:mm:ss");


                        _misurazione.Id_Bilancia = 4;
                        _misurazione.Id_Prodotto = Int32.Parse(idProdotto);
                        _misurazione.Peso = netWeight[0];
                        _misurazione.Id_FormulaProdotto = 5;
                        _misurazione.Active = true;
                        _misurazione.DataCreazione = dateFormart;

                        MainWindow._instance.SetWeight(idProdotto, netWeight[0], netWeight[1]);

                        if (InsertMisurazione(_misurazione))
                            {

                            Console.WriteLine("Name Bilancia: " + name);
                            Console.WriteLine("Net Weight: " + netWeight[0]);

                        }
                        else
                        {
                            Console.WriteLine("Error inserting");
                        }

                }
                else
                {
                    Console.WriteLine("Please select the prodotto");
                }

            }
            else
            {
                _error = true;
                _messageError = "";
                Console.WriteLine("The balance information is empty");
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
                        _messageError = "It is not possible to obtain information about your configuration";
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
                        Console.WriteLine(b);
                        _balanceList.Add(b);                      
                    }

                    //state = true;

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
                catch (MySqlException ex)
                {
                    Console.WriteLine("Insert Error: " + ex);
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

            return id;

        }

        public DataTable GetReport(DateTime fromDate, DateTime toDate, int? idBilancia)
        {

           
            MySqlConnection connectionBD = ConnectionDB.connection();
            connectionBD.Open();
            var table = new DataTable();

            try
            {
                int option = ReportWindow._instance.GetOption();

                if(option == 1)
                {
                    string sql = "SELECT m.Id,p.Nome, m.Peso, m.DataCreazione FROM misurazione as m INNER JOIN prodotto as p ON m.Id_Prodotto = p.Id WHERE m.DataCreazione BETWEEN @fromDate AND DATE_ADD(@toDate, INTERVAL 1 DAY)";
                    MySqlCommand command = new MySqlCommand(sql, connectionBD);
                    command.Parameters.AddWithValue("@fromDate", fromDate.ToString("yyyy-MM-dd"));
                    command.Parameters.AddWithValue("@toDate", toDate.ToString("yyyy-MM-dd"));
                    var reader = command.ExecuteReader();
                    table.Load(reader);
                    reader.Dispose();

                }

                if(option == 2)
                {
                    string sql = "SELECT m.Id,p.Nome, m.Peso, m.DataCreazione FROM misurazione as m INNER JOIN prodotto as p ON m.Id_Prodotto = p.Id WHERE m.Id_Bilancia=@idBilancia";
                    MySqlCommand command = new MySqlCommand(sql, connectionBD);
                    command.Parameters.AddWithValue("@idBilancia", idBilancia);
                    var reader = command.ExecuteReader();
                    table.Load(reader);
                    reader.Dispose();
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

            return table;

        }

        public static String[] CodeToArray(String value)
        {
            String code = value;
            code = code.Replace(" ", "");
            code = code.Replace("\r\n", "|");
            code = code.Replace("\\r\\n", "|");
            String[] data = code.Split('|');

            String[] array = new string[3];

            //Position 3 (Nome) and 8 (Netto)
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

            return array;
        }

        public static String GetBalanceName(String[] data)
        {
            string name = data[0].Replace(":", ": ");
            name = name.Replace("NomeBilancia:", "");
            return name;
        }

        public static String[] GetBalanceWeight(String[] data)
        {
            string weight = data[1].Replace("Netto:", "");
            String[] array = new string[2];

            var resultWeight = Regex.Match(weight, @"(\d+(\.\d+)?)|(\.\d+)").Value;
            var resulSymbol = new String(weight.SkipWhile(p => !Char.IsLetter(p)).ToArray());

            array[0] = resultWeight;
            array[1] = resulSymbol;

            Console.WriteLine($"Weight {array[0]} ,symbol: {array[1]}");
            return array;
        }

    }
}
