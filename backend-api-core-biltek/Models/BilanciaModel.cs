namespace backend_api_core.Models
{
    public class Bilancia
    {
        public int? id{ get; set; }
        public string Nome { get; set; }
        public string Codice { get; set; }
        public int Id_Modello { get; set; }
        public bool Active { get; set; }
      
    }

    public class BilanciaList
    {
        public int? id { get; set; }
        public string Nome { get; set; }
        public string Codice { get; set; }
        public int Id_Modello { get; set; }
        public bool Active { get; set; }

        public int total { get; set; }

    }
}
