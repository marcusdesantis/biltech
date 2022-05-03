using System;

namespace backend_api_core.Models
{
    public class ControlloPeso
    {
        public int? Id { get; set; }
        public int Id_Prodotto { get; set; }
        public int NumeroControllo { get; set; }
        public DateTime DataOra { get; set; }
        public decimal Pesata { get; set; }
        public int NumeroPesata { get; set; }
        public bool Adatto { get; set; }
        public DateTime Annullato { get; set; }
        public bool Attivo { get; set; }

    }

    public class ControlloPesoList
    {
        public int? Id { get; set; }
        public int Id_Prodotto { get; set; }
        public int NumeroControllo { get; set; }
        public DateTime DataOra { get; set; }
        public decimal Pesata { get; set; }
        public int NumeroPesata { get; set; }
        public bool Adatto { get; set; }
        public DateTime Annullato { get; set; }
        public bool Attivo { get; set; }

        public int total { get; set; }
    }
}