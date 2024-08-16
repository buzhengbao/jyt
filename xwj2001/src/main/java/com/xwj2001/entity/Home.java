package com.xwj2001.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Getter;
import lombok.Setter;

/**
 * @author 79837
 */
@Getter
@Setter
public class Home {
    private String cCount;
    private String ctyCount;
    private String csCount;
    private String aCount;
    private String uCount;
    private String ctCount;



    private Integer commodityTypeId;
    private String commodityTypeName;
    private Integer commodityCount;


    private String commodityStyleName;
    private String commodityTagName;
}
