using Entities;
using Microsoft.AspNetCore.Mvc;
using Services.Interfaces;
using WebUI.Areas.Admin.Models;

namespace WebUI.Areas.Admin.Controllers
{
    public class AccountController : BaseController
    {
        private readonly IAuthenticationService _authenticationService;
        public AccountController(IAuthenticationService authenticationService)
        {
            _authenticationService = authenticationService;
        }


        public IActionResult SignUp()
        {
            return View();
        }
        [HttpPost]
        public IActionResult SignUp(UserModel model)
        {
            ModelState.Remove("Id");
            if (ModelState.IsValid)
            {
                User user = new()
                {
                    Email = model.Email,
                    Name = model.Name,
                    UserName = model.UserName,
                    PhoneNumber = model.PhoneNumber
                };

                bool flag = _authenticationService.CreateUser(user, model.Password, "Clerk");
                if (flag)
                {
                    return RedirectToAction("Index", "Dashboard");
                }
            }
            return View();
        }



    }
}
