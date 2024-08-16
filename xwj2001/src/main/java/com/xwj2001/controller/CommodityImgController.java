package com.xwj2001.controller;

import com.xwj2001.aop.AutoLog;
import com.xwj2001.common.Result;
import com.xwj2001.entity.CommodityImg;
import com.xwj2001.server.CommodityImgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author 79837
 */
@RestController
@CrossOrigin
public class CommodityImgController {
    @Autowired
    CommodityImgService commodityImgService;

    /**
     * 获取图片
     * */
    @RequestMapping("/getImg")
    @AutoLog("获取图片")
    public Result getAllImg() {
        System.out.println("获取图片");
        return Result.ok().put("data", commodityImgService.findAllImg());
    }

    /**
     * 按照名称获取图片
     * */
    @RequestMapping("/getImgName/")
    @AutoLog("按照名称获取图片")
    public Result getImg(CommodityImg img) {
        System.out.println("按照图片名称查询");
        return Result.ok().put("data", commodityImgService.findImg(img));
    }

    /**
     * 更新图片
     * */
    @RequestMapping("/updateImg")
    @ResponseBody
    @AutoLog("更新图片")
    public Result updateImg(CommodityImg img) {
        int result = commodityImgService.updateImg(img);
        if (result > 0) {
            return Result.ok("修改成功");
        }
        return Result.error("修改失败");
    }

    /**
     * 新增图片
     * */
    @RequestMapping("/addImg")
    @ResponseBody
    @AutoLog("新增图片")
    public Result addUser(CommodityImg img) {
        int result = commodityImgService.addImg(img);
        if (result > 0) {
            System.out.println("添加成功");
            return Result.ok("添加成功");
        }
        System.out.println("添加失败");
        return Result.error("添加失败");
    }

    /**
     * 删除图片
     * */
    @RequestMapping("/deleteImgById/{id}")
    @AutoLog("删除图片")
    public Result deleteUserById(@PathVariable int id) {
        int result = commodityImgService.deleteImgById(id);
        if (result > 0) {
            return Result.ok("删除成功");
        }
        return Result.error("删除失败");
    }

}
