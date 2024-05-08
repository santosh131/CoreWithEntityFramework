namespace EntityFrameworkFluentApi.Models
{
    public class EmployeeTraining
    {
        public int Id { get; set; }
        public int EmployeeId { get; set; }

        public Employee Employee { get; set; }
        public int TrainingId { get; set; }

        public Training Training { get; set; }

    }
}
