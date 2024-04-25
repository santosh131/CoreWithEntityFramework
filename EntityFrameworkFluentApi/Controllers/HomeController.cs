using EntityFrameworkFluentApi.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;

namespace EntityFrameworkFluentApi.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        EmployeeContext _employeeContext;
        public HomeController(ILogger<HomeController> logger, EmployeeContext employeeContext)
        {
            _logger = logger;
            _employeeContext = employeeContext;
        }

        public IActionResult Index()
        {
           var e= _employeeContext.Employees
                .Include(d=>d.Dependents)
                .Include(a=>a.Address)
                .ToList();
            
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}