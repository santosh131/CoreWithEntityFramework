using CoreMVCApp.Models;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Diagnostics.CodeAnalysis;

namespace CoreMVCApp.Entities
{
    [Table("employees")]
    public class EmployeeModel
    {
        [Key]
        [Column("employee_id")]
        [AllowNull]
        public int? EmployeeId { get; set; }

        [Column("first_name")]
      
        [Required(AllowEmptyStrings = false, ErrorMessage ="Pelase"), DisplayName]
        [Display()]
        public string FirstName { get; set; }

        [Column("last_name")]
        [AllowNull]
        public string? LastName { get; set; }

        [Column("email")]
        [AllowNull]
        public string? Email { get; set; }

        [Column("phone_number")]
        [AllowNull]
        public string? PhoneNumber { get; set; }

        [Column("hire_date")]
        [AllowNull]
        public DateTime? HireDate { get; set; }

        [Column("job_id")]
        [AllowNull]
        public int? JobId { get; set; }

        [Column("salary")]
        [AllowNull]
        public decimal? Salary { get; set; }

        [Column("manager_id")]
        [AllowNull]
        public int? ManagerId { get; set; }

        [Column("department_id")]
        [AllowNull]
        public int? DepartmentId { get; set; }

        public List<DependentsModel>? Dependents { get; set; }

        public EmployeeModel()
        {
            
        }

        public EmployeeModel(EmployeeViewModel employeeViewModel)
        {
            this.EmployeeId = employeeViewModel.EmployeeId;
            this.FirstName = employeeViewModel.FirstName;
            this.LastName = employeeViewModel.LastName;
            this.Email = employeeViewModel.Email;
            this.PhoneNumber = employeeViewModel.PhoneNumber;
            this.HireDate = employeeViewModel.HireDate;
            this.JobId = employeeViewModel.JobId;
            this.Salary = employeeViewModel.Salary;
            this.ManagerId = employeeViewModel.ManagerId;
            this.DepartmentId = employeeViewModel.DepartmentId;
        }
    }
}
