package com.xwj2001.controller;

import com.xwj2001.aop.AutoLog;
import com.xwj2001.common.Result;
import com.xwj2001.entity.Log;
import com.xwj2001.server.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author 79837
 */
@RestController
@CrossOrigin
public class LogController {
    @Autowired
    LogService logService;

    /**
     * 获取日志
     * */
    @RequestMapping( "/getLog")
    @AutoLog("获取日志")
    public Result getLog() {
        System.out.println("获取日志");
        return Result.ok().put("data",logService.findAllLog());
    }

    /**
     * 新增日志
     * */
    @RequestMapping( "/addLog")
    @ResponseBody
    public Result addLog( Log log) {
        int result = logService.addLog(log);
        if (result>0){
            System.out.println("添加成功");
            return Result.ok("添加成功");
        }
        System.out.println("添加失败");
        return Result.error("添加失败");
    }

    /**
     * 删除日志
     * */
    @RequestMapping( "/deleteLogById/{id}")
    @AutoLog("删除日志")
    public Result deleteLogById(@PathVariable int id) {
        int result = logService.deleteLogById(id);
        if(result>0){
            return Result.ok("删除成功");
        }
        return Result.error("删除失败");
    }

}
