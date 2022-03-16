using backend_api_core.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_api_core.Interfaces
{
    public interface IProdotto
    {
        public Task<IEnumerable<ProdottoList>> SearchList(string value, string parameter, int currentPageNumber, int amountShow);
        public Task<Prodotto> FindById(int id);
        public Task<RespuestaDB> Save(Prodotto data);
        public Task<RespuestaDB> Modify(Prodotto data);
        public Task<RespuestaDB> Delete(int id);
    }
}
