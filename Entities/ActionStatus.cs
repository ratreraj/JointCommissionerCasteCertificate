using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class ActionStatus
    {

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }

        [Column(TypeName = "Varchar(20)")]
        public string CurrentStatus { get; set; }

        [Column(TypeName = "Varchar(20)")]
        public string NextStatus { get; set; }

        [Column(TypeName = "Varchar(200)")]
        public string Description { get; set; }

        [Column(TypeName = "Varchar(20)")]
        public string Direction { get; set; }
        public int RoleId { get; set; }
        public int NextRoleId { get; set; }
    }
}
