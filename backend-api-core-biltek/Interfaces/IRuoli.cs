using backend_api_core.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_api_core.Interfaces
{
    public interface IRuoli
    {
        public Task<IEnumerable<RuoliList>> SearchList(string value, string parameter, int currentPageNumber, int amountShow);
        public Task<Ruoli> FindById(int id);
        public Task<RespuestaDB> Save(Ruoli data);
        public Task<RespuestaDB> Modify(Ruoli data);
        public Task<RespuestaDB> Delete(int id);
    }
}