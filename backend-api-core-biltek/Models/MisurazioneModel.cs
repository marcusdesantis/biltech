namespace backend_api_core.Models
{
    public class Misurazione
    {
        public int? id{ get; set; }
        public int id_bilancia { get; set; }
        public int id_prodotto { get; set; }
        public int peso { get; set; }
        public int id_FormulaProdotto { get; set; }
        public int id_Utente { get; set; }
        public bool Attivo { get; set; }
      
    }

    public class MisurazioneList
    {
        public int? id { get; set; }
        public int id_bilancia { get; set; }
        public int id_prodotto { get; set; }
        public int peso { get; set; }
        public int id_FormulaProdotto { get; set; }
        public int id_Utente { get; set; }
        public bool Attivo { get; set; }

        public int total { get; set; }

    }
}
