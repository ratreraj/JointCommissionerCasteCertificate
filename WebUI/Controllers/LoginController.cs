using Entities;
using Microsoft.AspNetCore.Mvc;
using Services.Interfaces;
using System.Linq;
using WebUI.Models;

namespace WebUI.Controllers
{
    public class LoginController : Controller
    {
        private readonly IAuthenticationService _authenticationService;
        public LoginController(IAuthenticationService authenticationService)
        {
            _authenticationService = authenticationService;
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

                    if (user.Roles.Contains("Admin"))
                    {
                        return RedirectToAction("Index", "Dashboard", new { area = "Admin" });
                    }
                    else if (user.Roles.Contains("Clerk"))
                    {
                        return RedirectToAction("Index", "Dashboard", new { area = "Clerk" });

                    }
                    //else if (user.Roles.Contains("User"))
                    //{
                    //    return RedirectToAction("Index", "Dashboard", new { area = "User" });

                    //}
                    //else if (user.Roles.Contains("User"))
                    //{
                    //    return RedirectToAction("Index", "Dashboard", new { area = "User" });

                    //}
                    
                }

            }

            return View();
        }

    }
}
