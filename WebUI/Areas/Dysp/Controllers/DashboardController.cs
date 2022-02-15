using Microsoft.AspNetCore.Mvc;

namespace WebUI.Areas.Dysp.Controllers
{
    public class DashboardController : BaseController
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
