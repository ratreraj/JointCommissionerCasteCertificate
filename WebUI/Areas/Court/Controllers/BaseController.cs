using Microsoft.AspNetCore.Mvc;
using WebUI.Helpers;

namespace WebUI.Areas.Court.Controllers
{
    [CustomAuthorizeFilter(Roles = "Court")]
    [Area("Court")]
    public class BaseController : Controller
    {
    }
}
