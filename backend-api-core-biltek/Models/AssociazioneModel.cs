namespace backend_api_core.Models
{
    public class Associazione
    {
        public int? Id { get; set; }     
        public int Id_Prodotto { get; set; }
        public string CodiceProdotto { get; set; }
        public bool Attivo { get; set; }

    }

    public class AssociazioneList
    {
        public int? Id { get; set; }
        public int Id_Prodotto { get; set; }
        public string CodiceProdotto { get; set; }
        public bool Attivo { get; set; }

        public int total { get; set; }
    }
}