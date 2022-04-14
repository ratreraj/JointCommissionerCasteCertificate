using System.ComponentModel.DataAnnotations;

namespace DomainModel
{
    public class EducationModel
    {
        [Required(ErrorMessage = "Please enter Application  id"),Display(Name ="Application Id")]
        public string ApplicationId { get; set; }
        [Required(ErrorMessage = "Please enter Application Recived Date"), Display(Name = "Application Received Date")]
        public string ApplicationRecivedDate { get; set; }
        [Required(ErrorMessage = "Please enter Application Name"), Display(Name = "Application Name")]
        public string ApplicationName { get; set; }
        [Required(ErrorMessage = "Please enter Case Id"), Display(Name = "Case Id")]
        public string CaseId { get; set; }
        [Required(ErrorMessage = "Please enter Village")]
        public string Village { get; set; }
        [Required(ErrorMessage = "Please enter Taluka")]
        public string Taluka { get; set; }
        [Required(ErrorMessage = "Please enter District")]
        public string District { get; set; }
        [Required(ErrorMessage = "Please enter Application Caste Certificate Date") ,Display(Name = "Caste Certificate Date")]
        public string CasteCertificateDate { get; set; }
        [Required(ErrorMessage = "Please enter Application Caste Certificate Number"), Display(Name = "Caste Certificate Number")]
        public string CasteCertificateNumber { get; set; }
        [Required(ErrorMessage = "Please enter Application Caste Certificate Issuing Authority"), Display(Name = "Caste Certificate Issuing Authority")]
        public string CasteCertificateIssuingAuthority { get; set; }

        [Required(ErrorMessage = "Please enter Application ServiceType"),Display(Name ="Service Type")]
        public string ServiceType { get; set; }
        [Required(ErrorMessage = "Please enter Application PurpuseType"),Display(Name = "Purpose Type") ]
        public string PurpuseType { get; set; }

        [Required(ErrorMessage = "Please enter Application Post")]
        public string Post { get; set; }

        [Required(ErrorMessage = "Please enter Application Rank")]
        public string Rank { get; set; }

        [Required(ErrorMessage = "Please enter Application OfficerName"), Display(Name ="Officer Name")]
        public string OfficerName { get; set; }

        [Display(Name = "Court Contempt")]
        public string CourtConttept { get; set; }

        [Required(ErrorMessage = "Please enter Application Tribe")]
        public string Tribe { get; set; }

        [Required(ErrorMessage = "Please enter Application ComplainerName"), Display(Name = "Complainer Name")]
        public string ComplainerName { get; set; }

        [Required(ErrorMessage = "Please enter Application RespondentName"), Display(Name = "Respondent Name")]

        public string RespondentName { get; set; }

        [Required(ErrorMessage = "Please enter Application Evidence"), Display(Name = "Evidence")]
        public string Evidence { get; set; }

        [Required(ErrorMessage = "Please enter Application Status")]
        public string Status { get; set; }

        public string Remark { get; set; }

    }
}
