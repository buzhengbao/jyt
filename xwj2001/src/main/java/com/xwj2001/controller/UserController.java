package com.xwj2001.controller;

//import com.xwj2001.aop.AutoLog;

import cn.hutool.json.JSON;
import com.xwj2001.aop.AutoLog;
import com.xwj2001.common.JwtTokenUtils;
import com.xwj2001.common.Result;
import com.xwj2001.entity.User;
import com.xwj2001.server.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.alibaba.druid.util.Utils.md5;

@RestController
@CrossOrigin
public class UserController {
    @Autowired
    UserService userService;

    /**
     * 后台登录接口
     * */
    @PostMapping("/login")
    @AutoLog("登录后台")
    public Result login(User user) {
        User userLogin = userService.login(user);
        return Result.ok().put("data", userLogin);
    }

    /**
     * 微信登录接口
     * */
    @GetMapping("/wxLogin")
    @AutoLog("微信登录")
    public Result wxLogin(User user) {
        User userLogin = userService.login(user);
        return Result.ok().put("data", userLogin);
    }

    /**
     * 获取用户接口
     */
    @RequestMapping("/getUser")
    @AutoLog("获取用户列表")
    public Result getUser() {
        System.out.println("获取用户");
        return Result.ok().put("data", userService.findAllUser());
    }

    /**
     * 用户登录接口
     */
    @RequestMapping("/getLogin/{userAccount}")
    @AutoLog("微信端登录")
    public Result getLogin(@PathVariable String userAccount) {
        System.out.println("登录用户");
        return Result.ok().put("data", userService.findUser(userAccount));
    }

    /**
     * 姓名查询用户接口
     */
    @RequestMapping("/getUserName/{userName}")
    @AutoLog("按照姓名查询用户")
    public Result getUserByName(@PathVariable String userName) {
        System.out.println("按照用户名查询");
        return Result.ok().put("data", userService.findUserByName(userName));
    }

    /**
     * 修改用户信息接口
     * */
    @RequestMapping("/updateUser")
    @ResponseBody
    @AutoLog("修改用户信息")
    public Result updateUser(User user) {
        int result = userService.updateUser(user);
        if (result > 0) {
            return Result.ok("修改成功");
        }
        return Result.error("修改失败");
    }

    /**
     * 新增用户接口
     * */
    @RequestMapping("/addUser")
    @ResponseBody
    @AutoLog("新增用户")
    public Result addUser(User user) {
        int result = userService.addUser(user);
        if (result > 0) {
            System.out.println("添加成功");
            return Result.ok("添加成功");
        }
        System.out.println("添加失败");
        return Result.error("添加失败");
    }

    /**
     * 删除用户接口
     * */
    @RequestMapping("/deleteUserById/{id}")
    @AutoLog("删除用户")
    public Result deleteUserById(@PathVariable int id) {
        int result = userService.deleteUserById(id);
        if (result > 0) {
            return Result.ok("删除成功");
        }
        return Result.error("删除失败");
    }

}
