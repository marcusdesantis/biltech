using System.Threading.Tasks;

namespace backend_api_core.Security
{
    public interface IJwtTokenGenerator
    {
        Task<string> CreateToken(string username);
    }
}