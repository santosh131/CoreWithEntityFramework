namespace EntityFrameworkFluentApi.Models
{
    public class Training
    {
        public int TrainingId { get; set; }

        public string TrainingName { get; set; } =string.Empty;

        public List<EmployeeTraining> EmployeeTrainings { get; set; } = new List<EmployeeTraining>();

        public List<Employee> Employees { get; set; } = new List<Employee>();
    }
}
