using Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Services.Interfaces;

namespace WebUI.Areas.Dysp.Controllers
{
    public class DashboardController : BaseController
    {
        private readonly IEducationServices _educationServices;
        private readonly IMasterServices _masterServices;
        public DashboardController(IEducationServices educationServices, IMasterServices masterServices)
        {
            _educationServices= educationServices;
            _masterServices=masterServices;
        }
        public IActionResult Index()
        {
            var data = _educationServices.GetEducationDetails(2, "CZ");
            Onload();
            return View(data);
        }

        private void Onload()
        {

            ViewBag.StatusMaster = new SelectList(_masterServices.GetStatusMaster(), "Status", "Description");

            // ViewBag.Genders = new List<string>() { "Male", "Female" };

        }

        [HttpPost]
        public JsonResult Approve(string appId, string status, string remark, int userId)
        {
            int result = 0;
            
            ApplicationStatus data = new ApplicationStatus
            {
                ApplicationId =appId,
                Status = status,
                Remark = remark,
                EntryBy   = userId,

            };
            result=_educationServices.UpdateApplicationStatus(data, userId);
            return Json(result);
        }
    }
}
