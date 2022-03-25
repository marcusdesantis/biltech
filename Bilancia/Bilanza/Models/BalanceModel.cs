using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Bilanza.Models
{
    public class BalanceModel
    {
        public string Balance { get; set; }
        public string PortCOM { get; set; }
        public int BaudRate { get; set; }
        public int Parity { get; set; }
        public int DataBits { get; set; }
        public int StopBit { get; set; }
        public int HandShake { get; set; }
        public string CommandForWeight { get; set; }
        public string ParserFormat { get; set; }
        public decimal WeightConversion { get; set; }
        public string Modello { get; set; }


    }

    public class BalanceResultModel
    {
        public string First { get; set; }
        public decimal WeightKg { get; set; }
        public decimal Weight_100 { get; set; }
        public string Date { get; set; }
        public string Second { get; set; }
        public string Code { get; set; }
    }

    public class BilanciaModel
    {
        public int Id { get; set; }
        public string Nome { get; set; }
        public string Codice { get; set; }
        public int Id_Modello { get; set; }
    }

}
