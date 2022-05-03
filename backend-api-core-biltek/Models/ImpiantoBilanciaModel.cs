namespace backend_api_core.Models
{
    public class ImpiantoBilancia
    {
        public int? id{ get; set; }
        public int id_Impianto { get; set; }
        public int id_bilancia { get; set; }
        public bool Attivo { get; set; }
      
    }

    public class ImpiantoBilanciaList
    {
        public int? id { get; set; }
        public int id_Impianto { get; set; }
        public int id_bilancia { get; set; }
        public bool Attivo { get; set; }

        public int total { get; set; }

    }
}
