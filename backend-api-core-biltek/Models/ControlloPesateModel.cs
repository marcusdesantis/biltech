using System;

namespace backend_api_core.Models
{
    public class ControlloPesate
    {
        public int? Id { get; set; }
        public int Id_Prodotto { get; set; }
        public int NumeroControllo { get; set; }
        public DateTime DataOra { get; set; }
        public decimal Pesata { get; set; }
        public int NumeroPesata { get; set; }
        public bool Conforme { get; set; }
        public DateTime Annullato { get; set; }
        public bool Active { get; set; }

    }

    public class ControlloPesateList
    {
        public int? Id { get; set; }
        public int Id_Prodotto { get; set; }
        public int NumeroControllo { get; set; }
        public DateTime DataOra { get; set; }
        public decimal Pesata { get; set; }
        public int NumeroPesata { get; set; }
        public bool Conforme { get; set; }
        public DateTime Annullato { get; set; }
        public bool Active { get; set; }

        public int total { get; set; }
    }
}