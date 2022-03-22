using backend_api_core.Data;
using backend_api_core.Interfaces;
using backend_api_core.Models;
using Microsoft.Extensions.DependencyInjection;

namespace backend_api_core.Services
{
    public static class IoC
    {
        public static IServiceCollection AddDependency(this IServiceCollection services)
        {
            services.AddScoped<IC_conexion, C_conexion>();
   
            services.AddTransient<IBilancia, BilanciaData>();
            services.AddTransient<IBilanciaModulo, BilanciaModuloData>();
            services.AddTransient<IFormula, FormulaData>();
            services.AddTransient<IFormulaProdotto, FormulaProdottoData>();
            services.AddTransient<IImpiantoBilancia, ImpiantoBilanciaData>();
            services.AddTransient<IImpianto, ImpiantoData>();
            services.AddTransient<IMisurazione, MisurazioneData>();
            services.AddTransient<IModello, ModelloData>();
            services.AddTransient<IModulo, ModuloData>();
            services.AddTransient<IProdotto, ProdottoData>();
            services.AddTransient<IUnitamisura, UnitamisuraData>();
            services.AddTransient<IBarcodeProdotto, BarcodeProdottoData>();
            services.AddTransient<IMagazzino, MagazzinoData>();
            services.AddTransient<ITipologiaProdotto, TipologiaProdottoData>();

            return services;
        }
    }
}
