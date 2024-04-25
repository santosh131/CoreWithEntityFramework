using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;
using System.Diagnostics.CodeAnalysis;

namespace EntityFrameworkFluentApi.Models
{
    public class Employee
    {
        public int? EmployeeId { get; set; }

        public string FirstName { get; set; }

        public string? LastName { get; set; }

        public string? Email { get; set; }

        public string? PhoneNumber { get; set; }

        public DateTime? HireDate { get; set; }

        public int? JobId { get; set; }

        public decimal? Salary { get; set; }

        public int? ManagerId { get; set; }

        public int? DepartmentId { get; set; }

        public List<Dependents>? Dependents { get; set; }

        public Address? Address { get; set; }
    }
}
