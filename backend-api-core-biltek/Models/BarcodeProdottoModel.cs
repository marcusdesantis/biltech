namespace backend_api_core.Models
{
    public class BarcodeProdotto
    {
        public int? Id_BarcodeProdotto { get; set; }
        public string Barcode { get; set; }
        public int Id_Prodotto { get; set; }
        public bool Attivo { get; set; }

    }

    public class BarcodeProdottoList
    {
        public int? Id_BarcodeProdotto { get; set; }
        public string Barcode { get; set; }
        public int Id_Prodotto { get; set; }
        public bool Attivo { get; set; }

        public int total { get; set; }
    }
}