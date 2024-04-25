using CoreMVCApp.Entities;

namespace CoreMVCApp.Models
{

    public class RegistrationViewModel
    {
        public int? EmployeeId { get; set; }
        public int? TabId { get; set; }
        public EmployeeModel? EmployeeModel { get; set; }

        public DependentsModel? DependentsModel { get; set; }

    }
}
