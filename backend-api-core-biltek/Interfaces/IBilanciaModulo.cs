using backend_api_core.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_api_core.Interfaces
{
    public interface IBilanciaModulo
    {
        public Task<IEnumerable<BilanciaModuloList>> SearchList(string value, string parameter, int currentPageNumber, int amountShow);
        public Task<BilanciaModulo> FindById(int id);
        public Task<RespuestaDB> Save(BilanciaModulo data);
        public Task<RespuestaDB> Modify(BilanciaModulo data);
        public Task<RespuestaDB> Delete(int id);
    }
}
