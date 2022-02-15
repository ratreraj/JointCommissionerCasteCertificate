using Microsoft.AspNetCore.Mvc;
using WebUI.Helpers;

namespace WebUI.Areas.Admin.Controllers
{
    [CustomAuthorizeFilter(Roles = "Admin")]
    [Area("Admin")]
    public class BaseController : Controller
    {
    }
}
