using Microsoft.AspNetCore.Mvc;

namespace WebUI.Areas.Clerk.Controllers
{
    public class DashboardController : BaseController
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
