using backend_api_core.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_api_core.Interfaces
{
    public interface IFormula
    {
        public Task<IEnumerable<FormulaList>> SearchList(string value, string parameter, int currentPageNumber, int amountShow);
        public Task<Formula> FindById(int id);
        public Task<RespuestaDB> Save(Formula data);
        public Task<RespuestaDB> Modify(Formula data);
        public Task<RespuestaDB> Delete(int id);
    }
}
