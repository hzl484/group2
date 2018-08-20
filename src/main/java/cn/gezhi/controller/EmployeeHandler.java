package cn.gezhi.controller;

import cn.gezhi.po.Employee;
import cn.gezhi.service.EmployeeService;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
/**
/ Employee控制器
 */
@Controller
@RequestMapping("/employee")
public class EmployeeHandler {
    @Autowired
    private EmployeeService service;
    @Autowired
    private HttpServletRequest request;

    @RequestMapping("/showDetail")
    public ModelAndView getEmployee(int id){
        ModelAndView mav = new ModelAndView();
        Employee employee = service.getById(id);
        mav.addObject("employee",employee);
        return mav;
    }

    @RequestMapping("/show")
    public ModelAndView getAllEmployee(int page){
        ModelAndView mav = new ModelAndView();
        PageInfo<Employee> pageInfo = service.showeEmployee(page,10);
        mav.addObject("employeeList",pageInfo);
        mav.setViewName("employeeList");
        return mav;
    }

    @RequestMapping("/add")
    public String addEmployee(int id,String name,String sex,int age,String idCardNum,String address,String mobile,String email,String education,String status,int careerId,int departmentId) {
        Employee employee = new Employee();
        employee.setId(id);
        employee.setSex(sex);
        employee.setAge(age);
        employee.setIdcardnum(idCardNum);
        employee.setAddress(address);
        employee.setMobile(mobile);
        employee.setEmail(email);
        employee.setEducation(education);
        employee.setStatus(status);
        employee.setCareerid(careerId);
        employee.setDepartmentid(departmentId);
        int result = service.addEmployee(employee);
        if (result > 0) {
            return "addSuccess";
        }
        return "error";
    }

    @RequestMapping("/update")
    public String updateEmployee(int id,String name,String sex,int age,String idCardNum,String address,String mobile,String email,String education,String status,int careerId,int departmentId){
        Employee employee = new Employee();
        employee.setId(id);
        employee.setSex(sex);
        employee.setAge(age);
        employee.setIdcardnum(idCardNum);
        employee.setAddress(address);
        employee.setMobile(mobile);
        employee.setEmail(email);
        employee.setEducation(education);
        employee.setStatus(status);
        employee.setCareerid(careerId);
        employee.setDepartmentid(departmentId);
        int result = service.update(employee);
        if (result > 0){
            return "updateSuccess";
        }
        return "error";
    }
}
