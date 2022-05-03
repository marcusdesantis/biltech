namespace backend_api_core.Models
{
    public class Modulo
    {
        public int? id{ get; set; }
        public string Nome { get; set; }
        public bool Attivo { get; set; }
      
    }

    public class ModuloList
    {
        public int? id { get; set; }
        public string Nome { get; set; }
        public bool Attivo { get; set; }

        public int total { get; set; }

    }
}
