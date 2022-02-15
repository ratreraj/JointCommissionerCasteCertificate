using Microsoft.AspNetCore.Mvc;
using WebUI.Helpers;

namespace WebUI.Areas.Dysp.Controllers
{
    [CustomAuthorizeFilter(Roles = "Dysp")]
    [Area("Dysp")]
    public class BaseController : Controller
    {
        
    }
}
