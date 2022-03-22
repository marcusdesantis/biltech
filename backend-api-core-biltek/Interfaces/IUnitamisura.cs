using backend_api_core.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_api_core.Interfaces
{
    public interface IUnitamisura
    {
        public Task<IEnumerable<UnitamisuraList>> SearchList(string value, string parameter, int currentPageNumber, int amountShow);
        public Task<Unitamisura> FindById(int id);
        public Task<RespuestaDB> Save(Unitamisura data);
        public Task<RespuestaDB> Modify(Unitamisura data);
        public Task<RespuestaDB> Delete(int id);
    }
}