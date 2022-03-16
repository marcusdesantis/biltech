namespace backend_api_core.Models
{
    public class RespuestaCore
    {
        public string status { get; set; }
        public dynamic response { get; set; }
        public int total { get; set; }
    }
}