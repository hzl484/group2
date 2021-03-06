package cn.gezhi.controller;

import cn.gezhi.po.User;
import cn.gezhi.service.impl.UserServiceImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.List;
/**
 * 1.login界面登录的拦截
 * 2.搜索时的传值
 * 3.ajax获取值乱码
 * 4.分页处理
 */



/**
 * @Author yf
 * date : 8-20
 * name :UserController
 */
@Controller
@RequestMapping()
public class UserHandler {
    @Autowired
    UserServiceImp serviceImp;
    @RequestMapping("/loginView")
    public String login(HttpServletRequest request, @RequestParam String username,@RequestParam String password){  //通过用户名查询用户，可用于登录
        User user = serviceImp.getUser(username);
        System.out.println(user);
        if(user == null){
            //填充数据
            request.setAttribute("user","用户不存在！");
        }else{
            if(username.equals(user.getUsername()) && password.equals(user.getPassword())){
                request.setAttribute("user",user);
                return "main";
            }else{
                request.setAttribute("user","用户名或密码输入错误");
            }
        }
        //方法返回值就是试图名
        return "login";
    }

    @RequestMapping("/add") //添加用户方法
    public void addUser(HttpServletRequest request, HttpServletResponse response, @RequestParam String username,
                        @RequestParam String password, @RequestParam(required = false) String id){
        System.out.println(username+"-------"+password+"-------"+id);
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        int num =serviceImp.addUser(user);
        if (num > 0) {
            request.setAttribute("name", "添加用户成功！");
            try {
                request.getRequestDispatcher("/UserTab").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            request.setAttribute("name", "添加用户失败！");
            try {
                request.getRequestDispatcher("/modify").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @RequestMapping("/getAll")//查询所有用户
    public String getAll(HttpServletRequest request, HttpServletResponse response){
        List<User> list = serviceImp.getAllUser();
        request.setAttribute("list", list);
        return "UserTab";
    }

    @RequestMapping("/updateUser") //修改用户
    public String updateUser(HttpServletRequest request){
        String username = request.getParameter("username");
        System.out.println(username);
        //获取到id查询此用户，用返回值显示到修改用户页面
       User user = serviceImp.getUser(username);
        request.setAttribute("userinfor", user);
        return "changeUser";
    }
    @RequestMapping("/updateSussess")
    public String updateSussess(HttpServletRequest request,String id,String username,String password){
        System.out.println(id+"-------"+username+"-------"+password);
        Integer id1 =Integer.parseInt(id);
        System.out.println(id1);
        User user = new User();
        user.setId(id1);
        user.setUsername(username);
        user.setPassword(password);
       int num= serviceImp.changeUser(user);
        if(num>0){
            request.setAttribute("information", "修改用户成功了哟！");
            return "infor";
        }else{
            request.setAttribute("information", "修改用户失败！");
            return "infor";
        }
    }
    
    @RequestMapping("/dele")
    public String deleteUser(HttpServletRequest request){  //删除用户记录
        String id1 = request.getParameter("id");
        Integer id =Integer.parseInt(id1);
        System.out.println(id);
       int num = serviceImp.removeUser(id);
       // int num = 2;
        //填充数据
        if(num>0){
            request.setAttribute("information", "删除用户成功了哟！");
            return "infor";
        }else{
            request.setAttribute("information", "删除用户失败！");
            return "infor";
        }

        //方法返回值就是试图名
    }
    @RequestMapping("/searchUser")
    public String searchUser(HttpServletRequest request){   //搜获用户
       String getValue = request.getParameter("name");
        System.out.println(getValue);
        return "";
    }
    @RequestMapping("/verification")
    public String verification(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        username = URLDecoder.decode(username,"UTF-8");
        System.out.println(username);
        User user = serviceImp.getUser(username);
        if(user != null){
            //用户名存在，不可用
            response.getWriter().write("no");
        }else{
            //可用
            response.getWriter().write("ok");
        }
        return "";
    }


//    @RequestMapping("/index")
//    public String returnMain(){
//        return "U_main";
//    }
    @RequestMapping("/U_left")
    public String returnleft(){
        return "U_left";
    }
    @RequestMapping("/U_top")
    public String returntop(){
        return "U_top";
    }
    @RequestMapping("/UserTab")
    public String returnUsertab(){
        return "UserTab";
    }
    @RequestMapping("/login")
    public String returnlogin(){
        return "login";
    }
    @RequestMapping("/addUser")
    public String returnAdduser(){
        return "addUser";
    }
    @RequestMapping("/infor")
    public String returnInfor(){
        return "infor";
    }
    @RequestMapping("/changeUser")
    public String returnChange(){
        return "changeUser";
    }
    @RequestMapping("/modify")
    public String returnModify(HttpServletRequest request){
        List<User> allUser = serviceImp.getAllUser();
        request.setAttribute("allUser",allUser);
        return "modify";
    }
}
