package com.xwj2001.server;

import com.xwj2001.entity.User;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface UserService {
    public List<User> findAllUser();

    List<User> findUser(String userAccount);

    public User login(User user);

    public List<User> findUserByName(String userName);

    public User findUserById(int userId);

    public int addUser(User user);

    public int updateUser(User user);

    public int deleteUserById(int id);
}
