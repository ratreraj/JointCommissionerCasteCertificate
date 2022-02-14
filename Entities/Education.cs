﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entities
{
    public class Education
    {

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ApplicationId { get; set; }
        [Column(TypeName = "DateTime")]
        public DateTime ApplicationRecivedDate { get; set; }
        [Column(TypeName = "Varchar(100)")]
        public string ApplicationName { get; set; }
        [Column(TypeName = "Varchar(25)")]
        public string CaseId { get; set; }
        [Column(TypeName = "Varchar(100)")]
        public string Village { get; set; }
        [Column(TypeName = "Varchar(100)")]
        public string Taluka { get; set; }
        [Column(TypeName = "Varchar(100)")]
        public string District { get; set; }
        [Column(TypeName = "DateTime")]
        public DateTime CasteCertificateDate { get; set; }
        [Column(TypeName = "Varchar(25)")]
        public string CasteCertificateNumber { get; set; }
        [Column(TypeName = "Varchar(100)")]
        public string CasteCertificateIssuingAuthority { get; set; }
        [Column(TypeName = "Varchar(100)")]
        public string EducationType { get; set; }
    }
}