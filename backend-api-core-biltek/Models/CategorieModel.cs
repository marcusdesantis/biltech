namespace backend_api_core.Models
{
    public class Categorie
    {
        public int? Id { get; set; }
        public string Nome { get; set; }
        public bool Attivo { get; set; }

    }

    public class CategorieList
    {
        public int? Id { get; set; }
        public string Nome { get; set; }
        public bool Attivo { get; set; }

        public int total { get; set; }
    }
}