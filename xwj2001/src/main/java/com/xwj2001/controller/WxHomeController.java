package com.xwj2001.controller;

import com.xwj2001.aop.AutoLog;
import com.xwj2001.common.Result;
import com.xwj2001.entity.WxHome;
import com.xwj2001.server.WxHomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author 79837
 */
@RestController
@CrossOrigin
public class WxHomeController {
    @Autowired
    WxHomeService wxHomeService;

    /**
     * 微信端获取tag接口
     * */
    @RequestMapping("/getWxTag/")
    @AutoLog("微信端获取标签")
    public Result getType(WxHome wxHome) {
        System.out.println("微信端获取tag");
        return Result.ok().put("data", wxHomeService.tag(wxHome));
    }

    /**
     * 微信端获取商品接口
     * */
    @RequestMapping("/getWxCommodity/")
    @AutoLog("微信端获取商品")
    public Result getWxCommodity(WxHome wxHome) {
        System.out.println("微信端获取商品");
        return Result.ok().put("data", wxHomeService.commodity(wxHome));
    }

    /**
     * 微信端获取类型接口
     * */
    @RequestMapping("/getWxType/")
    @AutoLog("微信端获取类型")
    public Result getWxType(WxHome wxHome) {
        System.out.println("微信端获取类型");
        return Result.ok().put("data", wxHomeService.type(wxHome));
    }

    /**
     * 微信端获取商品图片接口
     * */
    @RequestMapping("/getWxCommodityImg/")
    @AutoLog("微信端获取商品图片")
    public Result getWxCommodityImg(WxHome wxHome) {
        System.out.println("微信端获取获取商品图片");
        return Result.ok().put("data", wxHomeService.img(wxHome));
    }

    /**
     * 微信端获取类型价格升序接口
     * */
    @RequestMapping("/getWxTypePriceUp/")
    @AutoLog("微信端获取类型价格升序")
    public Result getWxTypePriceUp(WxHome wxHome) {
        System.out.println("微信端获取类型价格升序");
        return Result.ok().put("data", wxHomeService.typePriceUp(wxHome));
    }

    /**
     * 微信端获取类型价格降序接口
     * */
    @RequestMapping("/getWxTypePriceDown/")
    @AutoLog("微信端获取类型价格降序")
    public Result getWxTypePriceDown(WxHome wxHome) {
        System.out.println("微信端获取类型价格降序");
        return Result.ok().put("data", wxHomeService.typePriceDown(wxHome));
    }

    /**
     * 微信端获取类型重量升序
     * */
    @RequestMapping("/getWxTypeWageUp/")
    @AutoLog("微信端获取类型重量升序")
    public Result getWxTypeWageUp(WxHome wxHome) {
        System.out.println("微信端获取类型重量升序");
        return Result.ok().put("data", wxHomeService.typeWageUp(wxHome));
    }

    /**
     * 微信获取类型重量降序
     * */
    @RequestMapping("/getWxTypeWageDown/")
    @AutoLog("微信端获取类型重量降序")
    public Result getWxTypeWageDown(WxHome wxHome) {
        System.out.println("微信端获取类型重量降序");
        return Result.ok().put("data", wxHomeService.typeWageDown(wxHome));
    }

    /**
     * 微信获取类型时间升序
     * */
    @RequestMapping("/getWxTypeTimeUp/")
    @AutoLog("微信端获取类型时间升序")
    public Result getWxTypeTimeUp(WxHome wxHome) {
        System.out.println("微信端获取类型时间升序");
        return Result.ok().put("data", wxHomeService.typeTimeUp(wxHome));
    }

    /**
     * 微信获取类型时间降序
     * */
    @RequestMapping("/getWxTypeTimeDown/")
    @AutoLog("微信端获取类型时间降序")
    public Result getWxTypeTimeDown(WxHome wxHome) {
        System.out.println("微信端获取类型时间降序");
        return Result.ok().put("data", wxHomeService.typeTimeDown(wxHome));
    }

    /**
     * 微信获取款式
     * */
    @RequestMapping("/getWxStyle/")
    @AutoLog("微信端获取款式")
    public Result getWxStyle(WxHome wxHome) {
        System.out.println("微信端获取款式");
        return Result.ok().put("data", wxHomeService.style(wxHome));
    }

    /**
     * 微信获取款式价格升序
     * */
    @RequestMapping("/getWxStylePriceUp/")
    @AutoLog("微信端获取款式价格升序")
    public Result getWxStylePriceUp(WxHome wxHome) {
        System.out.println("微信端获取款式价格升序");
        return Result.ok().put("data", wxHomeService.stylePriceUp(wxHome));
    }

    /**
     * 微信获取款式价格降序
     * */
    @RequestMapping("/getWxStylePriceDown/")
    @AutoLog("微信端获取款式价格降序")
    public Result getWxStylePriceDown(WxHome wxHome) {
        System.out.println("微信端获取款式价格降序");
        return Result.ok().put("data", wxHomeService.stylePriceDown(wxHome));
    }

    /**
     * 微信获取款式重量降序
     * */
    @RequestMapping("/getWxStyleWageUp/")
    @AutoLog("微信端获取款式重量降序")
    public Result getWxStyleWageUp(WxHome wxHome) {
        System.out.println("微信端获取款式重量降序");
        return Result.ok().put("data", wxHomeService.styleWageUp(wxHome));
    }

    /**
     * 微信获取款式重量降序
     * */
    @RequestMapping("/getWxStyleWageDown/")
    @AutoLog("微信端获取款式重量降序")
    public Result getWxStyleWageDown(WxHome wxHome) {
        System.out.println("微信端获取款式重量降序");
        return Result.ok().put("data", wxHomeService.styleWageDown(wxHome));
    }

    /**
     * 微信获取款式时间升序
     * */
    @RequestMapping("/getWxStyleTimeUp/")
    @AutoLog("微信端获取款式时间升序")
    public Result getWxStyleTimeUp(WxHome wxHome) {
        System.out.println("微信端获取时间升序");
        return Result.ok().put("data", wxHomeService.styleTimeUp(wxHome));
    }

    /**
     * 微信获取款式时间降序
     * */
    @RequestMapping("/getWxStyleTimeDown/")
    @AutoLog("微信端获取款式时间降序")
    public Result getWxStyleTimeDown(WxHome wxHome) {
        System.out.println("微信端获取款式时间降序");
        return Result.ok().put("data", wxHomeService.styleTimeDown(wxHome));
    }

    /**
     * 微信获取活动
     * */
    @RequestMapping("/getWxActivity/")
    @AutoLog("微信端获取活动")
    public Result getWxActivity(WxHome wxHome) {
        System.out.println("微信端获取活动");
        return Result.ok().put("data", wxHomeService.activity(wxHome));
    }

    /**
     * 微信获取活动价格升序
     * */
    @RequestMapping("/getWxActivityPriceUp/")
    @AutoLog("微信端获取活动价格升序")
    public Result getWxActivityPriceUp(WxHome wxHome) {
        System.out.println("微信端获取活动价格升序");
        return Result.ok().put("data", wxHomeService.activityPriceUp(wxHome));
    }

    /**
     * 微信获取活动价格降序
     * */
    @RequestMapping("/getWxActivityPriceDown/")
    @AutoLog("微信端获取活动价格降序")
    public Result getWxActivityPriceDown(WxHome wxHome) {
        System.out.println("微信端获取获取价格降序");
        return Result.ok().put("data", wxHomeService.activityPriceDown(wxHome));
    }

    /**
     * 微信获取活动重量升序
     * */
    @RequestMapping("/getWxActivityWageUp/")
    @AutoLog("微信端获取活动重量升序")
    public Result getWxActivityWageUp(WxHome wxHome) {
        System.out.println("微信端获取重量升序");
        return Result.ok().put("data", wxHomeService.activityWageUp(wxHome));
    }

    /**
     * 微信获取活动重量降序
     * */
    @RequestMapping("/getWxActivityWageDown/")
    @AutoLog("微信端获取活动活动重量降序")
    public Result getWxActivityWageDown(WxHome wxHome) {
        System.out.println("微信端获取重量降序");
        return Result.ok().put("data", wxHomeService.activityWageDown(wxHome));
    }

    /**
     * 微信获取活动时间升序
     * */
    @RequestMapping("/getWxActivityTimeUp/")
    @AutoLog("微信端获取活动时间升序")
    public Result getWxActivityTimeUp(WxHome wxHome) {
        System.out.println("微信端获取活动时间升序");
        return Result.ok().put("data", wxHomeService.activityTimeUp(wxHome));
    }

    /**
     * 微信获取活动时间降序
     * */
    @RequestMapping("/getWxActivityTimeDown/")
    @AutoLog("微信端获取活动时间降序")
    public Result getWxActivityTimeDown(WxHome wxHome) {
        System.out.println("微信端获取活动时间降序");
        return Result.ok().put("data", wxHomeService.activityTimeDown(wxHome));
    }
}
