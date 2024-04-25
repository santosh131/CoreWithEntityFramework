using Microsoft.EntityFrameworkCore;

namespace EntityFrameworkFluentApi.Models
{
    public class EmployeeContext : DbContext
    {
        public EmployeeContext()
        {
            
        }
        public EmployeeContext(DbContextOptions options) : base(options)
        {

        }

        public DbSet<Employee> Employees { get; set; } 
        public DbSet<Dependents> Dependents { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Employee>(entity =>
            {
                entity.HasKey(e => e.EmployeeId);
                entity.Property(e => e.EmployeeId).HasColumnName("employee_id");
                entity.Property(e => e.FirstName).HasColumnName("first_name");
                entity.Property(e => e.LastName).HasColumnName("last_name");
                entity.Property(e => e.Email).HasColumnName("email");
                entity.Property(e => e.PhoneNumber).HasColumnName("phone_number");
                entity.Property(e => e.HireDate).HasColumnName("hire_date");
                entity.Property(e => e.JobId).HasColumnName("job_id");
                entity.Property(e => e.Salary).HasColumnName("salary");
                entity.Property(e => e.ManagerId).HasColumnName("manager_id");
                entity.Property(e => e.DepartmentId).HasColumnName("department_id");
                entity.HasOne(e => e.Address)
                .WithOne(e => e.Employee)
                .HasForeignKey<Address>(e => e.EmployeeId)
                .IsRequired(false);
            });

            modelBuilder.Entity<Dependents>(entity =>
            {
                entity.HasKey(e => e.DependentId);
                entity.Property(e => e.DependentId).HasColumnName("dependent_id");
                entity.Property(e => e.LastName).HasColumnName("last_name");
                entity.Property(e => e.FirstName).HasColumnName("first_name");
                entity.Property(e => e.Relationship).HasColumnName("relationship");
                entity.Property(e => e.EmployeeId).HasColumnName("employee_id");
                entity.HasOne(p => p.Employee)
                .WithMany(p => p.Dependents)
                .HasForeignKey(p => p.EmployeeId);
            });

            modelBuilder.Entity<Address>(entity =>
            {
                entity.HasKey(e => e.AddressId);
                entity.Property(e => e.AddressId).HasColumnName("address_id");
                entity.Property(e=>e.Address1).HasColumnName("address1");
                entity.Property(e=>e.Address2).HasColumnName("address2");
                entity.Property(e => e.City).HasColumnName("city");
                entity.Property(e => e.StateProvince).HasColumnName("state_province");
                entity.Property(e => e.Country).HasColumnName("country");
                entity.Property(e => e.Phone).HasColumnName("phone");
                entity.Property(e => e.PostalCode).HasColumnName("postal_code");
                entity.Property(e => e.CountryCode).HasColumnName("country_code");
                entity.Property(e => e.Fax).HasColumnName("fax");
                entity.Property(e => e.EmployeeId).HasColumnName("employee_id");
                //entity.HasOne(e=>e.Employee)
                //.WithOne(e=>e.Address)
                //.HasForeignKey<Employee>(e => e.EmployeeId);
            });

            base.OnModelCreating(modelBuilder);
        }

    }
}
