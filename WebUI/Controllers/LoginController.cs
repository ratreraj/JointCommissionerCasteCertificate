using Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Services.Interfaces;
using System.Linq;
using WebUI.Models;
using WebUI.Helpers;
using System.Threading.Tasks;

namespace WebUI.Controllers
{
    public class LoginController : Controller
    {
        private readonly IAuthenticationService _authenticationService;
        private readonly IAppSetting _appSetting;
        public LoginController(IAuthenticationService authenticationService, IAppSetting appSetting)
        {
            _authenticationService = authenticationService;
            _appSetting = appSetting;
        }
        public IActionResult SignIn()
        {
            return View();
        }
        [HttpPost]
        public IActionResult SignIn(LoginModel model)
        {
            if (ModelState.IsValid)
            {

                User user = _authenticationService.AuthenticateUser(model.UserName, model.Password);
                if (user!=null)
                {
                    DashboardSetting dashboard = _appSetting.GetDashboardSetting(user.Roles[0]);

                    HttpContext.Session.SetComplexData("users", user);
                    HttpContext.Session.SetComplexData("dasbaodsetting", dashboard);

                    if (user.Roles.Contains(user.Roles[0]))
                    {
                        return RedirectToAction("Index", "Dashboard", new { area = user.Roles[0] });
                    }
                  

                }

            }

            return View();
        }


        public async Task<IActionResult> LogOut()
        {
            await _authenticationService.SignOut();
            return RedirectToAction("LogOutComplete");
        }

        public IActionResult LogOutComplete()
        {
            return View();
        }

        public IActionResult Unauthorize()
        {
            return View();
        }

    }
}
