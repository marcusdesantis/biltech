using System;

namespace backend_api_core.Models
{
    public class Magazzino
    {
        public int? Id_Magazzino { get; set; }
        public int Id_Prodotto { get; set; }
        public string Lotto { get; set; }
        public DateTime Scadenza { get; set; }
        public decimal QuantitaDiCarico { get; set; }
        public bool Active { get; set; }

    }

    public class MagazzinoList
    {
        public int? Id_Magazzino { get; set; }
        public int Id_Prodotto { get; set; }
        public string Lotto { get; set; }
        public DateTime Scadenza { get; set; }
        public decimal QuantitaDiCarico { get; set; }
        public bool Active { get; set; }

        public int total { get; set; }
    }
}