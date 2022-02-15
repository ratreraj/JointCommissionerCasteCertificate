using Microsoft.AspNetCore.Mvc;

namespace WebUI.Areas.Officer.Controllers
{
    public class DashboardController : BaseController
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
