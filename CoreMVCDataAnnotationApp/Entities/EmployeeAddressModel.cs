
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Diagnostics.CodeAnalysis;

namespace CoreMVCDataAnnotationApp.Entities
{
    [Table("employee_address")]
    public class EmployeeAddressModel
    {
        [Key]
        [Column("address_id")]
        public int AddressId { get; set; }
        public string Address1 { get; set; } = string.Empty;
        public string Address2 { get; set; } = string.Empty;
        public string City { get; set; } = string.Empty;
        public string StateProvince { get; set; } = string.Empty;
        public string Country { get; set; } = string.Empty;
        public string Phone { get; set; } = string.Empty;
        public string PostalCode { get; set; } = string.Empty;
        public string CountryCode { get; set; } = string.Empty;
        public string Fax { get; set; } = string.Empty;
        public int? EmployeeId { get; set; }

        public EmployeeModel? Employee { get; set; }
    }
}
