using Entities;
using Repository.Interfaces;
using Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Services.Implementations
{
    public class AppSettings : IAppSetting
    {
        private readonly IRepository<DashboardSetting> _dashboardRepo;

        public AppSettings(IRepository<DashboardSetting> dashboardrepo)
        {
            _dashboardRepo = dashboardrepo;
        }
        public DashboardSetting GetDashboardSetting(string rolename)
        {
            return _dashboardRepo.GetAll().Where(x => x.RoleName== rolename).FirstOrDefault();
        }
    }
}
