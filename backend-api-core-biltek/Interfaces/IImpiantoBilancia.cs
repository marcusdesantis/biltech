using backend_api_core.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_api_core.Interfaces
{
    public interface IImpiantoBilancia
    {
        public Task<IEnumerable<ImpiantoBilanciaList>> SearchList(string value, string parameter, int currentPageNumber, int amountShow);
        public Task<ImpiantoBilancia> FindById(int id);
        public Task<RespuestaDB> Save(ImpiantoBilancia data);
        public Task<RespuestaDB> Modify(ImpiantoBilancia data);
        public Task<RespuestaDB> Delete(int id);
    }
}
