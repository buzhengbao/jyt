package com.xwj2001.controller;

import com.xwj2001.aop.AutoLog;
import com.xwj2001.common.Result;
import com.xwj2001.entity.Home;
import com.xwj2001.server.HomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author 79837
 */
@RestController
@CrossOrigin
public class HomeController {
    @Autowired
    HomeService homeService;

    /**
     * 获取商品数量
     * */
    @RequestMapping("/getcCount")
    @AutoLog("获取商品数量")
    public Result getcCount() {
        System.out.println("获取商品数量");
        return Result.ok().put("data", homeService.cCount());
    }

    /**
     * 获取商品类型数量
     * */
    @RequestMapping("/getctyCount")
    @AutoLog("获取商品类型数量")
    public Result getctyCount() {
        System.out.println("获取商品类型数量");
        return Result.ok().put("data", homeService.ctyCount());
    }

    /**
     * 获取商品款式数量
     * */
    @RequestMapping("/getcsCount")
    @AutoLog("获取商品款式数量")
    public Result getcsCount() {
        System.out.println("获取款式数量");
        return Result.ok().put("data", homeService.csCount());
    }

    /**
     * 获取活动数量
     * */
    @RequestMapping("/getaCount")
    @AutoLog("获取活动数量")
    public Result getaCount() {
        System.out.println("获取活动数量");
        return Result.ok().put("data", homeService.aCount());
    }

    /**
     * 获取用户数量
     * */
    @RequestMapping("/getuCount")
    @AutoLog("获取用户数量")
    public Result getuCount() {
        System.out.println("获取用户数量");
        return Result.ok().put("data", homeService.uCount());
    }

    /**
     * 获取商品标签数量
     * */
    @RequestMapping("/getctCount")
    @AutoLog("获取标签数量")
    public Result getctCount() {
        System.out.println("获取标签数量");
        return Result.ok().put("data", homeService.ctCount());
    }

    /**
     * 获取全部类型
     * */
    @RequestMapping("/getTypeTotal")
    @AutoLog("获取全部类型")
    public Result getTypeTotal() {
        System.out.println("获取全部类型");
        return Result.ok().put("data", homeService.typeTotal());
    }

    /**
     * 获取全部款式
     * */
    @RequestMapping("/getStyleTotal")
    @AutoLog("获取全部款式")
    public Result getStyleTotal() {
        System.out.println("获取全部款式");
        return Result.ok().put("data", homeService.styleTotal());
    }

    /**
     * 获取全部标签
     * */
    @RequestMapping("/getTagTotal")
    @AutoLog("获取全部标签")
    public Result getTagTotal() {
        System.out.println("获取全部标签");
        return Result.ok().put("data", homeService.tagTotal());
    }

}
