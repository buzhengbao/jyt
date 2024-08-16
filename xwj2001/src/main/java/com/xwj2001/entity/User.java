package com.xwj2001.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Getter;
import lombok.Setter;

import java.beans.Transient;
import java.util.Date;

/**
 * @author 79837
 */
@Setter
@Getter
public class User {
    @TableId
    private Integer userId;
    private String userAccount;
    private String userName;
    private String userPassword;
    private String userRegister;
    private Integer userRoleId;
    private Integer userStateId;
    private String role;
    private String state;
    private String token;
}