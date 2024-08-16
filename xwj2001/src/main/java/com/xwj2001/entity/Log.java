package com.xwj2001.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;

/**
 * @author 79837
 */
@Getter
@Setter
public class Log {
    @TableId
    private Integer id;
    private String name;
    private String time;
    private String userName;
    private String ip;
    public Log(Integer id, String name, String time, String userName, String ip) {
        this.id = id;
        this.name = name;
        this.time = time;
        this.userName = userName;
        this.ip = ip;
    }
}
