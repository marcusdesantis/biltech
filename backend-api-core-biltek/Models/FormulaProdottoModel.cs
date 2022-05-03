namespace backend_api_core.Models
{
    public class FormulaProdotto
    {
        public int? id{ get; set; }
        public int Id_Prodotto { get; set; }
        public int Id_Formula { get; set; }
        public bool Attivo { get; set; }
      
    }

    public class FormulaProdottoList
    {
        public int? id { get; set; }
        public int Id_Prodotto { get; set; }
        public int Id_Formula { get; set; }
        public bool Attivo { get; set; }

        public int total { get; set; }

    }
}
