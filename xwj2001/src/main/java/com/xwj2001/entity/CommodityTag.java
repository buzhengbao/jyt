package com.xwj2001.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Getter;
import lombok.Setter;

/**
 * 商品标签表
 *
 * @author 79837
 */
@Getter
@Setter
public class CommodityTag {
    /**
     * 商品标签ID
     */
    @TableId
    private Integer commodityTagId;

    /**
     * 商品标签名
     */
    private String commodityTagName;

    /**
     * 商品标签颜色
     */
    private String commodityTagColor;

}
