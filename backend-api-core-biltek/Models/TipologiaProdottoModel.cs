namespace backend_api_core.Models
{
    public class TipologiaProdotto
    {
        public int? Id_TipologiaProdotto { get; set; }
        public string Nome { get; set; }
        public bool Attivo { get; set; }

    }

    public class TipologiaProdottoList
    {
        public int? Id_TipologiaProdotto { get; set; }
        public string Nome { get; set; }
        public bool Attivo { get; set; }

        public int total { get; set; }
    }
}