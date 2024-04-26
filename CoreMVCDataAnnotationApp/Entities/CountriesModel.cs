using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CoreMVCDataAnnotationApp.Entities
{
    [Table("countries")]
    public class CountriesModel
    {
        [Key]
        public string CountryId { get; set; }
        public string CountryName { get; set; }
        public int RegionId { get; set; }
    }
}
