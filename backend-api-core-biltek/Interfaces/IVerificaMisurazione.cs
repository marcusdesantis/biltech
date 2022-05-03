using backend_api_core.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_api_core.Interfaces
{
    public interface IVerificaMisurazione
    {
        public Task<IEnumerable<VerificaMisurazioneList>> SearchList(string value, string parameter, int currentPageNumber, int amountShow);
        public Task<VerificaMisurazione> FindById(int id);
        public Task<RespuestaDB> Save(VerificaMisurazione data);
        public Task<RespuestaDB> Modify(VerificaMisurazione data);
        public Task<RespuestaDB> Delete(int id);
    }
}