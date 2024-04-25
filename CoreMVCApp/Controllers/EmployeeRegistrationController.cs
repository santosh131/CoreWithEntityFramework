using CoreMVCApp.Entities;
using CoreMVCApp.Infrastructure;
using CoreMVCApp.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CoreMVCApp.Controllers
{
    public class EmployeeRegistrationController : Controller
    {
        private readonly EmployeeContext _employeeContext;
        public EmployeeRegistrationController(EmployeeContext employeeContext)
        {
            _employeeContext = employeeContext;
        }

        [HttpGet]
        public IActionResult Index(int? employeeId, int tabId)
        {
            RegistrationViewModel viewModel = new RegistrationViewModel
            {
                EmployeeId = employeeId,
                TabId = tabId
            };
            return View(viewModel);
        }

        [HttpGet]
        public async Task<IActionResult> Employee([FromQuery] int? employeeId)
        {
            EmployeeModel model = new EmployeeModel
            {
                EmployeeId = employeeId
            };
            if (employeeId != null && employeeId > 0)
            {
                List<EmployeeModel> models = await _employeeContext.EmployeeModels.Where(e => e.EmployeeId.Equals(employeeId)).ToListAsync();
                if (models.Any())
                {
                    model = models[0];
                }
            }

            return PartialView(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Employee([Bind("EmployeeId,FirstName,LastName,Email,PhoneNumber,HireDate,JobId,Salary,ManagerId,DepartmentId")] EmployeeModel employeeModel)
        {
            //return RedirectToAction(nameof(Index), new { employeeId = employeeModel.EmployeeId, tabId = 2 });
            if (!ModelState.IsValid)
            {
                ViewBag.IsError = true;
                return PartialView(employeeModel);
            }

            //    _employeeContext.Add(employeeModel);
            //    await _employeeContext.SaveChangesAsync();

            return RedirectToAction(nameof(Dependents), new { employeeId = employeeModel.EmployeeId });

        }

        [HttpGet]
        public async Task<IActionResult> Dependents([FromQuery] int? employeeId)
        {
            DependentsViewModel dependentsViewModel = new DependentsViewModel();

            List<DependentsModel> models = new List<DependentsModel>();
            
            if (employeeId != null && employeeId > 0)
            {
                models = await _employeeContext.DependentsModel.Where(e => e.EmployeeId.Equals(employeeId)).ToListAsync();
            }
            dependentsViewModel.DependentsModels= models;
            dependentsViewModel.EmployeeId= employeeId;
            dependentsViewModel.DependentsModel = new DependentsModel();
            return PartialView(dependentsViewModel);
        }

        [HttpGet]
        public async Task<IActionResult> CreateDependents([FromQuery] int? employeeId)
        {
            DependentsModel dependentsModel = new DependentsModel
            {
                EmployeeId = employeeId
            };

            return PartialView(dependentsModel);
        }

        [HttpPost]
        public async Task<IActionResult> CreateDependents(DependentsModel dependentsModel)
        {
            if(!ModelState.IsValid)
            {
                ViewBag.IsError = true;
                return PartialView(dependentsModel);
            }
            //_employeeContext.Add(dependentsModel);
            //await _employeeContext.SaveChangesAsync();
            return RedirectToAction(nameof(Dependents), new {employeeId =dependentsModel.EmployeeId});
        }

    }
}
