using backend_api_core.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_api_core.Interfaces
{
    public interface IModulo
    {
        public Task<IEnumerable<ModuloList>> SearchList(string value, string parameter, int currentPageNumber, int amountShow);
        public Task<Modulo> FindById(int id);
        public Task<RespuestaDB> Save(Modulo data);
        public Task<RespuestaDB> Modify(Modulo data);
        public Task<RespuestaDB> Delete(int id);
    }
}
