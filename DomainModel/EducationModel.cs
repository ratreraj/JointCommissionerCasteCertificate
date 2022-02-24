using System.ComponentModel.DataAnnotations;

namespace DomainModel
{
    public class EducationModel
    {
        [Required(ErrorMessage = "Please enter Application  id")]
        public string ApplicationId { get; set; }
        [Required(ErrorMessage = "Please enter Application Recived Date")]
        public string ApplicationRecivedDate { get; set; }
        [Required(ErrorMessage = "Please enter Application Name")]
        public string ApplicationName { get; set; }
        [Required(ErrorMessage = "Please enter Case Id")]
        public string CaseId { get; set; }
        [Required(ErrorMessage = "Please enter Village")]
        public string Village { get; set; }
        [Required(ErrorMessage = "Please enter Taluka")]
        public string Taluka { get; set; }
        [Required(ErrorMessage = "Please enter District")]
        public string District { get; set; }
        [Required(ErrorMessage = "Please enter Application Caste Certificate Date")]
        public string CasteCertificateDate { get; set; }
        [Required(ErrorMessage = "Please enter Application Caste Certificate Number")]
        public string CasteCertificateNumber { get; set; }
        [Required(ErrorMessage = "Please enter Application Caste Certificate Issuing Authority")]
        public string CasteCertificateIssuingAuthority { get; set; }
        [Required(ErrorMessage = "Please enter Application EducationType")]
        public string EducationType { get; set; }
        [Required(ErrorMessage = "Please enter Application PurpuseType")]
        public string PurpuseType { get; set; }
        [Required(ErrorMessage = "Please enter Application Status")]
        public string Status { get; set; }
        [Required(ErrorMessage = "Please enter Application Remark")]
        public string Remark { get; set; }

    }
}
