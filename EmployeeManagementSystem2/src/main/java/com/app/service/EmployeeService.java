package com.app.service;

import java.util.List;

import com.app.pojos.Employee;

public interface EmployeeService {
	String addEmployeeDetails(Employee employee);

	List<Employee> getAllEmployeesDetails();

	List<Employee> displayEmpnoAndNameByCompanyName(String company);
	Employee getEmployeeById(Integer empno);

	void deleteEmployee(Integer empno);

	void updateEmployee(Integer empno, Employee updatedEmployee);
}
