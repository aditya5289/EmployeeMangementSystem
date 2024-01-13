package com.app.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.hibernate.validator.internal.util.logging.*;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.app.pojos.Employee;

@Repository
@Transactional
public class EmployeeDaoImpl implements EmployeeDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public String addEmployeeDetails(Employee employee) {
        entityManager.persist(employee);
        return "Details added successfully";
    }

    @Override
    public List<Employee> getAllEmployeesDetails() {
        String jpql = "select e from Employee e";
        return entityManager.createQuery(jpql, Employee.class).getResultList();
    }

    @Override
    public List<Employee> displayEmpnoAndNameByCompanyName(String company) {
        String jpql = "select e from Employee e where e.companyName = :company";
        return entityManager.createQuery(jpql, Employee.class)
                .setParameter("company", company)
                .getResultList();
    }

    @Override
    public void deleteEmployee(Integer empno) {
        Employee employee = entityManager.find(Employee.class, empno);
        if (employee != null) {
            entityManager.remove(employee);
        }
    }

    @Override
    public Employee getEmployeeById(Integer empno) {
        return entityManager.find(Employee.class, empno);
    }

 
    @Override
    @Transactional
    public void updateEmployee(Integer empno, Employee updatedEmployee) {
        // Ensure that the updatedEmployee has a valid id
        System.out.println("updatedEmployee : " + updatedEmployee);

        if (empno != null) {
            // Fetch the existing entity from the database
            Employee existingEmployee = entityManager.find(Employee.class, empno);

            // Check if the entity exists
            if (existingEmployee != null) {
                // Update the fields of the existing employee with the new values
                existingEmployee.setFirstName(updatedEmployee.getFirstName());
                existingEmployee.setLastName(updatedEmployee.getLastName());
                existingEmployee.setCity(updatedEmployee.getCity());
                existingEmployee.setCompanyName(updatedEmployee.getCompanyName());

                System.out.println("Updating employee: " + existingEmployee);

                // Merge the updated employee back into the persistence context
                entityManager.merge(existingEmployee);

                System.out.println("Employee updated successfully");
            } else {
                System.out.println("Employee with ID " + empno + " not found");
            }
        } else {
            System.out.println("Invalid employee ID provided for update");
        }
    }




}
