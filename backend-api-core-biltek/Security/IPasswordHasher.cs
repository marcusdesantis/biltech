namespace backend_api_core.Security
{
    public interface IPasswordHasher
    {
        byte[] Hash(string password, byte[] salt);
    }
}