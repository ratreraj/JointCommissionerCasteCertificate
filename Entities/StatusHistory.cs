using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class StatusHistory
    {
        public string ApplicationId { get; set; }
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int EntityTranstionId { get; set; }

        public int EntityTranstionIdFk { get; set; }

        [Column(TypeName = "Varchar(20)")]
        public string CurrentStatus { get; set; }

        [Column(TypeName = "DateTime")]
        public DateTime CurrentDate { get; set; }

        [Column(TypeName = "Varchar(20)")]
        public string PerviousStatus { get; set; }

        [Column(TypeName = "DateTime")]
        public DateTime PerviousDate { get; set; }

        [Column(TypeName = "Varchar(500)")]
        public string Remark { get; set; }
        public int EntryBy { get; set; }
        [Column(TypeName = "DateTime")]
        public DateTime EntryDate { get; set; }
    }
}
