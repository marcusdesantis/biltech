using backend_api_core.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_api_core.Interfaces
{
    public interface ISchedulerControllo
    {
        public Task<IEnumerable<SchedulerControlloList>> SearchList(string value, string parameter, int currentPageNumber, int amountShow);
        public Task<SchedulerControllo> FindById(int id);
        public Task<RespuestaDB> Save(SchedulerControllo data);
        public Task<RespuestaDB> Modify(SchedulerControllo data);
        public Task<RespuestaDB> Delete(int id);
    }
}