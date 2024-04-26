using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CoreMVCDataAnnotationApp.Entities
{
    [Table("departments")]
    public class DepartmentsModel
    {
        [Key]
        [Column("department_id")]
        public int DepartmentId { get; set; }

        [Column("department_name")]
        public string? DepartmentName { get; set; }

        [Column("location_id")]
        public int? LocationId { get; set; }

        public virtual LocationsModel? Location { get; set; } //lazy loading : mark the property virtual
    }
}
