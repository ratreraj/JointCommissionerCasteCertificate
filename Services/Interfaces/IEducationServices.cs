using DomainModel;
using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Services.Interfaces
{
    public interface IEducationServices
    {

        public int EducationSave(EducationModel model, int userId);
        public int EducationUpadte(EducationModel model, int userId);

        public string GetApplicationId();

        public IEnumerable<EducationModel> GetEducationDetails(int userid, string status);

        public EducationModel GetEducationById(string ApplicationId);

        public EducationModel GetEducationByAppId(string ApplicationId);

        

        public int UpdateApplicationStatus(ApplicationStatus model,int userId);

        IEnumerable<ActionStatusModel> GetActionStatus(int roleId, string Status);
        IEnumerable<UsersModel> GetUsers(string sttaus, string nextststus);

    }
}

