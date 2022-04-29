using System;

namespace backend_api_core.Models
{
    public class SchedulerControllo
    {
        public int? Id { get; set; }
        public int Id_Prodotto { get; set; }
        public int NumeroControllo { get; set; }
        public DateTime Ora { get; set; }
        public bool Active { get; set; }

    }

    public class SchedulerControlloList
    {
        public int? Id { get; set; }
        public int Id_Prodotto { get; set; }
        public int NumeroControllo { get; set; }
        public DateTime Ora { get; set; }
        public bool Active { get; set; }

        public int total { get; set; }
    }
}