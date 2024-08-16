package com.xwj2001.mapper;

import com.xwj2001.entity.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface UserMapper {
    public List<User> findAllUser();

    public List<User> findUser(String user);

    public List<User> findUserByName(String userName);

    public User findUserByAccount(String userAccount, String userPassword);

    public User findUserById(int userId);

    public int addUser(User user);

    public int updateUser(User user);

    public int deleteUserById(int id);
}
