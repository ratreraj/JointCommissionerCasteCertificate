using Entities;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Repository;
using Repository.Interfaces;
using Repository.Implementations;
using Services.Implementations;
using Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Services.Configurations
{
    public static class ConfigurationServices
    {
        public static void ConfigureServices(IServiceCollection services, IConfiguration configuration)
        {
            services.AddDbContext<AppDbContext>(option =>
            {
                option.UseSqlServer(configuration.GetConnectionString("Default"));
            });

            services.AddIdentity<User, Role>().AddEntityFrameworkStores<AppDbContext>().AddDefaultTokenProviders();

            services.AddScoped<DbContext, AppDbContext>();
            services.AddTransient<IRepository<StatusMaster>, Repository<StatusMaster>>();
            services.AddTransient<IRepository<DDLMaster>, Repository<DDLMaster>>();
            services.AddTransient<IRepository<Districts>, Repository<Districts>>();
            services.AddTransient<IRepository<Talukas>, Repository<Talukas>>();
            services.AddTransient<IRepository<Villages>, Repository<Villages>>();
            //  services.AddScoped<IMasterServices, MasterServices>();

        }
    }
}
