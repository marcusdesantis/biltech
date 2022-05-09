using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using BalanceNetFramework.Models;
using System.Net;

namespace BalanceNetFramework.Services
{
    public class ApiClientService
    {
        string _Url = @"http://localhost:5030/";
        HttpClient _client = new HttpClient();

        public ApiClientService()
        {
            _client.BaseAddress = new Uri(_Url);
            _client.DefaultRequestHeaders.Accept.Clear();
            _client.DefaultRequestHeaders.Accept.Add(
                new MediaTypeWithQualityHeaderValue("application/json"));
        }

        public async Task<Respuesta> Login(Users utente)
        {
            var objUtente = Newtonsoft.Json.JsonConvert.SerializeObject(utente);
            HttpResponseMessage response = await _client.PostAsync("api/Utente/Authenticate", new StringContent(objUtente, Encoding.UTF8, "application/json"));

            var responseContent = await response.Content.ReadAsStringAsync();
            var user = JsonConvert.DeserializeObject<Respuesta>(responseContent);

            return user;
        }

        public async Task<RespuestaCliente> getCliente()
        {
            HttpResponseMessage response = await _client.GetAsync("api/Cliente/5");
            if (response.StatusCode == HttpStatusCode.Unauthorized)
            {
                RespuestaCliente respuestaCliente = new RespuestaCliente();
                respuestaCliente.status = "Unauthorized";
                return respuestaCliente;
            }
            var responseContent = await response.Content.ReadAsStringAsync();
            var user = JsonConvert.DeserializeObject<RespuestaCliente>(responseContent);

            return user;
        }

        public async Task<RespuestaCliente> getGliente(string token)
        {

            //_client.DefaultRequestHeaders.Add("Authorization", token);
            //_client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            //_client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Token", "{"+ token+"}");
            _client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

            HttpResponseMessage response = await _client.GetAsync("api/Cliente/5");
            if (response.StatusCode == HttpStatusCode.Unauthorized)
            {
                RespuestaCliente respuestaCliente = new RespuestaCliente();
                respuestaCliente.status = "Unauthorized";
                return respuestaCliente;
            }
            var responseContent = await response.Content.ReadAsStringAsync();
            var user = JsonConvert.DeserializeObject<RespuestaCliente>(responseContent);

            return user;
        }

    }
}
