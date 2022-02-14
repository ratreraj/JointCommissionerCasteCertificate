using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Text;

namespace Entities
{
    public class Role : IdentityRole<int>
    {

        public string Description { get; set; }
        // TO DO:
    }
}
