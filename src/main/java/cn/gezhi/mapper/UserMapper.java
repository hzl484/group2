package cn.gezhi.mapper;

import cn.gezhi.po.User;
import cn.gezhi.po.UserExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
   int insertUser(User user);//添加用户
   User selectUser(String username);//通过用户名查询用户
    List<User> selectAllUser();//查询所有用户
    int deleteUser(Integer id);//删除用户
    int updateUser(User user);//更新用户
    List<User> selectSearchAll(User user);//搜索用户
}