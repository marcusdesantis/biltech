using backend_api_core.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_api_core.Interfaces
{
    public interface ICategorie
    {
        public Task<IEnumerable<CategorieList>> SearchList(string value, string parameter, int currentPageNumber, int amountShow);
        public Task<Categorie> FindById(int id);
        public Task<RespuestaDB> Save(Categorie data);
        public Task<RespuestaDB> Modify(Categorie data);
        public Task<RespuestaDB> Delete(int id);
    }
}