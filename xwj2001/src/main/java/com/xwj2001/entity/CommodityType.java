package com.xwj2001.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Getter;
import lombok.Setter;

/**
 * @author 79837
 */
@Getter
@Setter
public class CommodityType {
    @TableId
    private Integer commodityTypeId;
    private String commodityTypeName;
    private String commodityTypeImgUrl;
    private String commodityTypeAddTime;

}
