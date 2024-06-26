﻿using CoreMVCDataAnnotationApp.Entities;
using Microsoft.EntityFrameworkCore;
using CoreMVCDataAnnotationApp.Models;

namespace CoreMVCDataAnnotationApp.Infrastructure
{
    public class EmployeeContext : DbContext
    {
        public EmployeeContext(DbContextOptions options) : base(options)
        {
        }

        public DbSet<EmployeeModel> EmployeeModels { get; set; }

        public DbSet<DependentsModel> DependentsModel { get; set; }

        public DbSet<DepartmentsModel> DepartmentsModels { get; set;}
        public DbSet<LocationsModel> LocationsModels { get; set; }

    }
}
