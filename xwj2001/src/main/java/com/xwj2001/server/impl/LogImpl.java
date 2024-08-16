package com.xwj2001.server.impl;

import com.xwj2001.mapper.LogMapper;
import com.xwj2001.entity.Log;
import com.xwj2001.server.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
/**
 * @author 79837
 */
public class LogImpl implements LogService {
    @Autowired
    LogMapper logMapper;

    @Override
    public List<Log> findAllLog() {
        return logMapper.findAllLog();
    }

    @Override
    public int addLog(Log log) {
        return logMapper.addLog(log);
    }

    @Override
    public int deleteLogById(int id) {
        return logMapper.deleteLogById(id);
    }
}
