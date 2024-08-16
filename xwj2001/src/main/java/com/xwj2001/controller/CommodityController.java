package com.xwj2001.controller;

import com.xwj2001.aop.AutoLog;
import com.xwj2001.common.Result;
import com.xwj2001.entity.Commodity;
import com.xwj2001.server.CommodityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author 79837
 */
@RestController
@CrossOrigin
public class CommodityController {
    @Autowired
    CommodityService commodityService;


    /**
     * 获取商品
     * */
    @RequestMapping("/getCommodity")
    @AutoLog("获取商品")
    public Result getAllCommodity() {
        System.out.println("获取商品");
        return Result.ok().put("data", commodityService.findAllCommodity());
    }

    /**
     * 按照名称获取商品
     * */
    @RequestMapping("/getCommodityName/")
    @AutoLog("按照名称获取商品")
    public Result getCommodity(Commodity commodity) {
        System.out.println("按照名称获取商品");
        return Result.ok().put("data", commodityService.findCommodity(commodity));
    }

    /**
     * 修改商品
     * */
    @RequestMapping("/updateCommodity")
    @ResponseBody
    @AutoLog("更新商品")
    public Result updateCommodity(Commodity commodity) {
        int result = commodityService.updateCommodity(commodity);
        if (result > 0) {
            return Result.ok("修改成功");
        }
        return Result.error("修改失败");
    }

    /**
     * 新增商品
     * */
    @RequestMapping("/addCommodity")
    @ResponseBody
    @AutoLog("新增商品")
    public Result addUser(Commodity commodity) {
        int result = commodityService.addCommodity(commodity);
        if (result > 0) {
            System.out.println("添加成功");
            return Result.ok("添加成功");
        }
        System.out.println("添加失败");
        return Result.error("添加失败");
    }

    /**
     * 删除商品
     * */
    @RequestMapping("/deleteCommodityById/{id}")
    @AutoLog("删除商品")
    public Result deleteUserById(@PathVariable int id) {
        int result = commodityService.deleteCommodityById(id);
        if (result > 0) {
            return Result.ok("删除成功");
        }
        return Result.error("删除失败");
    }

}
