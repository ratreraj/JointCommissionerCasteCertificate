using Microsoft.AspNetCore.Mvc;
using Services.Interfaces;

namespace WebUI.Areas.Clerk.Controllers
{
    public class DashboardController : BaseController
    {
        private readonly IEducationServices _educationServices;
       
        public DashboardController(IEducationServices educationServices)
        {
            _educationServices=educationServices;
           
        }
        public IActionResult Index()
        {
            var data = _educationServices.GetEducationDetails(2, "CZ");

            return View(data);
        }
    }
}
