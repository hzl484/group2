package cn.gezhi.service;

import cn.gezhi.po.User;

import java.util.List;

public interface UserService {
    int addUser(User user);//添加用户
    User getUser(String username);//通过用户名查询用户
    List<User> getAllUser();//查询所有用户
    int removeUser(Integer id);//删除用户
    int changeUser(User user);//更新用户
    List<User> searchAll(User user);//搜索用户
}
