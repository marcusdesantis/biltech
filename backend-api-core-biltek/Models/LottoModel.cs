namespace backend_api_core.Models
{
    public class Lotto
    {
        public int? Id { get; set; }
        public int Id_Prodotto { get; set; }
        public string CodiceLotto { get; set; }
        public int SogliaMinima { get; set; }
        public int SogliaMassima { get; set; }
        public decimal Tolleranza { get; set; }
        public decimal PesoStandard { get; set; }
        public bool Attivo { get; set; }

    }

    public class LottoList
    {
        public int? Id { get; set; }
        public int Id_Prodotto { get; set; }
        public string CodiceLotto { get; set; }
        public int SogliaMinima { get; set; }
        public int SogliaMassima { get; set; }
        public decimal Tolleranza { get; set; }
        public decimal PesoStandard { get; set; }
        public bool Attivo { get; set; }

        public int total { get; set; }
    }
}