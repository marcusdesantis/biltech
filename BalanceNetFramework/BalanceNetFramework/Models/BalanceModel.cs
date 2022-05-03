using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BalanceNetFramework.Models
{
    public class BalanceModel
    {
   
        public int Id { get; set; }
        public string Nome { get; set; }
        public string Codice { get; set; }
        public string PortCOM { get; set; }
        public int BaudRate { get; set; }
        public int Parity { get; set; }
        public int DataBits { get; set; }
        public int StopBit { get; set; }
        public int HandShake { get; set; }
        public string CommandForWeight { get; set; }
        public decimal WeightConversion { get; set; }       
        public int IdModello { get; set; }
        public string NomeModello { get; set; }

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

    public class ProdottoModel
    {
        public int Id { get; set; }
        public string Nome { get; set; }
        public int Id_UnitaMisura { get; set; }
        public int Id_TipologiaProdotto { get; set; }
        public int Id_Reparto { get; set; }
        public decimal MinimoScortaMagazzino { get; set; }
        public bool Attivo { get; set; }
        public string DataCreazione { get; set; }
    }

    public class MisurazioneModel
    {
        public int Id { get; set; }
        public int Id_Bilancia { get; set; }
        public int Id_Prodotto { get; set; }
        public string Peso { get; set; }
        public int Id_FormulaProdotto { get; set; }
        public int Id_Utente { get; set; }
        public bool Attivo { get; set; }
        public string DataCreazione { get; set; }

    }
    public class ControlloPesateModel
    {
        public int Id { get; set; }
        public int Id_Prodotto { get; set; }
        public int NumeroControllo { get; set; }
        public string DataOra { get; set; }
        public string Pesata { get; set; }
        public int NumeroPesata { get; set; }
        public bool Adatto { get; set; }
        public string Annullato { get; set; }
        public bool Attivo { get; set; }

    }
}
