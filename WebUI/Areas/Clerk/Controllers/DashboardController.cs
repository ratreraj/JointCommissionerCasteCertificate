using DomainModel;
using Entities;
using Fingers10.ExcelExport.ActionResults;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Services.Interfaces;
using System.Collections.Generic;
using System.Threading.Tasks;
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


        public async Task<IActionResult> Report()
        {

            var data = await _educationServices.GetEducationExport();
            return View(data);
        }


        public async Task<IActionResult> ExportReport()
        {
            var data = await _educationServices.GetEducationExport();


            return new ExcelResult<EducationReport>(data, "Demo Sheet Name", "Fingers10");
        }

        [HttpPost]
        public JsonResult GetDetails(string appId)
        {

            EducationModel educationModel = _educationServices.GetEducationByAppId(appId);
            return Json(educationModel);
        }


        [HttpPost]
        public JsonResult GetHistory(string appId)
        {

            IEnumerable<StatusHistory> statusHistory = _educationServices.GetStatusHistory(appId);
            return Json(statusHistory);
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

        [HttpPost]
        public ActionResult GetUser(string cuurentStatus, string nextStatus)
        {

            if (cuurentStatus!="")
            {

                return Json(new SelectList(_educationServices.GetUsers(cuurentStatus, nextStatus), "ID", "Name"));
            }
            else
            {
                return Json(new SelectList(string.Empty, "ID", "Name"));
            }

        }

    }
}
