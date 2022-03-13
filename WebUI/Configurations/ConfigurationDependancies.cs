
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Services.Implementations;
using Services.Interfaces;
using WebUI.Helpers;

namespace WebUI.Configurations
{
    public static class ConfigurationDependancies

    {
        public static void ConfigureServices(IServiceCollection services, IConfiguration configuration)
        {
            services.AddScoped<IAuthenticationService, AuthenticationService>();
            services.AddScoped<IUserAccessor, UserAccessor>();
            services.AddScoped<IMasterServices, MasterServices>();
            services.AddScoped<IEducationServices, EducationServices>();
            services.AddScoped<IAppSetting, AppSettings>();

        }
    }
}
