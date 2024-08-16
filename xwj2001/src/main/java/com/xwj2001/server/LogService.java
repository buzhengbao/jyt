package com.xwj2001.server;

import com.xwj2001.entity.Log;
import com.xwj2001.entity.Order;
import com.xwj2001.entity.User;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 79837
 */
@Service
public interface LogService {
    List<Log> findAllLog();
    public int addLog(Log log);
    public int deleteLogById(int id);
}
