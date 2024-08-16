package com.xwj2001.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Getter;
import lombok.Setter;

/**
 * @author 79837
 */
@Setter
@Getter
public class Order {
    @TableId
    private Integer orderId;
    private String orderNum;
    private Integer userId;
    private Integer commodityId;
    private String client;
    private String tel;
    private String userName;
    private String commodityName;
    private String commodityPrice;
    private Integer num;
    private Integer orderStateId;
    private String addTime;
    private String stateName;

}