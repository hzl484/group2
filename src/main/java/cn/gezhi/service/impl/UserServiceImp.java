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
    public int addUser(User user) {
        return mapper.insertUser(user);
    }

    @Override
    public User getUser(String username) {
        return mapper.selectUser(username);
    }

    @Override
    public List<User> getAllUser() {
        return mapper.selectAllUser();
    }

    @Override
    public int removeUser(Integer id) {
        return mapper.deleteUser(id);
    }

    @Override
    public int changeUser(User user) {
        return mapper.updateUser(user);
    }
}
