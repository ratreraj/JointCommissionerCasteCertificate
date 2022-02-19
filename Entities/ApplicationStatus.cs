using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class ApplicationStatus
    {
        public int ApplicationId { get; set; }
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int EntityTranstionId { get; set; }
        [Column(TypeName = "Varchar(20)")]
        public string Status { get; set; }
        public int EntryBy { get; set; }
        [Column(TypeName = "DateTime")]
        public DateTime EntryDate { get; set; }
    }
}
