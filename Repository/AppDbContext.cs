using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.Data.SqlClient;
using System.Data;
using DomainModel;

namespace Repository
{
    public class AppDbContext : IdentityDbContext<User, Role, int>
    {
        public AppDbContext()
        {

        }

        public AppDbContext(DbContextOptions<AppDbContext> dbContext) : base(dbContext)
        {

        }

        public DbSet<Education> educations { get; set; }
        public DbSet<ApplicationStatus> applicationStatuses { get; set; }
        public DbSet<DDLMaster> dDLMasters { get; set; }
        public DbSet<Districts> districts { get; set; }
        public DbSet<StatusMaster> statusMasters { get; set; }
        public DbSet<Talukas> talukas { get; set; }
        public DbSet<Villages> villages { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer(@"data source=DESKTOP-GQQOR30; initial catalog=JointCommissionerCasteCertificate;persist security info=True;user id=sa;password=Sql@2019; MultipleActiveResultSets=True;");

            }

            base.OnConfiguring(optionsBuilder);
        }

        public string GetApplicationId()
        {
            string applicationId = "";

            using (var cmd = Database.GetDbConnection().CreateCommand())
            {

                cmd.CommandText ="GetApplicationId";
                cmd.CommandType= System.Data.CommandType.StoredProcedure;
                // Sql Parameters 
                //SqlParameter sqlParameter = new SqlParameter("","");
                //cmd.Parameters.Add(sqlParameter);

                Database.OpenConnection();
                using (var reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        applicationId =  reader.GetString("ApplicationId");
                    }
                }
            }

            Database.CloseConnection();
            return applicationId;
        }

        public IEnumerable<EducationModel> GetEducation(int userid, string status)
        {
            List<EducationModel> educationList = new List<EducationModel>();

            using (var cmd = Database.GetDbConnection().CreateCommand())
            {

                cmd.CommandText ="GetEducationDetails";
                cmd.CommandType= System.Data.CommandType.StoredProcedure;
                // Sql Parameters 
                SqlParameter UserId = new SqlParameter("@UserId", userid);
                cmd.Parameters.Add(UserId);
                SqlParameter Status = new SqlParameter("@Status", status);
                cmd.Parameters.Add(Status);


                Database.OpenConnection();
                using (var reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        EducationModel education = new EducationModel
                        {


                            ApplicationId =  reader.GetString("AppId"),
                            ApplicationRecivedDate =  reader.GetString("ApplicationRecivedDate"),
                            ApplicationName = reader.GetString("ApplicationName"),
                            CaseId = reader.GetString("CaseId"),
                            Village = reader.GetString("Village"),
                            Taluka = reader.GetString("Taluka"),
                            District = reader.GetString("District"),
                            CasteCertificateDate = reader.GetString("CasteCertificateDate"),
                            CasteCertificateNumber = reader.GetString("CasteCertificateNumber"),
                            CasteCertificateIssuingAuthority = reader.GetString("CasteCertificateIssuingAuthority"),
                            EducationType = reader.GetString("EducationType"),
                            PurpuseType = reader.GetString("PurpuseType"),
                            Status = reader.GetString("Status"),
                            Remark = reader.GetString("Remark")
                        };
                        educationList.Add(education);

                    }
                }
            }

            Database.CloseConnection();
            return educationList;
        }

        public EducationModel GetEducationById(string ApplicationId)
        {
            EducationModel educationModel = new EducationModel();

            using (var cmd = Database.GetDbConnection().CreateCommand())
            {

                cmd.CommandText ="GetEducationById";
                cmd.CommandType= System.Data.CommandType.StoredProcedure;
                // Sql Parameters 
                SqlParameter applicationId = new SqlParameter("@ApplicationId", ApplicationId);
                cmd.Parameters.Add(applicationId);

                Database.OpenConnection();
                using (var reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        educationModel.ApplicationId =  reader.GetString("AppId");
                        educationModel.ApplicationRecivedDate =  reader.GetString("ApplicationRecivedDate");
                        educationModel.ApplicationName = reader.GetString("ApplicationName");
                        educationModel.CaseId = reader.GetString("CaseId");
                        educationModel.Village = reader.GetString("Village");
                        educationModel.Taluka = reader.GetString("Taluka");
                        educationModel.District = reader.GetString("District");
                        educationModel.CasteCertificateDate = reader.GetString("CasteCertificateDate");
                        educationModel.CasteCertificateNumber = reader.GetString("CasteCertificateNumber");
                        educationModel.CasteCertificateIssuingAuthority = reader.GetString("CasteCertificateIssuingAuthority");
                        educationModel.CasteCertificateIssuingAuthority = reader.GetString("CasteCertificateIssuingAuthority");
                        educationModel.EducationType = reader.GetString("EducationType");
                        educationModel.PurpuseType = reader.GetString("PurpuseType");
                        educationModel.Status = reader.GetString("Status");
                        educationModel.Remark = reader.GetString("Remark");
                    }
                }
            }

            Database.CloseConnection();
            return educationModel;
        }

        public int UpdateApplicationStatus(ApplicationStatus application)
        {
            int Result = 0;

            using (var cmd = Database.GetDbConnection().CreateCommand())
            {

                cmd.CommandText ="UpdateApplicationStatus";
                cmd.CommandType= System.Data.CommandType.StoredProcedure;
                // Sql Parameters 
                SqlParameter[] sqlParameter = {
                new SqlParameter("@ApplicationId", application.ApplicationId),
                new SqlParameter("@Status", application.Status),
                new SqlParameter("@Remark", application.Remark),
                new SqlParameter("@UserId", application.EntryBy)
                };
                cmd.Parameters.AddRange(sqlParameter);
                Database.OpenConnection();
                cmd.ExecuteNonQuery();
                Database.OpenConnection();

                Result=1;
            }

            return Result;
        }

    }
}
