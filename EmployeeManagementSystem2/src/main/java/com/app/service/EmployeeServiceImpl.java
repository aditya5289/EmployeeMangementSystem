package com.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.app.dao.EmployeeDao;
import com.app.pojos.Employee;

@Service
@Transactional
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private EmployeeDao employeeDao;

    @Override
    public String addEmployeeDetails(Employee employee) {
        employeeDao.addEmployeeDetails(employee);
        return "Employee added successfully";
    }

    @Override
    public List<Employee> getAllEmployeesDetails() {
        return employeeDao.getAllEmployeesDetails();
    }

    @Override
    public List<Employee> displayEmpnoAndNameByCompanyName(String company) {
        return employeeDao.displayEmpnoAndNameByCompanyName(company);
    }

    @Override
    public void updateEmployee(Integer empno,Employee updatedEmployee) {
        employeeDao.updateEmployee(empno, updatedEmployee);
    }

    @Override
    public Employee getEmployeeById(Integer empno) {
        return employeeDao.getEmployeeById(empno);
    }

    @Override
    public void deleteEmployee(Integer empno) {
        employeeDao.deleteEmployee(empno);
    }
}
