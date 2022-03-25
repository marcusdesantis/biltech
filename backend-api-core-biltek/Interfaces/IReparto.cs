using backend_api_core.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_api_core.Interfaces
{
    public interface IReparto
    {
        public Task<IEnumerable<RepartoList>> SearchList(string value, string parameter, int currentPageNumber, int amountShow);
        public Task<Reparto> FindById(int id);
        public Task<RespuestaDB> Save(Reparto data);
        public Task<RespuestaDB> Modify(Reparto data);
        public Task<RespuestaDB> Delete(int id);
    }
}