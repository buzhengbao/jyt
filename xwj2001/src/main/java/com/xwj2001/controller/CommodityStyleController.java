package com.xwj2001.controller;

import com.xwj2001.aop.AutoLog;
import com.xwj2001.common.Result;
import com.xwj2001.entity.CommodityStyle;
import com.xwj2001.server.CommodityStyleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author 79837
 */
@RestController
@CrossOrigin
public class CommodityStyleController {
    @Autowired
    CommodityStyleService commodityStyleService;

    /**
     * 获取款式
     * */
    @RequestMapping("/getStyle")
    @AutoLog("获取款式")
    public Result getAllStyle() {
        System.out.println("获取款式");
        return Result.ok().put("data", commodityStyleService.findAllStyle());
    }

    /**
     * 按照名称获取款式
     * */
    @RequestMapping("/getStyleName/")
    @AutoLog("按照名称获取款式")
    public Result getStyle(CommodityStyle Style) {
        System.out.println("按照款式名称查询");
        return Result.ok().put("data", commodityStyleService.findStyle(Style));
    }

    /**
     * 更新款式
     * */
    @RequestMapping("/updateStyle")
    @ResponseBody
    @AutoLog("更新款式")
    public Result updateStyle(CommodityStyle style) {
        int result = commodityStyleService.updateStyle(style);
        if (result > 0) {
            return Result.ok("修改成功");
        }
        return Result.error("修改失败");
    }

    /**
     * 新增款式
     * */
    @RequestMapping("/addStyle")
    @ResponseBody
    @AutoLog("新增款式")
    public Result addUser(CommodityStyle style) {
        int result = commodityStyleService.addStyle(style);
        if (result > 0) {
            System.out.println("添加成功");
            return Result.ok("添加成功");
        }
        System.out.println("添加失败");
        return Result.error("添加失败");
    }

    /**
     * 删除款式
     * */
    @RequestMapping("/deleteStyleById/{id}")
    @AutoLog("删除款式")
    public Result deleteUserById(@PathVariable int id) {
        int result = commodityStyleService.deleteStyleById(id);
        if (result > 0) {
            return Result.ok("删除成功");
        }
        return Result.error("删除失败");
    }

}
