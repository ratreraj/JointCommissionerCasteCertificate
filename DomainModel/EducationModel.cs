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

        [Required(ErrorMessage = "Please enter Application ServiceType")]
        public string ServiceType { get; set; }
        [Required(ErrorMessage = "Please enter Application PurpuseType")]
        public string PurpuseType { get; set; }

        [Required(ErrorMessage = "Please enter Application Post")]
        public string Post { get; set; }

        [Required(ErrorMessage = "Please enter Application Rank")]
        public string Rank { get; set; }

        [Required(ErrorMessage = "Please enter Application OfficerName")]
        public string OfficerName { get; set; }

        public string CourtConttept { get; set; }

        [Required(ErrorMessage = "Please enter Application Tribe")]
        public string Tribe { get; set; }

        [Required(ErrorMessage = "Please enter Application ComplainerName")]
        public string ComplainerName { get; set; }

        [Required(ErrorMessage = "Please enter Application RespondentName")]
        public string RespondentName { get; set; }

        [Required(ErrorMessage = "Please enter Application Evidence")]
        public string Evidence { get; set; }

        [Required(ErrorMessage = "Please enter Application Status")]
        public string Status { get; set; }

        public string Remark { get; set; }

    }
}
