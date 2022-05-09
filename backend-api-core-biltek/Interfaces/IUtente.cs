using backend_api_core.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_api_core.Interfaces
{
    public interface IUtente
    {
        public Utente Utente
        {
            get;
        }
        public Task<IEnumerable<UtenteList>> SearchList(string value, string parameter, int currentPageNumber, int amountShow);
        public Task<Utente> FindById(int id);
        public Task<bool> isAuthenticate(Utente utente);
        public Task<RespuestaDB> Save(Utente data);
        public Task<RespuestaDB> Modify(Utente data);
        public Task<RespuestaDB> Delete(int id);
    }
}