namespace backend_api_core.Models
{
    public class Unitamisura
    {
        public int? Id_UnitaMisura { get; set; }
        public string Nome { get; set; }
        public bool Attivo { get; set; }

    }

    public class UnitamisuraList
    {
        public int? Id_UnitaMisura { get; set; }
        public string Nome { get; set; }
        public bool Attivo { get; set; }

        public int total { get; set; }
    }
}