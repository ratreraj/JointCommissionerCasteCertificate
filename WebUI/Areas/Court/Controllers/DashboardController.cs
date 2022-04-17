using DomainModel;
using Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Services.Interfaces;
using System.Collections.Generic;
using WebUI.Helpers;


namespace WebUI.Areas.Court.Controllers
{


    public class DashboardController : BaseController
    {
        private readonly IEducationServices _educationServices;
        private readonly IMasterServices _masterServices;
        User user;
        DashboardSetting dashboardSetting;

        public DashboardController(IEducationServices educationServices, IMasterServices masterServices)
        {
            _educationServices= educationServices;
            _masterServices=masterServices;
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
            ViewBag.Users = new SelectList(_educationServices.GetUsers(dashboardSetting.Status, "Officer"), "ID", "Name");
            // ViewBag.Genders = new List<string>() { "Male", "Female" };

        }


        [HttpPost]
        public JsonResult GetDetails(string appId)
        {
            EducationModel educationModel = _educationServices.GetEducationByAppId(appId);
            return Json(educationModel);
        }


        public IActionResult Report()
        {
            Onload();
            var data = _educationServices.GetEducationDetails(user.Id, dashboardSetting.Status);
            return View(data);
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


        [HttpPost]
        public JsonResult GetHistory(string appId)
        {

            IEnumerable<StatusHistory> statusHistory = _educationServices.GetStatusHistory(appId);
            return Json(statusHistory);
        }
    }
}
