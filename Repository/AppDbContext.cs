﻿using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities;
using Microsoft.EntityFrameworkCore;

namespace Repository
{
    public class AppDbContext :IdentityDbContext<User,Role,int>
    {
        public AppDbContext()
        {

        }

        public AppDbContext(DbContextOptions<AppDbContext> dbContext) : base(dbContext)
        { 
        
        }

        public DbSet<Education> educations { get; set; }


        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer(@"data source=DESKTOP-GQQOR30; initial catalog=JointCommissionerCasteCertificate;persist security info=True;user id=sa;password=Sql@2019; MultipleActiveResultSets=True;");
            
            }

            base.OnConfiguring(optionsBuilder);
        }
    }
}