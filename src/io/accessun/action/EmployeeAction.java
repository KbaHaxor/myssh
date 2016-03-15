package io.accessun.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import io.accessun.entity.Employee;
import io.accessun.service.DepartmentService;
import io.accessun.service.EmployeeService;

public class EmployeeAction extends ActionSupport implements RequestAware, ModelDriven<Employee>, Preparable {
    
    private static final long serialVersionUID = 1L;
    
    private Map<String, Object> requestMap;
    private EmployeeService employeeService;
    private DepartmentService departmentService;
    private Employee model;
    private Integer id;
    private InputStream inputStream; // used from ajax
    private String lastName; // used for username validation by ajax
    
    @Override
    public void setRequest(Map<String, Object> arg0) {
        this.requestMap = arg0;
    }
    
    @Override
    public Employee getModel() {
        return model;
    }
    
    public void setEmployeeService(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }
    
    public void setDepartmentService(DepartmentService departmentService) {
        this.departmentService = departmentService;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    
    public InputStream getInputStream() {
        return inputStream;
    }

    public String list() {
        requestMap.put("employees", employeeService.getAll());
        return "list";
    }
    
    public void prepareInput() {
        if (id != null) { // this means that we come from "edit", not pure "add"
            model = employeeService.get(id); // used for "view-back"
        }
    }

    public String input() {
        requestMap.put("departments", departmentService.getAll());
        return INPUT;
    }
    
    public void prepareSave() {
        if (id == null)
            model = new Employee();
        else // in case it comes from "edit" (comes from "input", we've already had a model on the stack)
            model = employeeService.get(id);
    }
    
    public String save() {
        if (id == null)
            model.setCreateTime(new Date());
        
        employeeService.saveOrUpdate(model);
        return SUCCESS;
    }
    
    public String delete() {
        try {
            employeeService.delete(id);
            inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
        } catch (Exception e) {
            e.printStackTrace();
            try {
                inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
            } catch (UnsupportedEncodingException e1) {
                e1.printStackTrace();
            }
        }
        return "ajax-success";
    }
    
    public String validateLastName() {
        boolean lastNameIsValid = employeeService.lastNameIsValid(lastName);
        
        if (lastNameIsValid) {
            try {
                inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        } else {
            try {
                inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        return "ajax-success";
    }

    @Override
    public void prepare() throws Exception {}
    
}
