namespace backend_api_core.Models
{
    public class BilanciaModulo
    {
        public int? id{ get; set; }
        public int Id_Bilancia { get; set; }
        public int Id_Modulo { get; set; }
        public bool Attivo { get; set; }
      
    }

    public class BilanciaModuloList
    {
        public int? id { get; set; }
        public int Id_Bilancia { get; set; }
        public int Id_Modulo { get; set; }
        public bool Attivo { get; set; }

        public int total { get; set; }

    }
}
