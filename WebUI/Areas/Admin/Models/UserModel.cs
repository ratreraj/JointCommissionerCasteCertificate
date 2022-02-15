using System.ComponentModel.DataAnnotations;

namespace WebUI.Areas.Admin.Models
{
    public class UserModel
    {
        public int Id { get; set; }
        [Required(ErrorMessage = "please enter your name"), MaxLength(50)]
        public string Name { get; set; }
        public string UserName { get; set; }
        [Required(ErrorMessage = "please enter email"), MaxLength(100), DataType(DataType.EmailAddress, ErrorMessage = ("invalid email id"))]
        public string Email { get; set; }
        [Required(ErrorMessage = "please enter password"), MaxLength(20), DataType(DataType.Password, ErrorMessage = "invlid password as per the policy")]
        public string Password { get; set; }
        [Required(ErrorMessage = "please enter confrim password"), Compare("Password", ErrorMessage = "compare password doesn't match"), DataType(DataType.Password, ErrorMessage = "invlid password as per the policy")]
        public string ConfirmPassword { get; set; }
        [Required(ErrorMessage = "please enter phome number")]
        public string PhoneNumber { get; set; }

    }
}
