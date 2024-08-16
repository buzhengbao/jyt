package com.xwj2001.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Getter;
import lombok.Setter;

/**
 * @author 79837
 */
@Getter
@Setter
public class CommodityStyle {
    @TableId
    private Integer commodityStyleId;
    private String commodityStyleName;
    private String commodityStyleImgUrl;
    private String commodityStyleAddTime;
}
