package com.xwj2001.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Getter;
import lombok.Setter;

/**
 * @author 79837
 */
@Setter
@Getter
public class Role {
    @TableId
    private Integer roleId;
    private String role;

}