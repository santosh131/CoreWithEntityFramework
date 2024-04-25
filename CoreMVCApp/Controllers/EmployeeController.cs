using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using CoreMVCApp.Infrastructure;
using CoreMVCApp.Models;
using CoreMVCApp.Entities;

namespace CoreMVCApp.Controllers
{
    public class EmployeeController : Controller
    {
        private readonly EmployeeContext _context;

        public EmployeeController(EmployeeContext context)
        {
            _context = context;
        }

        // GET: Employee
        public async Task<IActionResult> Index()
        {
            var emps = await _context.EmployeeModels.ToListAsync();
            var empViewModels= emps.Select(emp =>
                    new EmployeeViewModel(emp)
                ).ToList();
            return View(empViewModels);
        }

        // GET: Employee/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var empModel = await _context.EmployeeModels
                .FirstOrDefaultAsync(m => m.EmployeeId == id);
            if (empModel == null)
            {
                return NotFound();
            }
            ViewBag.Departments = _context.DepartmentsModels.ToList();
            var empViewModel = new EmployeeViewModel(empModel);
            return View(empViewModel);
        }

        // GET: Employee/Create
        public IActionResult Create()
        {
            ViewBag.Departments = _context.DepartmentsModels.ToList();
            
            var empViewModel = new EmployeeViewModel();
            empViewModel.Ethnicity = new List<CheckboxViewModel>() {
                new CheckboxViewModel() { Id="1", LabelName="Asian", IsChecked=false } ,
                new CheckboxViewModel() { Id="2", LabelName="American", IsChecked=false } ,
                new CheckboxViewModel() { Id="3", LabelName="African-American", IsChecked=false } ,
                new CheckboxViewModel() { Id="4", LabelName="Latino or Hispanic", IsChecked=false } ,
            };
            return View(empViewModel);
        }

        // POST: Employee/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("EmployeeId,FirstName,LastName,Gender,Ethnicity,Email,PhoneNumber,HireDate,JobId,Salary,ManagerId,DepartmentId")] EmployeeViewModel employeeViewModel)
        {
            if (ModelState.IsValid)
            {
                var empModel = new EmployeeModel(employeeViewModel);
                _context.Add(empModel);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(employeeViewModel);
        }

        // GET: Employee/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var employeeModel = await _context.EmployeeModels.FindAsync(id);
            if (employeeModel == null)
            {
                return NotFound();
            }
            ViewBag.Departments = _context.DepartmentsModels.ToList();
            var empViewModel = new EmployeeViewModel(employeeModel);
            return View(empViewModel);
        }

        // POST: Employee/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("EmployeeId,FirstName,LastName,Email,PhoneNumber,HireDate,JobId,Salary,ManagerId,DepartmentId")] EmployeeViewModel employeeViewModel)
        {
            if (id != employeeViewModel.EmployeeId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                var empModel = new EmployeeModel(employeeViewModel);
                try
                {

                    _context.Update(empModel);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!EmployeeViewModelExists(empModel.EmployeeId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(employeeViewModel);
        }

        // GET: Employee/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.EmployeeModels == null)
            {
                return NotFound();
            }

            var employeeModel = await _context.EmployeeModels
                .FirstOrDefaultAsync(m => m.EmployeeId == id);
            if (employeeModel == null)
            {
                return NotFound();
            }

            return View(employeeModel);
        }

        // POST: Employee/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.EmployeeModels == null)
            {
                return Problem("Entity set 'EmployeeContext.EmployeeModels'  is null.");
            }
            var employeeModel = await _context.EmployeeModels.FindAsync(id);
            if (employeeModel != null)
            {
                _context.EmployeeModels.Remove(employeeModel);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool EmployeeViewModelExists(int? id)
        {
            return (_context.EmployeeModels?.Any(e => e.EmployeeId == id.Value)).GetValueOrDefault();
        }

        [HttpGet("LocationIndex")]
        public async Task<IActionResult> LocationIndex()
        {
            var locations = await _context
                .LocationsModels
                .ToListAsync();     
            var l= locations.ElementAt(0);
            if (l.Departments != null)
            {
                foreach (var item in l.Departments.ToList())
                {
                    Console.WriteLine(item);
                }
            }
            return View(locations);
        }

        [HttpGet("EmployeeEagerIndex")]
        public async Task<IActionResult> EmployeeEagerIndex()
        {
            var employees = await _context
                .EmployeeModels
                .Include(l=>l.Dependents)
                .ToListAsync();
            
            return View(employees);
        }
    }
}
