package io.accessun.dao;

import java.util.List;

import io.accessun.entity.Department;

public class DepartmentDao extends BaseDao {

    @SuppressWarnings("unchecked")
    public List<Department> getAll() {
        String hql = "FROM Department";
        return getSession().createQuery(hql).list();
    }
}
