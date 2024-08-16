package com.xwj2001.entity;

import lombok.Getter;
import lombok.Setter;

/**
 * @author 79837
 */
@Setter
@Getter
public class WxHome {
    private Integer commodityId;

    /**
     * 商品序号
     */
    private String commodityNum;

    /**
     * 商品名称
     */
    private String commodityName;

    /**
     * 商品封面路径
     */
    private String commodityUrl;

    /**
     * 商品价格
     */
    private Double commodityPrice;

    /**
     * 商品成色
     */
    private String commodityFinenessFineness;

    /**
     * 商品重量
     */
    private Double commodityWeight;

    /**
     * 商品库存
     */
    private String commodityInventory;

    /**
     * 商品标签ID
     */
    private String commodityTagId;

    /**
     * 商品工费
     */
    private Double commodityWage;

    /**
     * 商品添加时间
     */
    private String commodityAddTime;

    /**
     * 商品类型
     */
    private Integer commodityTypeId;

    /**
     * 商品款式
     */
    private Integer commodityStyleId;

    /**
     * 活动ID
     */
    private Integer commodityActivityId;

    /**
     * 活动名称
     */
    private String activityName;

    /**
     * 商品款式名
     */
    private String commodityStyleName;

    /**
     * 商品标签名
     */
    private String commodityTagName;

    /**
     * 商品标签颜色
     */
    private String commodityTagColor;

    /**
     * 商品图片路径
     */
    private String commodityImgUrl;

    /**
     * 商品图片ID
     */
    private Integer commodityImgId;

    /**
     * 商品类型名
     */
    private String commodityTypeName;

    /**
     * 商品类型名
     */
    private Integer activityId;
}
