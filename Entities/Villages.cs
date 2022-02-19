using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class Villages
    {
        [Key]
        public int VillageId { get; set; }
        public string VillageName { get; set; }
        public int TalukaId { get; set; }
        public int DistrictID { get; set; }
    }
}
