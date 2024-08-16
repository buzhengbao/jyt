package com.xwj2001.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Getter;
import lombok.Setter;

/**
 * @author 79837
 */
@Getter
@Setter
public class ActivityList {
    @TableId
    private Integer activityListId;
    private Integer activityId;
    private Integer commodityId;
}
