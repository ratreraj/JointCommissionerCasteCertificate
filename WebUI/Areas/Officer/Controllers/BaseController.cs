using Microsoft.AspNetCore.Mvc;
using WebUI.Helpers;

namespace WebUI.Areas.Officer.Controllers
{
    [CustomAuthorizeFilter(Roles = "Officer")]
    [Area("Officer")]
    public class BaseController : Controller
    {
    }
}
