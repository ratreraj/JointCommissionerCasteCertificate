﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class Districts
    {
        [Key]
        public int DistrictID { get; set; }
        public string DistictName { get; set; }

    }
}
