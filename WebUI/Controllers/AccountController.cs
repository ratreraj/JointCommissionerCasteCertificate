using Entities;
using Microsoft.AspNetCore.Mvc;
using Services.Interfaces;
using System.Linq;
using WebUI.Models;

namespace WebUI.Controllers
{
    public class AccountController : Controller
    {
        private readonly IAuthenticationService _authenticationService;
        public AccountController(IAuthenticationService authenticationService)
        {
            _authenticationService = authenticationService;
        }
        public IActionResult Login()
        {
            return View();
        }

        public IActionResult Login(LoginModel model)
        {
            if (!ModelState.IsValid)
            {

                User user = _authenticationService.AuthenticateUser(model.UserName, model.Password);
                if (user!=null)
                {

                    if (user.Roles.Contains("Admin"))
                    {
                        return RedirectToAction("Index", "Dashboard", new { area = "Admin" });
                    }
                    else if (user.Roles.Contains("User"))
                    {
                        return RedirectToAction("Index", "Dashboard", new { area = "User" });

                    }
                    else if (user.Roles.Contains("User"))
                    {
                        return RedirectToAction("Index", "Dashboard", new { area = "User" });

                    }
                    else if (user.Roles.Contains("User"))
                    {
                        return RedirectToAction("Index", "Dashboard", new { area = "User" });

                    }
                    
                }

            }

            return View();
        }

    }
}
