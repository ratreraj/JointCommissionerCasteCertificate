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
        public PurposeController(IMasterServices masterServices)
        {

            _masterServices=masterServices;
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




        private void Onload()
        {

            ViewBag.StatusMaster = new SelectList(_masterServices.GetStatusMaster(), "Status", "Description");
            ViewBag.District = new SelectList(_masterServices.GetDistricts(), "DistrictID", "DistictName");
            ViewBag.PurpuseType = new SelectList(_masterServices.GetDDLMaster("PURPOSETYPE"), "ValueFields", "DisplayFields");
            // ViewBag.Genders = new List<string>() { "Male", "Female" };
            ViewBag.City = null;
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
