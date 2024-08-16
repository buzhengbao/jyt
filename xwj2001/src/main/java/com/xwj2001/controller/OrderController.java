package com.xwj2001.controller;

import com.xwj2001.aop.AutoLog;
import com.xwj2001.common.Result;
import com.xwj2001.entity.Order;
import com.xwj2001.server.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author 79837
 */
@RestController
@CrossOrigin
public class OrderController {
    @Autowired
    OrderService orderService;

    /**
     * 获取订单
     * */
    @RequestMapping( "/getOrder")
    @AutoLog("获取订单")
    public Result getOrder() {
        System.out.println("获取订单");
        return Result.ok().put("data",orderService.findAllOrder());
    }

    /**
     * 查询订单
     * */
    @RequestMapping( "/getOrderName/")
    @AutoLog("查询订单")
    public Result getOrderByName(Order order) {
        System.out.println("查询订单");
        return Result.ok().put("data",orderService.findOrderByName(order));
    }

    /**
     * 按照执行人查询订单
     **/
    @RequestMapping( "/getOrderUserName/{userName}")
    @AutoLog("查询订单")
    public Result getOrderUserName(@PathVariable String userName) {
        System.out.println("按照用户名查询");
        return Result.ok().put("data",orderService.findOrderByUserName(userName));
    }

    /**
     * 查询已完成订单
     * */
    @RequestMapping( "/getOrderYwc/{userName}")
    @AutoLog("查询已完成订单")
    public Result getOrderYwc(@PathVariable String userName) {
        System.out.println("查询已完成订单");
        return Result.ok().put("data",orderService.findOrderByYwc(userName));
    }

    /**
     * 查询未完成订单
     * */
    @RequestMapping( "/getOrderWwc/{userName}")
    @AutoLog("查询未完成订单")
    public Result getOrderWwc(@PathVariable String userName) {
        System.out.println("查询未完成订单");
        return Result.ok().put("data",orderService.findOrderByWwc(userName));
    }

    /**
     * 更新订单
     * */
    @RequestMapping( "/updateOrder")
    @ResponseBody
    @AutoLog("更新订单")
    public Result updateOrder(Order order){
        int result = orderService.updateOrder(order);
        if (result>0){
            return Result.ok("修改成功");
        }
        return Result.error("修改失败");
    }

    /**
     * 新增订单
     * */
    @RequestMapping( "/addOrder")
    @ResponseBody
    @AutoLog("新增订单")
    public Result addOrder( Order order) {
        int result = orderService.addOrder(order);
        if (result>0){
            System.out.println("添加成功");
            return Result.ok("添加成功");
        }
        System.out.println("添加失败");
        return Result.error("添加失败");
    }

    /**
     * 删除订单
     * */
    @RequestMapping( "/deleteOrderById/{id}")
    @AutoLog("删除订单")
    public Result deleteOrderById(@PathVariable int id) {
        int result = orderService.deleteOrderById(id);
        if(result>0){
            return Result.ok("删除成功");
        }
        return Result.error("删除失败");
    }

}
