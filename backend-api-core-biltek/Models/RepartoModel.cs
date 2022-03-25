namespace backend_api_core.Models
{
    public class Reparto
    {
        public int? Id_Reparto { get; set; }
        public string Nome_Reparto { get; set; }
        public bool Active { get; set; }

    }

    public class RepartoList
    {
        public int? Id_Reparto { get; set; }
        public string Nome_Reparto { get; set; }
        public bool Active { get; set; }

        public int total { get; set; }
    }
}