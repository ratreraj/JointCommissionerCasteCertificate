using DomainModel;
using Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Services;
using Services.Interfaces;
using System.Collections.Generic;
using WebUI.Helpers;

namespace WebUI.Areas.Clerk.Controllers
{
    public class PurposeController : BaseController
    {
        private readonly IMasterServices _masterServices;
        private readonly IEducationServices _educationServices;
        User user;
        DashboardSetting dashboardSetting;
        public PurposeController(IMasterServices masterServices, IEducationServices educationServices)
        {

            _masterServices=masterServices;
            _educationServices=educationServices;
        }
        public IActionResult Index()
        {
            Onload();
            return View();
        }

        public IActionResult Education()
        {
            Onload();
            ViewBag.Taluka = null;
            return View();
        }

        public IActionResult Edit(string ApplicationId)
        {
            Onload();
            EducationModel educationModel = _educationServices.GetEducationById(ApplicationId);
            ViewBag.Taluka= educationModel.Taluka;
            return View("Education", educationModel);
        }

        [HttpPost]
        public IActionResult Education(EducationModel model)
        {
            int result = 0;
            Validation(model);
            if (ModelState.IsValid)
            {
                user =  HttpContext.Session.GetComplexData<User>("users");
                result= _educationServices.EducationSave(model, user.Id);

                if (result!=0)
                {
                    return RedirectToAction("Index", "Dashboard");
                }
            }


            return View();
        }

        [HttpPost]
        public IActionResult Edit(EducationModel model)
        {
            int result = 0;
            Validation(model);
            if (ModelState.IsValid)
            {
                user =  HttpContext.Session.GetComplexData<User>("users");
                result= _educationServices.EducationUpadte(model, user.Id);

                if (result!=0)
                {
                    return RedirectToAction("Index", "Dashboard");
                }
            }


            return View();
        }



        private void Onload()
        {
            user =  HttpContext.Session.GetComplexData<User>("users");
            dashboardSetting =  HttpContext.Session.GetComplexData<DashboardSetting>("dasbaodsetting");

            ViewBag.StatusMaster = new SelectList(_masterServices.GetStatusMaster(), "Status", "Description");
            ViewBag.District = new SelectList(_masterServices.GetDistricts(), "DistrictID", "DistictName");
            ViewBag.PurpuseType = new SelectList(_masterServices.GetDDLMaster("PURPOSETYPE"), "ValueFields", "DisplayFields");
            ViewBag.Tribe = new SelectList(_masterServices.GetDDLMaster("TRIBE"), "ValueFields", "DisplayFields");
            ViewBag.ServiceType = new SelectList(_masterServices.GetDDLMaster("SERVICETYPE"), "ValueFields", "DisplayFields");
            // ViewBag.Genders = new List<string>() { "Male", "Female" };
            
            ViewData["ApplicationId"] = _educationServices.GetApplicationId();
        }


        [HttpPost]
        public ActionResult GetTalukaList(int DistrictId)
        {

            if (DistrictId!=0)
            {

                return Json(new SelectList(_masterServices.GetTalukas(DistrictId), "TalukaId", "TalukaName"));
            }
            else
            {
                return Json(new SelectList(string.Empty, "TalukaId", "TalukaName"));
            }

        }

        [HttpPost]
        public ActionResult GetVillagesList(int TalukaId)
        {

            if (TalukaId!=0)
            {

                return Json(new SelectList(_masterServices.GetVillages(TalukaId), "VillageId", "VillageName"));
            }
            else
            {
                return Json(new SelectList(string.Empty, "VillageId", "VillageName"));
            }

        }

        public void Validation(EducationModel model)
        {
            if (model.PurpuseType=="SR" || model.PurpuseType=="PS")
            {


                ModelState.Remove("ComplainerName");
                ModelState.Remove("RespondentName");
                ModelState.Remove("Evidence");

            }
            else if (model.PurpuseType=="CL")
            {
                ModelState.Remove("Rank");
                ModelState.Remove("Post");
                ModelState.Remove("ServiceType");
                ModelState.Remove("OfficerName");
            }
            else
            {
                ModelState.Remove("Rank");
                ModelState.Remove("Post");
                ModelState.Remove("ServiceType");
                ModelState.Remove("OfficerName");
                ModelState.Remove("ComplainerName");
                ModelState.Remove("RespondentName");
                ModelState.Remove("Evidence");


            }
        }

    }
}
