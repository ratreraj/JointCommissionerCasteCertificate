using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class DDLMaster
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public string ValueFields { get; set; }
        public string DisplayFields { get; set; }
        public string Categroy { get; set; }
        public int EntryBy { get; set; }
        [Column(TypeName = "DateTime")]
        public DateTime EntryDate { get; set; }
    }
}
