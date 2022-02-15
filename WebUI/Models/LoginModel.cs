using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace WebUI.Models
{
    public class LoginModel
    {
        [Required(ErrorMessage = "Please enter email id")]
        public string UserName { get; set; }
        [Required(ErrorMessage = "Please enter password"),DataType(DataType.Password,ErrorMessage ="invlid password as per the policy")]
        public string Password { get; set; }
    }
}
