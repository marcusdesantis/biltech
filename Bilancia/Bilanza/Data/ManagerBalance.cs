using Bilanza.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.IO.Ports;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using Bilanza.Data;
using Bilancia.DB;
using System.Data;
using System.Text.RegularExpressions;

namespace Bilanza.Data
{
    public class ManagerBalance
    {
        List<BalanceModel> _balanceList;
        List<BilanciaModel> _bilanciaList;
        BalanceModel _balanceSelected = null;
        String _messageError = string.Empty;
        SerialPort serialPort1;
        string dataValue = "";
        bool _error = false;
        BalanceResultModel _balanceResultModel = new BalanceResultModel();


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

        public List<BilanciaModel> BilanciaList
        {
            get
            {
                return _bilanciaList;
            }
        }

        public ManagerBalance(string configFilePath)
        {

            loadDataConfigurationBalanceJson(configFilePath);
            
        }

        private void loadConfigurationInitial()
        {
            try
            {
                serialPort1 = new SerialPort("COM3", 2400, Parity.None, 8, StopBits.One);
                serialPort1.Handshake = Handshake.None;
                serialPort1.DataReceived += new SerialDataReceivedEventHandler(DataReceived);
                serialPort1.ReadTimeout = 500;
                serialPort1.WriteTimeout = 500;
                serialPort1.Open();

           }
            catch (Exception ex)
            {
                Console.WriteLine("Error " + ex);
            }
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
            if(_balanceSelected != null && serialPort1 != null)
            {
                if(!serialPort1.IsOpen)
                {
                    try
                    {
                        serialPort1.Open();
                        retVal = true;
                    }
                    catch(Exception ex)
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
            if(serialPort1 != null && serialPort1.IsOpen)
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
                catch(Exception ex)
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
                // COM3 = puerto que ha capturado la conexion de la Balanza
                // BaudRate = colocar el valor del manual de la balanza
                // Parity = colocar el valor del manual de la balanza
                // DataBits = colocar el valor del manual de la balanza
                // StopBits = colocar el valor del manual de la balanza

                serialPort1 = new SerialPort(balanceModel.PortCOM, balanceModel.BaudRate, Integer2Parity(balanceModel.Parity), balanceModel.DataBits, Integer2StopBits(balanceModel.StopBit));

                serialPort1.Handshake = Integer2HandShake(balanceModel.HandShake);
                serialPort1.DataReceived += new SerialDataReceivedEventHandler(DataReceived);
                serialPort1.ReadTimeout = 500;
                serialPort1.WriteTimeout = 500;


                //serialPort1.Open();

                // Sending stable weight command
                //serialPort1.Write(balanceModel.CommandForWeight);
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
                
            }catch (Exception ex)
            {
                Console.WriteLine("Error ->" + ex);
            }
            

        }

        private void DataReceived(object sender, SerialDataReceivedEventArgs e)
        {
            Thread.Sleep(500);

            dataValue = serialPort1.ReadExisting();
            if(!string.IsNullOrEmpty(dataValue))
            {

                //_balanceResultModel = GetParseData(dataValue, _balanceSelected.WeightConversion);

                String name = "";
                String[] netWeight;

                String[] data = CodeToArray(dataValue);    

                name = GetBalanceName(data);
                netWeight = GetBalanceWeight(data);

                if (InsertBalance(name, netWeight[0]))
                {
                    
                    Console.WriteLine("Name -> " + name);
                    Console.WriteLine("Weight -> " + netWeight[0]);
                   
                }
                else
                {
                    Console.WriteLine("Error inserting");
                }
            }
            else
            {
                _error = true;
                _messageError = "";

            }
        }

        //JDJDJ_2345_20220311_123345
        //2345_11032022_123599
        public static BalanceResultModel GetParseData(string data, decimal weightConversion)
        {
            BalanceResultModel _result = new BalanceResultModel();
            string[] partsDataValue = data.Split("_");
            var lengthPartsDataValue = partsDataValue.Length;

            var FormatFirst = "";
            var FormartWeight = "";
            var FormatDate = "";
            var FormatSeconds = "";

            
            if (partsDataValue[0].All(char.IsDigit))
            {
                if (partsDataValue[0].Length == 8)
                {
                        FormatDate = partsDataValue[0];
                }
                else
                {
                    if (partsDataValue[0].Length == 6)
                    {
                        FormatSeconds = partsDataValue[0];
                    }
                    else
                    {
                        FormartWeight = partsDataValue[0];
                    }
                }
            }
            else
            {
               FormatFirst = partsDataValue[0];
            }

            if (partsDataValue[1].All(char.IsDigit))
            {
                if (partsDataValue[1].Length == 8)
                {
                    FormatDate = partsDataValue[1];
                }
                else
                {
                    if (partsDataValue[1].Length == 6)
                    {
                        FormatSeconds = partsDataValue[1];
                    }
                    else
                    {
                        FormartWeight = partsDataValue[1];
                    }
                }
            }
            else
            {
                FormatFirst = partsDataValue[1];
            }

            if (partsDataValue[2].All(char.IsDigit))
            {
                if (partsDataValue[2].Length == 8)
                {
                    FormatDate = partsDataValue[2];
                }
                else
                {
                    if (partsDataValue[2].Length == 6)
                    {
                        FormatSeconds = partsDataValue[2];
                    }
                    else
                    {
                        FormartWeight = partsDataValue[2];
                    }
                }
            }
            else
            {
                FormatFirst = partsDataValue[2];
            }

            if (lengthPartsDataValue == 4)
            {
                if (partsDataValue[3].All(char.IsDigit))
                {
                    if (partsDataValue[3].Length == 8)
                    {
                        FormatDate = partsDataValue[3];
                    }
                    else
                    {
                        if (partsDataValue[3].Length == 6)
                        {
                            FormatSeconds = partsDataValue[3];
                        }
                        else
                        {
                            FormartWeight = partsDataValue[3];
                        }
                    }
                }
                else
                {
                    FormatFirst = partsDataValue[3];
                }
            }

            _result.First = FormatFirst;
            _result.WeightKg = decimal.Parse(FormartWeight);
            _result.Weight_100 = (decimal.Parse(FormartWeight)/ weightConversion);
            _result.Date = FormatDate;
            _result.Second = FormatSeconds;

            return _result;

        }

        public bool SelectBalance(string balanceName)
        {
            bool retVal = false;

            if(_balanceList != null)
            {
                if (_balanceList.Count > 0)
                {
                    BalanceModel _balance = _balanceList.Where(x => x.Balance.Equals(balanceName)).FirstOrDefault();
                    if(_balance != null)
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
        public bool loadDataConfigurationBalanceJson(string rutaJson)
        {
            bool valRet = false;
           
            if (File.Exists(rutaJson))
            {
                try
                {
                    StreamReader r = new StreamReader(rutaJson);

                    string jsonString = r.ReadToEnd();
                    r.Close();
                    r.Dispose();
                    _balanceList = JsonConvert.DeserializeObject<List<BalanceModel>>(jsonString);
         
                }
                catch (Exception ex)
                {
                    _messageError = ex.Message;
                }
            }

            return valRet;
        }
        public static bool InsertBalance(string name, string weight)
        {
            try
            {
                String idBilancia = "4";
                String idProdotto = "6";
                string peso = weight;
                String idFormulaProdotto = "4";
                DateTime dataCreazione = DateTime.Now;
                string dateFormart = dataCreazione.ToString("yy-MM-dd HH:mm:ss");

                string sql = "INSERT INTO misurazione (Id_Bilancia, Id_Prodotto, Peso, Id_FormulaProdotto, Active, DataCreazione) VALUES (@idBilancia,@idProdotto,@peso,@idFormulaProdotto,@active,@date)";
              
                MySqlConnection connectionBD = ConnectionBD.connection();
                connectionBD.Open();

                try
                {
                    MySqlCommand command = new MySqlCommand(sql, connectionBD);
                    command.Parameters.AddWithValue("@idBilancia", idBilancia);
                    command.Parameters.AddWithValue("@idProdotto", idProdotto);
                    command.Parameters.AddWithValue("@peso", peso);
                    command.Parameters.AddWithValue("@idFormulaProdotto", idFormulaProdotto);
                    command.Parameters.AddWithValue("@active", 1);
                    command.Parameters.AddWithValue("@date", dateFormart);

                    command.ExecuteNonQuery();
                    Console.WriteLine("Insert Success");

                    return true;

                }
                catch (MySqlException ex)
                {
                    Console.WriteLine("Insert Error -> "+ ex);
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
            string name  = data[0].Replace(":", ": ");
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
