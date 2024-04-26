using CoreMVCDataAnnotationApp.Entities;

namespace CoreMVCDataAnnotationApp.Models
{
    public class DependentsViewModel
    {
        public int? EmployeeId { get; set; }
        public DependentsModel DependentsModel { get; set; }
        public List<DependentsModel> DependentsModels { get; set; }
    }
}
