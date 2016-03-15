package io.accessun.service;

import java.util.List;

import io.accessun.dao.DepartmentDao;
import io.accessun.entity.Department;

public class DepartmentService {

    private DepartmentDao departmentDao;
    
    public void setDepartmentDao(DepartmentDao departmentDao) {
        this.departmentDao = departmentDao;
    }
    
    public List<Department> getAll() {
        return departmentDao.getAll();
    }
}
