using backend_api_core.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_api_core.Interfaces
{
    public interface IModello
    {
        public Task<IEnumerable<ModelloList>> SearchList(string value, string parameter, int currentPageNumber, int amountShow);
        public Task<Modello> FindById(int id);
        public Task<RespuestaDB> Save(Modello data);
        public Task<RespuestaDB> Modify(Modello data);
        public Task<RespuestaDB> Delete(int id);
    }
}
