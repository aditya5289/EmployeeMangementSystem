package com.app.dao;

import java.util.List;

import com.app.pojos.Employee;

public interface EmployeeDao {
	
	
	String addEmployeeDetails(Employee employee);
	
	List<Employee> getAllEmployeesDetails();
	
	List<Employee> displayEmpnoAndNameByCompanyName(String company);

	void deleteEmployee(Integer empno);

	Employee getEmployeeById(Integer empno);
	void updateEmployee(Integer empno, Employee updatedEmployee);

}
