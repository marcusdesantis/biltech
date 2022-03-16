using backend_api_core.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_api_core.Interfaces
{
    public interface IFormulaProdotto
    {
        public Task<IEnumerable<FormulaProdottoList>> SearchList(string value, string parameter, int currentPageNumber, int amountShow);
        public Task<FormulaProdotto> FindById(int id);
        public Task<RespuestaDB> Save(FormulaProdotto data);
        public Task<RespuestaDB> Modify(FormulaProdotto data);
        public Task<RespuestaDB> Delete(int id);
    }
}
