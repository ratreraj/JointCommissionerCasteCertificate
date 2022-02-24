using DomainModel;
using Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Services;
using Services.Interfaces;
using System.Collections.Generic;

namespace WebUI.Areas.Clerk.Controllers
{
    public class PurposeController : BaseController
    {
        private readonly IMasterServices _masterServices;
        private readonly IEducationServices _educationServices;
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
            return View();
        }

        public IActionResult Edit(string ApplicationId)
        {
            Onload();
            EducationModel educationModel = _educationServices.GetEducationById(ApplicationId);
            return View("Education", educationModel);
        }

        [HttpPost]
        public IActionResult Education(EducationModel model)
        {
            int result = 0;
            if (ModelState.IsValid)
            {
                result= _educationServices.EducationSave(model, 2);
            }


            return View();
        }



        private void Onload()
        {

            ViewBag.StatusMaster = new SelectList(_masterServices.GetStatusMaster(), "Status", "Description");
            ViewBag.District = new SelectList(_masterServices.GetDistricts(), "DistrictID", "DistictName");
            ViewBag.PurpuseType = new SelectList(_masterServices.GetDDLMaster("PURPOSETYPE"), "ValueFields", "DisplayFields");
            ViewBag.EducationType = new SelectList(_masterServices.GetDDLMaster("EDUCATION"), "ValueFields", "DisplayFields");
            // ViewBag.Genders = new List<string>() { "Male", "Female" };
            ViewBag.City = null;
            ViewBag.ApplicationId = _educationServices.GetApplicationId();
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

    }
}
