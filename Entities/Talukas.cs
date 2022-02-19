using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class Talukas
    {
        [Key]
        public int TalukaId { get; set; }
        public string TalukaName { get; set; }
        public int DistrictID { get; set; }
    }
}
