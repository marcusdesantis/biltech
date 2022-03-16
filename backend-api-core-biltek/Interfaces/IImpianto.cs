using backend_api_core.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_api_core.Interfaces
{
    public interface IImpianto
    {
        public Task<IEnumerable<ImpiantoList>> SearchList(string value, string parameter, int currentPageNumber, int amountShow);
        public Task<Impianto> FindById(int id);
        public Task<RespuestaDB> Save(Impianto data);
        public Task<RespuestaDB> Modify(Impianto data);
        public Task<RespuestaDB> Delete(int id);
    }
}
