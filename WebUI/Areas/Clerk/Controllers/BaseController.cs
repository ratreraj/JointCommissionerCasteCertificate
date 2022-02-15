using Microsoft.AspNetCore.Mvc;
using WebUI.Helpers;

namespace WebUI.Areas.Clerk.Controllers
{
    [CustomAuthorizeFilter(Roles = "Clerk")]
    [Area("Clerk")]
    public class BaseController : Controller
    {
        
       
    }
}
