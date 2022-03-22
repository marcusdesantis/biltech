using backend_api_core.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_api_core.Interfaces
{
    public interface IBarcodeProdotto
    {
        public Task<IEnumerable<BarcodeProdottoList>> SearchList(string value, string parameter, int currentPageNumber, int amountShow);
        public Task<BarcodeProdotto> FindById(int id);
        public Task<RespuestaDB> Save(BarcodeProdotto data);
        public Task<RespuestaDB> Modify(BarcodeProdotto data);
        public Task<RespuestaDB> Delete(int id);
    }
}