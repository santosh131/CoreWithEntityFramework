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

        public DbSet<Employee> Employee { get; set; }

        public DbSet<Dependent> Dependent { get; set; }

        public DbSet<Training> Training { get; set; }

        public  DbSet<EmployeeTraining> EmployeeTraining { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            #region One to One
            //Parent to Child
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
                entity.Property(e => e.Salary).HasColumnName("salary").HasColumnType("decimal(6,2)");
                entity.Property(e => e.ManagerId).HasColumnName("manager_id");
                entity.Property(e => e.DepartmentId).HasColumnName("department_id");
                //One to One - Employee, Address
                entity.HasOne(e => e.Address)
                .WithOne(e => e.Employee)
                .HasForeignKey<Address>(e => e.EmployeeId)
                .IsRequired(false);

                //One to Many - Employee, Dependents
                entity.HasMany(e => e.Dependents)
                .WithOne(e => e.Employee)
                .HasForeignKey(e => e.EmployeeId);

                //Many to Many - Employee, Training, EmployeeTraining
                entity.HasMany(e => e.Trainings)
               .WithMany(e => e.Employees)
               .UsingEntity<EmployeeTraining>(
                       l => l.HasOne<Training>(e => e.Training).WithMany(e => e.EmployeeTrainings).HasForeignKey(e => e.EmployeeId),
                       r => r.HasOne<Employee>(e => e.Employee).WithMany(e => e.EmployeeTrainings).HasForeignKey(e => e.TrainingId)
                   );
            });

            //Child to Parent
            modelBuilder.Entity<Address>(entity =>
            {
                entity.HasKey(e => e.AddressId);
                entity.Property(e => e.AddressId).HasColumnName("address_id");
                entity.Property(e => e.Address1).HasColumnName("address1");
                entity.Property(e => e.Address2).HasColumnName("address2");
                entity.Property(e => e.City).HasColumnName("city");
                entity.Property(e => e.StateProvince).HasColumnName("state_province");
                entity.Property(e => e.Country).HasColumnName("country");
                entity.Property(e => e.Phone).HasColumnName("phone");
                entity.Property(e => e.PostalCode).HasColumnName("postal_code");
                entity.Property(e => e.CountryCode).HasColumnName("country_code");
                entity.Property(e => e.Fax).HasColumnName("fax");
                entity.Property(e => e.EmployeeId).HasColumnName("employee_id");
                //entity.HasOne(e=>e.Employee) //uncomment to configure child to parent 
                //.WithOne(e=>e.Address)
                //.HasForeignKey<Employee>(e => e.EmployeeId);
            });
            #endregion

            #region One to Many
            //Parent to Child
            //uncomment to configure one to many
            //modelBuilder.Entity<Employee>(entity =>
            //{
            //    entity.HasKey(entity => entity.EmployeeId);
            //    entity.Property(e => e.EmployeeId).HasColumnName("employee_id");
            //    entity.Property(e => e.FirstName).HasColumnName("first_name");
            //    entity.Property(e => e.LastName).HasColumnName("last_name");
            //    entity.Property(e => e.Email).HasColumnName("email");
            //    entity.Property(e => e.PhoneNumber).HasColumnName("phone_number");
            //    entity.Property(e => e.HireDate).HasColumnName("hire_date");
            //    entity.Property(e => e.JobId).HasColumnName("job_id");
            //    entity.Property(e => e.Salary).HasColumnName("salary").HasPrecision(5,2);
            //    entity.Property(e => e.ManagerId).HasColumnName("manager_id");
            //    entity.Property(e => e.DepartmentId).HasColumnName("department_id");
            //    entity.HasMany(e => e.Dependents)
            //    .WithOne(e => e.Employee)
            //    .HasForeignKey(e => e.EmployeeId);
            //});

            //Child to Parent
            modelBuilder.Entity<Dependent>(entity =>
            {
                entity.HasKey(e => e.DependentId);
                entity.Property(e => e.DependentId).HasColumnName("dependent_id");
                entity.Property(e => e.LastName).HasColumnName("last_name");
                entity.Property(e => e.FirstName).HasColumnName("first_name");
                entity.Property(e => e.Relationship).HasColumnName("relationship");
                entity.Property(e => e.EmployeeId).HasColumnName("employee_id");
                //entity.HasOne(p => p.Employee) //uncomment to configure child to parent 
                //.WithMany(p => p.Dependents)
                //.HasForeignKey(p => p.EmployeeId);
            });

            #endregion

            #region Many to Many
            //uncomment to configure many to many
            //modelBuilder.Entity<Employee>(entity =>
            //{
            //    entity.HasKey(e => e.EmployeeId);
            //    entity.Property(e => e.EmployeeId).HasColumnName("employee_id");
            //    entity.Property(e => e.FirstName).HasColumnName("first_name");
            //    entity.Property(e => e.LastName).HasColumnName("last_name");
            //    entity.Property(e => e.Email).HasColumnName("email");
            //    entity.Property(e => e.PhoneNumber).HasColumnName("phone_number");
            //    entity.Property(e => e.HireDate).HasColumnName("hire_date");
            //    entity.Property(e => e.JobId).HasColumnName("job_id");
            //    entity.Property(e => e.Salary).HasColumnName("salary");
            //    entity.Property(e => e.ManagerId).HasColumnName("manager_id");
            //    entity.Property(e => e.DepartmentId).HasColumnName("department_id");
            //    entity.HasOne(e => e.Address)
            //    .WithOne(e => e.Employee)
            //    .HasForeignKey<Address>(e => e.EmployeeId)
            //    .IsRequired(false);
            //    entity.HasMany(e => e.Trainings)
            //   .WithMany(e => e.Employees)
            //   .UsingEntity<EmployeeTraining>(
            //           l => l.HasOne<Training>(e => e.Training).WithMany(e => e.EmployeeTrainings).HasForeignKey(e => e.EmployeeId),
            //           r => r.HasOne<Employee>(e => e.Employee).WithMany(e => e.EmployeeTrainings).HasForeignKey(e => e.TrainingId)
            //       );
            //});

            modelBuilder.Entity<Training>(entity =>
            {
                entity.HasKey(e => e.TrainingId);
                entity.Property(e => e.TrainingId).HasColumnName("training_id");
                entity.Property(e => e.TrainingName).HasColumnName("training_name");
            });

            modelBuilder.Entity<EmployeeTraining>(entity =>
            {
                entity.HasKey(e => e.Id);
                entity.Property(e => e.TrainingId).HasColumnName("training_id");
                entity.Property(e => e.EmployeeId).HasColumnName("employee_id");
            });
            #endregion

            base.OnModelCreating(modelBuilder);
        }

    }
}
