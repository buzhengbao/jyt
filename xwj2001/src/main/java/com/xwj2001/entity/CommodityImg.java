package com.xwj2001.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Getter;
import lombok.Setter;

/**
 * 商品图片表
 *
 * @author 79837
 */
@Getter
@Setter
public class CommodityImg {
    /**
     * 商品图片ID
     */
    @TableId
    private Integer commodityImgId;

    /**
     * 商品图片路径
     */
    private String commodityImgUrl;

    /**
     * 商品图片类型
     */
    private Integer commodityId;

    /**
     * 商品图片类型
     */
    private String commodityName;
}
