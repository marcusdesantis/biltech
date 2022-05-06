using backend_api_core.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_api_core.Interfaces
{
    public interface ILotto
    {
        public Task<IEnumerable<LottoList>> SearchList(string value, string parameter, int currentPageNumber, int amountShow);
        public Task<Lotto> FindById(int id);
        public Task<RespuestaDB> Save(Lotto data);
        public Task<RespuestaDB> Modify(Lotto data);
        public Task<RespuestaDB> Delete(int id);
    }
}