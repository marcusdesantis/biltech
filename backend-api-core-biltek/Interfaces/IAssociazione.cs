using backend_api_core.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_api_core.Interfaces
{
    public interface IAssociazione
    {
        public Task<IEnumerable<AssociazioneList>> SearchList(string value, string parameter, int currentPageNumber, int amountShow);
        public Task<Associazione> FindById(int id);
        public Task<RespuestaDB> Save(Associazione data);
        public Task<RespuestaDB> Modify(Associazione data);
        public Task<RespuestaDB> Delete(int id);
    }
}