using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Services.Interfaces
{
    public interface IAuthenticationService
    {
        bool CreateUser(User user, string Password,string role);
        Task<bool> SignOut();
        User AuthenticateUser(string UserName, string Password);
        User GetUser(string UersName);
    }
}
