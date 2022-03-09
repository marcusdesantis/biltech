using Balanza.Models;
using System;
using System.Collections.Generic;
using System.IO.Ports;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace Balanza.Data
{
    public class ManagerBalance
    {
        SerialPort serialPort1;
        string dataValue = "";
        public ManagerBalance()
        {
            loadConfigurationInitial();

        }

        private void loadConfigurationInitial()
        {
            try
            {
                // COM3 = puerto que ha capturado la conexion de la Balanza
                // BaudRate = colocar el valor del manual de la balanza
                // Parity = colocar el valor del manual de la balanza
                // DataBits = colocar el valor del manual de la balanza
                // StopBits = colocar el valor del manual de la balanza
                serialPort1 = new SerialPort("COM3", 2400, Parity.None, 8, StopBits.One);
                serialPort1.Handshake = Handshake.None;
                serialPort1.DataReceived += new SerialDataReceivedEventHandler(DataReceived);
                serialPort1.ReadTimeout = 500;
                serialPort1.WriteTimeout = 500;
                serialPort1.Open();

                // se indica el tipo de pesaje que desea obtener segun el manual de la balanza
                serialPort1.Write("0P");
            }
            catch (Exception ex)
            {
                
            }
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
                serialPort1 = new SerialPort(balanceModel.portCOM, balanceModel.baudRate, Parity.None, balanceModel.dataBits, StopBits.One);
                serialPort1.Handshake = Handshake.None;
                serialPort1.DataReceived += new SerialDataReceivedEventHandler(DataReceived);
                serialPort1.ReadTimeout = 500;
                serialPort1.WriteTimeout = 500;
                serialPort1.Open();

                // se indica el tipo de pesaje que desea obtener segun el manual de la balanza
                serialPort1.Write(balanceModel.typeWeighWeight);
            }
            catch (Exception ex)
            {

            }
        }

        private void DataReceived(object sender, SerialDataReceivedEventArgs e)
        {
            Thread.Sleep(500);
            dataValue = serialPort1.ReadExisting();
        }
    }
}
