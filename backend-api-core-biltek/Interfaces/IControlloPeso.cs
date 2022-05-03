using backend_api_core.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_api_core.Interfaces
{
    public interface IControlloPeso
    {
        public Task<IEnumerable<ControlloPesoList>> SearchList(string value, string parameter, int currentPageNumber, int amountShow);
        public Task<ControlloPeso> FindById(int id);
        public Task<RespuestaDB> Save(ControlloPeso data);
        public Task<RespuestaDB> Modify(ControlloPeso data);
        public Task<RespuestaDB> Delete(int id);
    }
}