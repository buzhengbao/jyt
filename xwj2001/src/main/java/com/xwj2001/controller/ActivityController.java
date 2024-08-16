package com.xwj2001.controller;

import com.xwj2001.aop.AutoLog;
import com.xwj2001.common.Result;
import com.xwj2001.entity.Activity;
import com.xwj2001.server.ActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author 79837
 */
@RestController
@CrossOrigin
public class ActivityController {
    @Autowired
    ActivityService activityService;


    /**
     * 获取活动
     * */
    @RequestMapping("/getActivity")
    @AutoLog("获取活动")
    public Result getAllActivity() {
        System.out.println("获取活动");
        return Result.ok().put("data", activityService.findAllActivity());
    }

    /**
     * 获取活动数量
     * */
    @RequestMapping("/getActivityCount")
    @AutoLog("获取活动数量")
    public Result getActivityCount() {
        System.out.println("获取活动数量");
        return Result.ok().put("data", activityService.findActivityCount());
    }

    /**
     * 按照名称获取活动
     * */
    @RequestMapping("/getActivityName/")
    @AutoLog("按照名称获取活动")
    public Result getActivity(Activity activity) {
        System.out.println("按照名称获取活动");
        return Result.ok().put("data", activityService.findActivity(activity));
    }

    /**
     * 更新活动
     * */
    @RequestMapping("/updateActivity")
    @ResponseBody
    @AutoLog("更新活动")
    public Result updateActivity(Activity activity) {
        int result = activityService.updateActivity(activity);
        if (result > 0) {
            return Result.ok("修改成功");
        }
        return Result.error("修改失败");
    }

    /**
     * 新增活动
     * */
    @RequestMapping("/addActivity")
    @ResponseBody
    @AutoLog("新增活动")
    public Result addUser(Activity activity) {
        int result = activityService.addActivity(activity);
        if (result > 0) {
            System.out.println("添加成功");
            return Result.ok("添加成功");
        }
        System.out.println("添加失败");
        return Result.error("添加失败");
    }

    /**
     * 删除活动
     * */
    @RequestMapping("/deleteActivityById/{id}")
    @AutoLog("删除活动")
    public Result deleteUserById(@PathVariable int id) {
        int result = activityService.deleteActivityById(id);
        if (result > 0) {
            return Result.ok("删除成功");
        }
        return Result.error("删除失败");
    }

}
