package com.xwj2001.controller;

import com.xwj2001.aop.AutoLog;
import com.xwj2001.common.Result;
import com.xwj2001.entity.CommodityTagList;
import com.xwj2001.server.CommodityTagListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author 79837
 */
@RestController
@CrossOrigin
public class CommodityTagListController {
    @Autowired
    CommodityTagListService commodityTagListService;

    /**
     * 获取标签列表
     * */
    @RequestMapping("/getTagList")
    @AutoLog("获取标签列表")
    public Result getAllTagList() {
        System.out.println("获取标签");
        return Result.ok().put("data", commodityTagListService.findAllTagList());
    }

    /**
     * 按照名称查询标签
     * */
    @RequestMapping("/getTagListName/")
    @AutoLog("按照名称查询标签")
    public Result getTagList(CommodityTagList tagList) {
        System.out.println("按照标签名称查询");
        return Result.ok().put("data", commodityTagListService.findTagList(tagList));
    }

    /**
     * 更新标签
     * */
    @RequestMapping("/updateTagList")
    @ResponseBody
    @AutoLog("更新标签")
    public Result updateTagList(CommodityTagList tagList) {
        int result = commodityTagListService.updateTagList(tagList);
        if (result > 0) {
            return Result.ok("修改成功");
        }
        return Result.error("修改失败");
    }

    /**
     * 新增标签
     * */
    @RequestMapping("/addTagList")
    @ResponseBody
    @AutoLog("新增标签")
    public Result addUser(CommodityTagList tagList) {
        int result = commodityTagListService.addTagList(tagList);
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
    @RequestMapping("/deleteTagListById/{id}")
    @AutoLog("删除标签")
    public Result deleteUserById(@PathVariable int id) {
        int result = commodityTagListService.deleteTagListById(id);
        if (result > 0) {
            return Result.ok("删除成功");
        }
        return Result.error("删除失败");
    }

}
