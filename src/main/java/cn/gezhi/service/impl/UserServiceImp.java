package cn.gezhi.service.impl;

import cn.gezhi.mapper.UserMapper;
import cn.gezhi.po.User;
import cn.gezhi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImp implements UserService {
    @Autowired
    private UserMapper mapper;
    @Override
    //添加用户
    public int addUser(User user) {
        return mapper.insertUser(user);
    }

    @Override
    //查询用户
    public User getUser(String username) {
        return mapper.selectUser(username);
    }

    @Override
    //查询所有用户
    public List<User> getAllUser() {
        return mapper.selectAllUser();
    }

    @Override
    //通过ID删除用户
    public int removeUser(Integer id) {
        return mapper.deleteUser(id);
    }

    @Override
    //修改用户
    public int changeUser(User user) {
        return mapper.updateUser(user);
    }
}
