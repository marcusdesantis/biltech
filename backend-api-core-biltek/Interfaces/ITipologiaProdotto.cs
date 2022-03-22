using backend_api_core.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_api_core.Interfaces
{
    public interface ITipologiaProdotto
    {
        public Task<IEnumerable<TipologiaProdottoList>> SearchList(string value, string parameter, int currentPageNumber, int amountShow);
        public Task<TipologiaProdotto> FindById(int id);
        public Task<RespuestaDB> Save(TipologiaProdotto data);
        public Task<RespuestaDB> Modify(TipologiaProdotto data);
        public Task<RespuestaDB> Delete(int id);
    }
}