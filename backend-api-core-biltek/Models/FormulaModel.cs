namespace backend_api_core.Models
{
    public class Formula
    {
        public int? id{ get; set; }
        public string Nome { get; set; }
        public string Algoritmo { get; set; }
        public bool Attivo { get; set; }
      
    }

    public class FormulaList
    {
        public int? id { get; set; }
        public string Nome { get; set; }
        public string Algoritmo { get; set; }
        public bool Attivo { get; set; }

        public int total { get; set; }

    }
}
