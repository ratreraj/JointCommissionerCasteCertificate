using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class DashboardSetting
    {

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }
        [Column(TypeName = "Varchar(20)")]
        public string Status { get; set; }
        public int RoleID { get; set; }
        [Column(TypeName = "Varchar(50)")]
        public string RoleName { get; set; }


    }
}
