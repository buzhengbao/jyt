package com.xwj2001.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Getter;
import lombok.Setter;

/**
 * @author 79837
 */
@Getter
@Setter
public class CommodityTagList {
    @TableId
    private Integer commodityTagListId;
    private Integer commodityId;
    private Integer commodityTagId;

    /**
     * 商品名称
     */
    private String commodityName;

    /**
     * 商品标签名
     */
    private String commodityTagName;

    /**
     * 商品标签颜色
     */
    private String commodityTagColor;
}
