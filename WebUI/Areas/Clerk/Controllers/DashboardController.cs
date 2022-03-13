using DomainModel;
using Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Services.Interfaces;
using WebUI.Helpers;

namespace WebUI.Areas.Clerk.Controllers
{
    public class DashboardController : BaseController
    {
        private readonly IEducationServices _educationServices;
        User user;
        DashboardSetting dashboardSetting;
        public DashboardController(IEducationServices educationServices)
        {
            _educationServices=educationServices;


        }
        public IActionResult Index()
        {
            Onload();
            var data = _educationServices.GetEducationDetails(user.Id, dashboardSetting.Status);

            return View(data);
        }
        private void Onload()
        {
            user =  HttpContext.Session.GetComplexData<User>("users");
            dashboardSetting =  HttpContext.Session.GetComplexData<DashboardSetting>("dasbaodsetting");
            ViewBag.StatusMaster = new SelectList(_educationServices.GetActionStatus(dashboardSetting.RoleID, dashboardSetting.Status), "NextStatus", "Description");
            ViewBag.StatusDirection = new SelectList(_educationServices.GetActionStatus(dashboardSetting.RoleID, dashboardSetting.Status), "NextStatus", "Direction");
            ViewBag.UsersData = new SelectList(_educationServices.GetUsers(dashboardSetting.Status, "Officer"), "ID", "Name");
            // ViewBag.Genders = new List<string>() { "Male", "Female" };

        }


        [HttpPost]
        public JsonResult GetDetails(string appId)
        {

            EducationModel educationModel = _educationServices.GetEducationByAppId(appId);
            return Json(educationModel);
        }


        [HttpPost]
        public JsonResult Approve(string appId, string status, string remark, int userId)
        {
            int result = 0;

            ApplicationStatus data = new ApplicationStatus
            {
                ApplicationId =appId,
                CurrentStatus = status,
                Remark = remark,
                EntryBy   = userId,

            };
            result=_educationServices.UpdateApplicationStatus(data, userId);
            return Json(result);
        }
    }
}
