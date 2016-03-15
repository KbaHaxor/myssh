package io.accessun.service;

import java.util.List;

import io.accessun.dao.EmployeeDao;
import io.accessun.entity.Employee;

public class EmployeeService {
    private EmployeeDao employeeDao;
    
    public void setEmployeeDao(EmployeeDao employeeDao) {
        this.employeeDao = employeeDao;
    }
    
    public List<Employee> getAll() {
        return employeeDao.getAll();
    }
    
    public void saveOrUpdate(Employee employee) {
        employeeDao.saveOrUpdate(employee);
    }
    
    public void delete(Integer id) {
        employeeDao.delete(id);
    }
    
    public Employee get(Integer id) {
        return employeeDao.get(id);
    }
    
    /**
     * If this function returns true, it means that the passed name is valid. Otherwise not.
     * 
     * @param lastName
     */
    public boolean lastNameIsValid(String lastName) {
        return employeeDao.getEmployeeByLastName(lastName) == null;
    }

}
