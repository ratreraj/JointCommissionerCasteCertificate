using Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Repository.Interfaces;
using Entities;
using DomainModel;
using Repository;

namespace Services.Implementations
{
    public class EducationServices : IEducationServices
    {
        private readonly IRepository<Education> _educationRepo;
        private readonly IRepository<ApplicationStatus> _applicationStatusRepo;
        private readonly AppDbContext _appDbContext;
        public EducationServices(IRepository<Education> educationRepo, IRepository<ApplicationStatus> applicationStatusRep)
        {
            _educationRepo = educationRepo;
            _applicationStatusRepo = applicationStatusRep;
            _appDbContext = new AppDbContext();
        }
        public int EducationSave(EducationModel model, int userId)
        {
            int Ok = 0;
            Education data = new Education
            {
                AppId= model.ApplicationId,
                ApplicationRecivedDate= Convert.ToDateTime(model.ApplicationRecivedDate),
                ApplicationName= model.ApplicationName,
                CaseId= model.CaseId,
                Village   = model.Village,
                Taluka =   model.Taluka,
                District = model.District,
                CasteCertificateDate= Convert.ToDateTime(model.CasteCertificateDate),
                CasteCertificateNumber= model.CasteCertificateNumber,
                CasteCertificateIssuingAuthority= model.CasteCertificateIssuingAuthority,
                EducationType= model.EducationType,
                PurpuseType =  model.PurpuseType,
                EntryBy=userId,
                EntryDate = System.DateTime.Now,
            };
            _educationRepo.Add(data);
            ApplicationStatus applicationStatus = new ApplicationStatus
            {
                ApplicationId = model.ApplicationId,
                Status= model.Status,
                Remark = model.Remark,
                EntryBy=userId,
                EntryDate = System.DateTime.Now,
            };

            int result = _educationRepo.SaveChange();
            if (result==1)
            {
                _applicationStatusRepo.Add(applicationStatus);
                Ok= _applicationStatusRepo.SaveChange();
            }

            return Ok;
        }

        public int EducationUpadte(EducationModel model, int userId)
        {
            Education data = new Education
            {
                AppId= model.ApplicationId,
                ApplicationRecivedDate= Convert.ToDateTime(model.ApplicationRecivedDate),
                ApplicationName= model.ApplicationName,
                CaseId= model.CaseId,
                Village   = model.Village,
                Taluka =   model.Taluka,
                District = model.District,
                CasteCertificateDate= Convert.ToDateTime(model.CasteCertificateDate),
                CasteCertificateNumber= model.CasteCertificateNumber,
                CasteCertificateIssuingAuthority= model.CasteCertificateIssuingAuthority,
                EducationType= model.EducationType,
                EntryBy=userId,
                EntryDate = System.DateTime.Now,
            };
            _educationRepo.Update(data);
            return _educationRepo.SaveChange();
        }

        public string GetApplicationId()
        {
            return _appDbContext.GetApplicationId();
        }

        public EducationModel GetEducationById(string ApplicationId)
        {
            return _appDbContext.GetEducationById(ApplicationId);
        }

        public IEnumerable<EducationModel> GetEducationDetails(int userid, string status)
        {
            return _appDbContext.GetEducation(userid, status);
        }

        public int UpdateApplicationStatus(ApplicationStatus model, int userId)
        {
            int result = 0;
            ApplicationStatus data = new ApplicationStatus
            {
                ApplicationId = model.ApplicationId,
                Status = model.Status,
                Remark = model.Remark,
                EntryBy   = userId,

            };
            result= _appDbContext.UpdateApplicationStatus(model);

            return result;
        }
    }
}
