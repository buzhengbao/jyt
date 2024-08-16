package com.xwj2001.server.impl;

import com.xwj2001.mapper.HomeMapper;
import com.xwj2001.entity.Home;
import com.xwj2001.server.HomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
/**
 * @author 79837
 */
public class HomeImpl implements HomeService {
    @Autowired
    HomeMapper homeMapper;

    @Override
    public List<Home> cCount() {
        return homeMapper.cCount();
    }
    @Override
    public List<Home> ctyCount() {
        return homeMapper.ctyCount();
    }
    @Override
    public List<Home> csCount() {
        return homeMapper.csCount();
    }
    @Override
    public List<Home> aCount() {
        return homeMapper.aCount();
    }
    @Override
    public List<Home> uCount() {
        return homeMapper.uCount();
    }
    @Override
    public List<Home> ctCount() {
        return homeMapper.ctCount();
    }
    @Override
    public List<Home> typeTotal() {
        return homeMapper.typeTotal();
    }
    @Override
    public List<Home> styleTotal() {
        return homeMapper.styleTotal();
    }
    @Override
    public List<Home> tagTotal() {
        return homeMapper.tagTotal();
    }
    
}
