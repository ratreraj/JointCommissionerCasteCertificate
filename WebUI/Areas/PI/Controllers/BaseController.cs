using Microsoft.AspNetCore.Mvc;
using WebUI.Helpers;

namespace WebUI.Areas.PI.Controllers
{
    [CustomAuthorizeFilter(Roles = "PI")]
    [Area("PI")]
    public class BaseController : Controller
    {
    }
}
