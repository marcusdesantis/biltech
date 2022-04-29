using backend_api_core.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_api_core.Interfaces
{
    public interface IControlloPesate
    {
        public Task<IEnumerable<ControlloPesateList>> SearchList(string value, string parameter, int currentPageNumber, int amountShow);
        public Task<ControlloPesate> FindById(int id);
        public Task<RespuestaDB> Save(ControlloPesate data);
        public Task<RespuestaDB> Modify(ControlloPesate data);
        public Task<RespuestaDB> Delete(int id);
    }
}