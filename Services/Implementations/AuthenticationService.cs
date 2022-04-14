using Entities;
using Microsoft.AspNetCore.Identity;
using Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Services.Implementations
{
    public class AuthenticationService : IAuthenticationService
    {
        protected SignInManager<User> _signInManager;
        protected UserManager<User> _userManager;
        protected RoleManager<Role> _roleManager;


        public AuthenticationService(SignInManager<User> signInManager, UserManager<User> userManager, RoleManager<Role> roleManager)
        {
            _signInManager = signInManager;
            _userManager = userManager;
            _roleManager = roleManager;
        }
        public User AuthenticateUser(string UserName, string Password)
        {
            //lockoutOnFailure - deafault value 5 
            //isPersistent = for remember me 
            var result = _signInManager.PasswordSignInAsync(UserName, Password, false, lockoutOnFailure: false).Result;
            if (result.Succeeded)
            {
                var user = _userManager.FindByNameAsync(UserName).Result;
                var role = _userManager.GetRolesAsync(user).Result;
                user.Roles = role.ToArray();

                return user;
            }
            return null;

        }

        public bool CreateUser(User user, string Password, string role)
        {
            var result = _userManager.CreateAsync(user, Password).Result;
            if (result.Succeeded)
            {
                // string role = "Admin";
                var res = _userManager.AddToRoleAsync(user, role).Result;
                if (res.Succeeded)
                {
                    return true;
                }
                else
                {
                    return false;
                }

            }
            return false;
        }

        public User GetUser(string UersName)
        {
            throw new NotImplementedException();
        }

        public async Task<bool> SignOut()
        {
            try
            {
                await _signInManager.SignOutAsync();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}
