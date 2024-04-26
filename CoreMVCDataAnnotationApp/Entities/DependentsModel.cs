using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Diagnostics.CodeAnalysis;

namespace CoreMVCDataAnnotationApp.Entities
{
    [Table("dependents")]
    public class DependentsModel
    {
        [Key]
        [Column("dependent_id")]
        [AllowNull]
        public int? DependentId { get; set; }

        [Column("first_name")]
        [AllowNull]
        public string? FirstName { get; set; }

        [Column("last_name")]
        [AllowNull]
        public string? LastName { get; set; }

        [Column("relationship")]
        [AllowNull]
        public string? Relationship { get; set; }

        [Column("employee_id")]
        [AllowNull]
        public int? EmployeeId { get; set; }

        public EmployeeModel? Employee { get; set; }

    }
}
