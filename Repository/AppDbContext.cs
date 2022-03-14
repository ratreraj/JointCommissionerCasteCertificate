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
        public DbSet<ActionStatus> actionStatus { get; set; }
        public DbSet<StatusHistory> statusHistory { get; set; }
        public DbSet<DashboardSetting> dashboardSetting { get; set; }


        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer(@"data source=DESKTOP-GQQOR30; initial catalog=JointCommissionerCasteCertificate;persist security info=True;user id=sa;password=Sql@123; MultipleActiveResultSets=True;");

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
                SqlParameter Status = new SqlParameter("@CurrentStatus", status);
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
                            Status = reader.GetString("CurrentStatus"),
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

        public EducationModel GetEducationByAppId(string ApplicationId)
        {
            EducationModel educationModel = new EducationModel();

            using (var cmd = Database.GetDbConnection().CreateCommand())
            {

                cmd.CommandText ="GetEducationByAppId";
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
                        educationModel.Status = reader.GetString("CurrentStatus");
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
                new SqlParameter("@CurrentStatus", application.CurrentStatus),
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

        public IEnumerable<ActionStatusModel> GetActionStatus(int RoleID, string Status)
        {
            List<ActionStatusModel> statusModels = new List<ActionStatusModel>();

            using (var cmd = Database.GetDbConnection().CreateCommand())
            {

                cmd.CommandText ="GetActionStatus";
                cmd.CommandType= System.Data.CommandType.StoredProcedure;
                // Sql Parameters 
                SqlParameter RoleId = new SqlParameter("@RoleID", RoleID);
                cmd.Parameters.Add(RoleId);
                SqlParameter status = new SqlParameter("@CurrentStatus", Status);
                cmd.Parameters.Add(status);


                Database.OpenConnection();
                using (var reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        ActionStatusModel actionStatus = new ActionStatusModel
                        {


                            NextStatus =  reader.GetString("NextStatus"),
                            Description =  reader.GetString("Description"),
                            Direction =  reader.GetString("Direction"),

                        };
                        statusModels.Add(actionStatus);

                    }
                }
            }

            Database.CloseConnection();


            return statusModels;
        }

        public IEnumerable<UsersModel> GetUsers(string CuurentStatus, string NextStatus)
        {
            List<UsersModel> users = new List<UsersModel>();

            using (var cmd = Database.GetDbConnection().CreateCommand())
            {

                cmd.CommandText ="GetUsers";
                cmd.CommandType= System.Data.CommandType.StoredProcedure;
                // Sql Parameters 
                SqlParameter cuurentStatus = new SqlParameter("@CurrentStatus", CuurentStatus);
                cmd.Parameters.Add(cuurentStatus);
                SqlParameter nextStatus = new SqlParameter("@NextStatus", NextStatus);
                cmd.Parameters.Add(nextStatus);



                Database.OpenConnection();
                using (var reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        UsersModel usersModel = new UsersModel
                        {


                            ID =  reader.GetInt32("Id"),
                            Name =  reader.GetString("Name"),


                        };
                        users.Add(usersModel);

                    }
                }
            }

            Database.CloseConnection();


            return users;
        }


        public IEnumerable<StatusHistory> GetHistory(string AppId)
        {
            List<StatusHistory> statusHistories = new List<StatusHistory>();

            using (var cmd = Database.GetDbConnection().CreateCommand())
            {

                cmd.CommandText ="GetAppHistory";
                cmd.CommandType= System.Data.CommandType.StoredProcedure;
                // Sql Parameters 
                SqlParameter appId = new SqlParameter("@AppId", AppId);
                cmd.Parameters.Add(appId);



                Database.OpenConnection();
                using (var reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        StatusHistory status = new StatusHistory
                        {
                            ApplicationId =  reader.GetString("ApplicationId"),
                            CurrentStatus= reader.GetString("CurrentStatus"),
                            CurrentDate=  reader.GetDateTime("CurrentDate"),
                            PerviousStatus= reader.GetString("PerviousStatus"),
                            PerviousDate=reader.GetDateTime("PerviousDate"),
                            Remark = reader.GetString("Remark")
                        };
                        statusHistories.Add(status);

                    }
                }
            }

            Database.CloseConnection();
            return statusHistories;
        }
    }
}
