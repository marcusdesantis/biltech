namespace backend_api_core.Models
{
    public class Prodotto
    {
        public int? id{ get; set; }
        public string Nome { get; set; }
        public int Id_UnitaMisura { get; set; }
        public int Id_TipologiaProdotto { get; set; }
        public int Id_Categorie { get; set; }
        public string CodiceProdotto { get; set; }
        public decimal MinimoScortaMagazzino { get; set; }
        public int SogliaMinima { get; set; }
        public int SogliaMassima { get; set; }
        public decimal Tolleranza { get; set; }
        public decimal PesoStandard { get; set; }
        public int NumeroPesateControllo { get; set; }
        public int NumeroControllo { get; set; }

        public bool Attivo { get; set; }
      
    }

    public class ProdottoList
    {
        public int? id { get; set; }
        public string Nome { get; set; }
        public int Id_UnitaMisura { get; set; }
        public int Id_TipologiaProdotto { get; set; }
        public int Id_Categorie { get; set; }
        public string CodiceProdotto { get; set; }
        public decimal MinimoScortaMagazzino { get; set; }
        public int SogliaMinima { get; set; }
        public int SogliaMassima { get; set; }
        public decimal Tolleranza { get; set; }
        public decimal PesoStandard { get; set; }
        public int NumeroPesateControllo { get; set; }
        public int NumeroControllo { get; set; }
        public bool Attivo { get; set; }

        public int total { get; set; }

    }
}
