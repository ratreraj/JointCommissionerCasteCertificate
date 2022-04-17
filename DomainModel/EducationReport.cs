using Fingers10.ExcelExport.Attributes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainModel
{
    public class EducationReport
    {


        [IncludeInReport(Order = 1)]
        public string ApplicationId { get; set; }
        [IncludeInReport(Order = 2)]
        public string ApplicationRecivedDate { get; set; }
        [IncludeInReport(Order = 3)]
        public string ApplicationName { get; set; }
        [IncludeInReport(Order = 4)]
        public string CaseId { get; set; }
        public string Village { get; set; }
        public string Taluka { get; set; }
        public string District { get; set; }
        public string CasteCertificateDate { get; set; }
        public string CasteCertificateNumber { get; set; }
        public string CasteCertificateIssuingAuthority { get; set; }

        public string ServiceType { get; set; }
        public string PurpuseType { get; set; }

        public string Status { get; set; }

        public string Remark { get; set; }


        //ApplicationId =  reader.GetString("AppId"),
        //                    ApplicationRecivedDate =  reader.GetString("ApplicationRecivedDate"),
        //                    ApplicationName = reader.GetString("ApplicationName"),
        //                    CaseId = reader.GetString("CaseId"),
        //                    Village = reader.GetString("Village"),
        //                    Taluka = reader.GetString("Taluka"),
        //                    District = reader.GetString("District"),
        //                    CasteCertificateDate = reader.GetString("CasteCertificateDate"),
        //                    CasteCertificateNumber = reader.GetString("CasteCertificateNumber"),
        //                    CasteCertificateIssuingAuthority = reader.GetString("CasteCertificateIssuingAuthority"),
        //                    ServiceType  = reader.GetString("ServiceType"),
        //                    PurpuseType = reader.GetString("PurpuseType"),
        //                    Status = reader.GetString("CurrentStatus"),
        //                    Remark = reader.GetString("Remark")
    }
}
