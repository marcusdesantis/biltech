using backend_api_core.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_api_core.Interfaces
{
    public interface IMisurazione
    {
        public Task<IEnumerable<MisurazioneList>> SearchList(string value, string parameter, int currentPageNumber, int amountShow);
        public Task<Misurazione> FindById(int id);
        public Task<RespuestaDB> Save(Misurazione data);
        public Task<RespuestaDB> Modify(Misurazione data);
        public Task<RespuestaDB> Delete(int id);
    }
}
