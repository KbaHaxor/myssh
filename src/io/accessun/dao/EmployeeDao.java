package io.accessun.dao;

import java.util.List;

import io.accessun.entity.Employee;

public class EmployeeDao extends BaseDao {

    @SuppressWarnings("unchecked")
    public List<Employee> getAll() {
        String hql = "FROM Employee e LEFT OUTER JOIN FETCH e.department";
        return getSession().createQuery(hql).list();
    }
    
    public void saveOrUpdate(Employee employee) {
        // If id is null, save the object.
        // If id is NOT null, update the corresponding object.
        getSession().saveOrUpdate(employee);
    }
    
    public void delete(Integer id) {
        String hql = "DELETE FROM Employee e WHERE e.id = ?";
        getSession().createQuery(hql).setInteger(0, id).executeUpdate();
    }
    
    public Employee get(Integer id) {
        String hql = "FROM Employee e LEFT OUTER JOIN FETCH e.department WHERE e.id = ?";
        return (Employee) getSession().createQuery(hql).setInteger(0, id).uniqueResult();
    }
    
    public Employee getEmployeeByLastName(String lastName) {
        String hql = "FROM Employee e WHERE e.lastName = ?";
        return (Employee) getSession().createQuery(hql).setString(0, lastName).uniqueResult();
    }

}
