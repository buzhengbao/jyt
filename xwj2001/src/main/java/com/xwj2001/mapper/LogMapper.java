package com.xwj2001.mapper;

import com.xwj2001.entity.Log;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author 79837
 */
@Repository
@Mapper
public interface LogMapper {
    List<Log> findAllLog();
    public int addLog(Log log);

    public int deleteLogById(int id);
}
