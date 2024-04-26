using CoreMVCDataAnnotationApp.Entities;
using Microsoft.AspNetCore.Mvc.ModelBinding.Binders;
using System.ComponentModel.DataAnnotations;

namespace CoreMVCDataAnnotationApp.Models
{
    public class EmployeeViewModel
    {
        [Key]
        public int? EmployeeId { get; set; }

        [Required]
        public string FirstName { get; set; }

        [Required]
        public string? LastName { get; set; }
        [Required]

        public string? Gender { get; set; }

        public List<CheckboxViewModel> Ethnicity { get; set; }

        public string? Email { get; set; }

        public string? PhoneNumber { get; set; }
        public DateTime? HireDate { get; set; }
        public int? JobId { get; set; }
        public decimal? Salary { get; set; }
        public int? ManagerId { get; set; }
        public int? DepartmentId { get; set; }

        public EmployeeViewModel()
        {

        }

        public EmployeeViewModel(EmployeeModel employeeModel)
        {
            this.EmployeeId = employeeModel.EmployeeId;
            this.FirstName = employeeModel.FirstName;
            this.LastName = employeeModel.LastName;
            this.Email = employeeModel.Email;
            this.PhoneNumber = employeeModel.PhoneNumber;
            this.HireDate = employeeModel.HireDate;
            this.JobId = employeeModel.JobId;
            this.Salary = employeeModel.Salary;
            this.ManagerId = employeeModel.ManagerId;
            this.DepartmentId = employeeModel.DepartmentId;
        }
    }
}
