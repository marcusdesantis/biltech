using backend_api_core.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_api_core.Interfaces
{
    public interface IBilancia
    {
        public Task<IEnumerable<BilanciaList>> SearchList(string value, string parameter, int currentPageNumber, int amountShow);
        public Task<Bilancia> FindById(int id);
        public Task<RespuestaDB> Save(Bilancia data);
        public Task<RespuestaDB> Modify(Bilancia data);
        public Task<RespuestaDB> Delete(int id);
    }
}
