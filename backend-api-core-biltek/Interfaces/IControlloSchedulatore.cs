using backend_api_core.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_api_core.Interfaces
{
    public interface IControlloSchedulatore
    {
        public Task<IEnumerable<ControlloSchedulatoreList>> SearchList(string value, string parameter, int currentPageNumber, int amountShow);
        public Task<ControlloSchedulatore> FindById(int id);
        public Task<RespuestaDB> Save(ControlloSchedulatore data);
        public Task<RespuestaDB> Modify(ControlloSchedulatore data);
        public Task<RespuestaDB> Delete(int id);
    }
}