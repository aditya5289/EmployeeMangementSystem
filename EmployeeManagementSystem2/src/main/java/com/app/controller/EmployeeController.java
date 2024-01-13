package com.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.app.pojos.Employee;
import com.app.service.EmployeeService;

@Controller
@RequestMapping("/employee")
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @GetMapping("/add")
    public String addEmployeeForm(Employee employee) {
        return "/employee/add_employee_form";
    }

    @PostMapping("/add")
    public String addEmployee(RedirectAttributes redirectAttributes, Employee transietEmployee) {
        try {
            employeeService.addEmployeeDetails(transietEmployee);
            redirectAttributes.addFlashAttribute("successMessage", "Employee added successfully");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Failed to add employee");
            e.printStackTrace();
        }
        return "redirect:/employee/index2";
    }

    @GetMapping("/delete")
    public String deleteEmployeeForm() {
        return "/employee/delete_employee_form";
    }

    @PostMapping("/delete")
    public String deleteEmployee(@RequestParam Integer empno, RedirectAttributes redirectAttributes) {
        try {
            employeeService.deleteEmployee(empno);
            redirectAttributes.addFlashAttribute("successMessage", "Employee deleted successfully");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Failed to delete employee");
            e.printStackTrace();
        }

        return "redirect:/employee/index2";
    }
    @PostMapping("/updateEmployee")
    public String updateEmployee(@RequestParam(name = "empno") Integer empno,
                                 @ModelAttribute Employee updatedEmployee,
                                 RedirectAttributes redirectAttributes) {
        try {
            employeeService.updateEmployee(empno, updatedEmployee);
            redirectAttributes.addFlashAttribute("successMessage", "Employee updated successfully");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Failed to update employee");
            e.printStackTrace();
        }

        return "redirect:/employee/index2";
    }

    @GetMapping("/update")
    public String updateEmployeeForm(@RequestParam(name = "empno", required = false) Integer empno, Model model) {
        if (empno != null) {
            // Use the getEmployeeById method to retrieve the employee
            Employee employee = employeeService.getEmployeeById(empno);

            // Check if the employee exists
            if (employee != null) {
                System.out.println("Employee Found" + employee);
                model.addAttribute("employee", employee);
                return "/employee/update_employee_form";
            } else {
                // Handle the case when employee with the provided empno is not found
                model.addAttribute("errorMessage", "Employee with ID " + empno + " not found");
                return "errorPage";  // Adjust to your error page
            }
        } else {
            // Handle the case when "empno" is not present
            // You can redirect to an error page or return an error message
            return "redirect:/employee/index2";
        }
    }

   
    
    @GetMapping("/index2")
    public String indexPage() {
        return "/employee/index2";
    }

    @GetMapping("/successPage")
    public String successPage() {
        return "/employee/successPage";
    }

    @GetMapping("/all")
    public String showAllEmployees(Model map) {
        map.addAttribute("employee_details", employeeService.getAllEmployeesDetails());
        return "/employee/list";
    }

    @GetMapping("/company")
    public String employeesByCompany() {
        return "/employee/company_name_form";
    }

    @PostMapping("/company")
    public String getEmployeesByCompany(@RequestParam String companyName, Model map) {
        map.addAttribute("employee_details", employeeService.displayEmpnoAndNameByCompanyName(companyName));
        return "/employee/list";
    }
}
