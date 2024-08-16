package com.xwj2001.server.impl;

import com.xwj2001.common.JwtTokenUtils;
import com.xwj2001.mapper.UserMapper;
import com.xwj2001.entity.User;
import com.xwj2001.server.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
/**
 * @author 79837
 */
public class UserImpl implements UserService {
    @Autowired
    UserMapper userMapper;

    @Override
    public List<User> findAllUser() {
        return userMapper.findAllUser();
    }

    @Override
    public List<User> findUser(String userAccount) {
        return userMapper.findUser(userAccount);
    }

    @Override
    public User login(User user) {
        System.out.println(user.getUserPassword());
        User user1 = userMapper.findUserByAccount(user.getUserAccount(),user.getUserPassword());
        System.out.println(user1);
        String token = JwtTokenUtils.genToken(String.valueOf(user1.getUserId()),user1.getUserPassword());
        if(token != null){
            user1.setToken(token);
        }else {
            user1.setToken("微信端执行");
        }

        return user1;
    }

    @Override
    public List<User> findUserByName(String userName) {
        return userMapper.findUserByName(userName);
    }

    @Override
    public User findUserById(int userId) {
        return userMapper.findUserById(userId);
    }

    @Override
    public int addUser(User user) {
        return userMapper.addUser(user);
    }

    @Override
    public int updateUser(User user) {
        return userMapper.updateUser(user);
    }

    @Override
    public int deleteUserById(int id) {
        return userMapper.deleteUserById(id);
    }
}
