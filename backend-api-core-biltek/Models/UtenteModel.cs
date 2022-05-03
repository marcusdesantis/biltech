namespace backend_api_core.Models
{
    public class Utente
    {
        public int? Id { get; set; }
        public string utente { get; set; }
        public string Password { get; set; }
        public bool Attivo { get; set; }

    }

    public class UtenteList
    {
        public int? Id { get; set; }
        public string utente { get; set; }
        public string Password { get; set; }
        public bool Attivo { get; set; }

        public int total { get; set; }
    }
}