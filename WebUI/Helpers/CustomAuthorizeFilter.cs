﻿using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebUI.Helpers
{
    public class CustomAuthorizeFilter : Attribute, IAuthorizationFilter
    {
        public string Roles { get; set; }
        public void OnAuthorization(AuthorizationFilterContext context)
        {

            //if (context.Result!=null)
            //{
                if (context.HttpContext.User.Identity.IsAuthenticated)
                {
                    if (!context.HttpContext.User.IsInRole(Roles))
                    {
                        context.Result = new RedirectToActionResult("UnAuthorize", "Login", new { area = "" });
                    }
                }
                else
                {
                    context.Result = new RedirectToActionResult("SignIn", "Login", new { area = "" });
                }
            //}
            //else
            //{
            //    context.Result = new RedirectToActionResult("SignIn", "Login", new { area = "" });
            //}
            
        }
    }
}
