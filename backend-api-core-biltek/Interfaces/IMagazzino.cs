using backend_api_core.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_api_core.Interfaces
{
    public interface IMagazzino
    {
        public Task<IEnumerable<MagazzinoList>> SearchList(string value, string parameter, int currentPageNumber, int amountShow);
        public Task<Magazzino> FindById(int id);
        public Task<RespuestaDB> Save(Magazzino data);
        public Task<RespuestaDB> Modify(Magazzino data);
        public Task<RespuestaDB> Delete(int id);
    }
}