namespace backend_api_core.Models
{
    public class Impianto
    {
        public int? id{ get; set; }
        public string Nome { get; set; }
        public bool Active { get; set; }
      
    }

    public class ImpiantoList
    {
        public int? id { get; set; }
        public string Nome { get; set; }
        public bool Active { get; set; }

        public int total { get; set; }

    }
}
