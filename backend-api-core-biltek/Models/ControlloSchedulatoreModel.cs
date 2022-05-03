using System;

namespace backend_api_core.Models
{
    public class ControlloSchedulatore
    {
        public int? Id { get; set; }
        public int Id_Prodotto { get; set; }
        public int NumeroControllo { get; set; }
        public DateTime Ora { get; set; }
        public bool Attivo { get; set; }

    }

    public class ControlloSchedulatoreList
    {
        public int? Id { get; set; }
        public int Id_Prodotto { get; set; }
        public int NumeroControllo { get; set; }
        public DateTime Ora { get; set; }
        public bool Attivo { get; set; }

        public int total { get; set; }
    }
}