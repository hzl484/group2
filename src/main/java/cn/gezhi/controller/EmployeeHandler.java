package cn.gezhi.controller;

import cn.gezhi.po.Employee;
import cn.gezhi.service.EmployeeService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
/**
 * @author hzl
 * @date 2018/8/18
 *
 * Employee控制器
 */
@Controller
@RequestMapping("/employee")
public class EmployeeHandler {
    @Autowired
    private EmployeeService service;
    @Autowired
    private HttpServletRequest request;

    private static final int PAGESIZE = 10;

    //显示员工信息列表
    @RequestMapping("/show")
    public String  getAllEmployee( Model model){
        int pageNum = 1;
        if(request.getParameter("pageNum")==null || "".equals(request.getParameter("pageNum")) || "0".equals( request.getParameter("pageNum"))){
            pageNum=1;
        }else{
            pageNum=Integer.parseInt(request.getParameter("pageNum"));
        }
        PageInfo<Employee> pageInfo = service.showeEmployee(pageNum,PAGESIZE);
        model.addAttribute("pageInfo",pageInfo);
        return "right";
    }

    //进入员工信息添加页面
    @RequestMapping("/addEmployee")
    public String addEmployee(){
        return "addEmployee";
    }

    //提交添加的员工信息
    @RequestMapping("/add")
    @ResponseBody
    public int add(int id, String name, String sex, int age, String idCardNum, String entryTime, String address, String mobile, String email, String education, String status, int careerId, int departmentId) {
        Employee employee = new Employee();
        employee.setId(id);
        employee.setName(name);
        employee.setSex(sex);
        employee.setAge(age);
        employee.setIdcardnum(idCardNum);
        employee.setEntrytime(entryTime);
        employee.setAddress(address);
        employee.setMobile(mobile);
        employee.setEmail(email);
        employee.setEducation(education);
        employee.setStatus(status);
        employee.setCareerid(careerId);
        employee.setDepartmentid(departmentId);
        int result = service.addEmployee(employee);
        if (result > 0) {
            request.setAttribute("msg",1);
        }
        request.setAttribute("msg",0);
        return result;
    }

    //进入员工信息更新页面
    @RequestMapping("/showDetail")
    public String getEmployee(Model model,int id){
//        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = service.getById(id);
        model.addAttribute("employee",employee);
        return "updateEmployee";
    }

    //提交更新的员工信息
    @RequestMapping("/update")
    @ResponseBody
    public int updateEmployee(int id,String name,String sex,int age,String idCardNum,String entryTime,String address,String mobile,String email,String education,String status,int careerId,int departmentId){
        Employee employee = new Employee();
        employee.setId(id);
        employee.setName(name);
        employee.setSex(sex);
        employee.setAge(age);
        employee.setIdcardnum(idCardNum);
        employee.setEntrytime(entryTime);
        employee.setAddress(address);
        employee.setMobile(mobile);
        employee.setEmail(email);
        employee.setEducation(education);
        employee.setStatus(status);
        employee.setCareerid(careerId);
        employee.setDepartmentid(departmentId);
        int result = service.update(employee);
        if (result > 0) {
            request.setAttribute("msg",1);
        }
        request.setAttribute("msg",0);
        return result;
    }
}
