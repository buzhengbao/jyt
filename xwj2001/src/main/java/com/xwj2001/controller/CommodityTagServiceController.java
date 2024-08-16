package com.xwj2001.controller;

import com.xwj2001.aop.AutoLog;
import com.xwj2001.common.Result;
import com.xwj2001.entity.CommodityTag;
import com.xwj2001.server.CommodityTagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author 79837
 */
@RestController
@CrossOrigin
public class CommodityTagServiceController {
    @Autowired
    CommodityTagService commodityTagService;

    /**
     * 获取标签
     * */
    @RequestMapping("/getTag")
    @AutoLog("获取标签")
    public Result getAllTag() {
        System.out.println("获取标签");
        return Result.ok().put("data", commodityTagService.findAllTag());
    }

    /**
     * 按照名称查询标签
     * */
    @RequestMapping("/getTagName/")
    @AutoLog("按照名称查询标签")
    public Result getTag(CommodityTag tag) {
        System.out.println("按照标签名称查询");
        return Result.ok().put("data", commodityTagService.findTag(tag));
    }

    /**
     * 更新标签
     * */
    @RequestMapping("/updateTag")
    @AutoLog("更新标签")
    @ResponseBody
    public Result updateTag(CommodityTag tag) {
        int result = commodityTagService.updateTag(tag);
        if (result > 0) {
            return Result.ok("修改成功");
        }
        return Result.error("修改失败");
    }

    /**
     * 新增标签
     * */
    @RequestMapping("/addTag")
    @ResponseBody
    @AutoLog("新增标签")
    public Result addUser(CommodityTag tag) {
        int result = commodityTagService.addTag(tag);
        if (result > 0) {
            System.out.println("添加成功");
            return Result.ok("添加成功");
        }
        System.out.println("添加失败");
        return Result.error("添加失败");
    }

    /**
     * 删除标签
     * */
    @RequestMapping("/deleteTagById/{id}")
    @AutoLog("删除标签")
    public Result deleteUserById(@PathVariable int id) {
        int result = commodityTagService.deleteTagById(id);
        if (result > 0) {
            return Result.ok("删除成功");
        }
        return Result.error("删除失败");
    }

}
