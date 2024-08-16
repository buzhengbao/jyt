package com.xwj2001.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Getter;
import lombok.Setter;

/**
 * @author 79837
 */
@Getter
@Setter
public class Activity {
    @TableId
    private Integer activityId;
    private String activityName;
    private String activityImgUrl;
    private String activityBeginTime;
    private String activityEndTime;
    private String activityAddTime;
    private String count;
}
