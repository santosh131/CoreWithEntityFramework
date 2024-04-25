using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CoreMVCApp.Entities
{
    [Table("locations")]
    public class LocationsModel
    {
        [Key]
        [Column("location_id")]
        public int LocationId { get; set; }

        [Column("street_address")]
        public string? StreetAddress { get; set; }

        [Column("postal_code")]
        public string? PostalCode { get; set; }

        [Column("city")]
        public string? City { get; set; }

        [Column("state_province")]
        public string? StateProvince { get; set; }

        [Column("country_id")]
        public string? CountryId { get; set; }

        public virtual ICollection<DepartmentsModel>? Departments { get; set; } //Lazy loading: mark the property virtual
    }
}
