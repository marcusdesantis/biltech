using backend_api_core.Serialization;
using backend_api_core.Services;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.FileProviders;
using Microsoft.Extensions.Hosting;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace backend_api_core
{
    public class Startup
    {
        public IConfiguration Configuration { get; }
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }
        // This method gets called by the runtime. Use this method to add services to the container.
        // For more information on how to configure your application, visit https://go.microsoft.com/fwlink/?LinkID=398940
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllers();
            // services.AddSignalR();
           
            // serealizacion
            services.AddControllers()
            .AddJsonOptions(options =>
                options.JsonSerializerOptions.Converters.Add(new IntToStringConverter()));

            // Agregando dependencias service
            IoC.AddDependency(services);

            //configuraciones del token JWT BEAREAR
            services.AddAuthentication(options =>
            {
                options.DefaultAuthenticateScheme = "Jwt";
                options.DefaultChallengeScheme = "Jwt";
            }).AddJwtBearer("Jwt", options =>
            {
                options.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateAudience = false,
                    //ValidAudience = "the audience you want to validate",
                    ValidateIssuer = false,
                    //ValidIssuer = "the isser you want to date",

                    ValidateIssuerSigningKey = true,
                    ValidIssuer = Configuration["ApiAuth:Issuer"],
                    ValidAudience = Configuration["ApiAuth:Audience"],
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(Configuration["ApiAuth:SecretKey"])),
                    // IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("the secret that needs to be at least 16 characeters long for HmacSha256")),

                    ValidateLifetime = true, //validate the expiration and not before values in the token

                    ClockSkew = TimeSpan.FromMinutes(5) //5 minute tolerance for the expiration date
                };
            });

            AddSwagger(services);

            services.AddCors(Options =>
            {
                Options.AddPolicy("AllowSpecificOrigin", builder =>
                    builder.AllowAnyHeader()
                    .AllowAnyMethod()
                    .AllowAnyOrigin()
                    );
            });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseSwagger();
            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "Foo API V1");
            });

            //Agregando las direcciones para el CORS
            app.UseCors(buider => buider.WithOrigins("http://localhost:19006", "*").AllowAnyMethod().AllowAnyMethod().AllowAnyHeader().AllowCredentials());

            app.UseRouting();
            // token seguridad
            app.UseAuthentication();

            // ruta de inicio
            app.Use(async (context, next) =>
            {
                await next();
                if (context.Response.StatusCode == 404 && !context.Request.Path.Value.StartsWith("/api/"))
                {
                    context.Request.Path = "/index.html"; // context.Response.WriteAsync("Page not found");
                    await next();
                }
            });

            app.UseDefaultFiles();
            app.UseStaticFiles();
            //app.UseStaticFiles(new StaticFileOptions()
            //{
            //    FileProvider = new PhysicalFileProvider(Path.Combine(Directory.GetCurrentDirectory(), @"Resources")),
            //    RequestPath = new PathString("/Resources")
            //});


            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }


        private void AddSwagger(IServiceCollection services)
        {
            services.AddSwaggerGen(options =>
            {
                var groupName = "v1";

                options.SwaggerDoc(groupName, new OpenApiInfo
                {
                    Title = $"Services for APP (Services Jewelry) {groupName}",
                    Version = groupName,
                    Description = "Capone Services API",
                    Contact = new OpenApiContact
                    {
                        Name = "Biltek",
                        Email = string.Empty,
                        //Url = new Uri("https://www.sergiocapone.com"),
                    }
                });
            });
        }
    }
}
