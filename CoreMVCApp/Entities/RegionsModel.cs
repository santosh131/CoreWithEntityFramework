using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CoreMVCApp.Entities
{
    [Table("regions")]
    public class RegionsModel
    {
        [Key]
        public int RegionId { get; set; }
        public string RegionName { get; set; }
    }
}
