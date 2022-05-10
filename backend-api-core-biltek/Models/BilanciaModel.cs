namespace backend_api_core.Models
{
    public class Bilancia
    {
        public int? id{ get; set; }
        public string Nome { get; set; }
        public string Codice { get; set; }
        public int Id_Modello { get; set; }
        public string NomeModello { get; set; }
        public string PortCOM { get; set; }
        public int BaudRate { get; set; }
        public int DataBits { get; set; }
        public int Parity { get; set; }
        public int StopBit { get; set; }
        public int HandShake { get; set; }
        public string CommandForWeight { get; set; }
        public decimal WeightConversion { get; set; }
        public bool Attivo { get; set; }
      
    }

    public class BilanciaList
    {
        public int? id { get; set; }
        public string Nome { get; set; }
        public string Codice { get; set; }
        public int Id_Modello { get; set; }
        public string NomeModello { get; set; }
        public string PortCOM { get; set; }
        public int BaudRate { get; set; }
        public int DataBits { get; set; }
        public int Parity { get; set; }
        public int StopBit { get; set; }
        public int HandShake { get; set; }
        public string CommandForWeight { get; set; }
        public decimal WeightConversion { get; set; }
        public bool Attivo { get; set; }

        public int total { get; set; }

    }
}
