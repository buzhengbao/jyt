package com.xwj2001.controller;

import com.xwj2001.aop.AutoLog;
import com.xwj2001.common.Result;
import com.xwj2001.entity.CommodityType;
import com.xwj2001.server.CommodityTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author 79837
 */
@RestController
@CrossOrigin
public class CommodityTypeController {
    @Autowired
    CommodityTypeService commodityTypeService;


    /**
     * 获取类型
     * */
    @RequestMapping("/getType")
    @AutoLog("获取类型")
    public Result getAllType() {
        System.out.println("获取类型");
        return Result.ok().put("data", commodityTypeService.findAllType());
    }

    /**
     * 按照名称获取类型
     * */
    @RequestMapping("/getTypeName/")
    @AutoLog("按照名称获取类型")
    public Result getType(CommodityType type) {
        System.out.println("按照类型名称查询");
        return Result.ok().put("data", commodityTypeService.findType(type));
    }

    /**
     * 更新类型
     * */
    @RequestMapping("/updateType")
    @ResponseBody
    @AutoLog("更新类型")
    public Result updateType(CommodityType type) {
        int result = commodityTypeService.updateType(type);
        if (result > 0) {
            return Result.ok("修改成功");
        }
        return Result.error("修改失败");
    }


    /**
     * 添加类型
     * */
    @RequestMapping("/addType")
    @ResponseBody
    @AutoLog("添加类型")
    public Result addUser(CommodityType type) {
        int result = commodityTypeService.addType(type);
        if (result > 0) {
            System.out.println("添加成功");
            return Result.ok("添加成功");
        }
        System.out.println("添加失败");
        return Result.error("添加失败");
    }

    /**
     * 删除类型
     * */
    @RequestMapping("/deleteTypeById/{id}")
    @AutoLog("删除类型")
    public Result deleteUserById(@PathVariable int id) {
        int result = commodityTypeService.deleteTypeById(id);
        if (result > 0) {
            return Result.ok("删除成功");
        }
        return Result.error("删除失败");
    }

}
