package com.xwj2001.server.impl;

import com.xwj2001.mapper.WxHomeMapper;
import com.xwj2001.entity.WxHome;
import com.xwj2001.server.WxHomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 79837
 */
@Service
public class WxHomeImpl implements WxHomeService {
    @Autowired
    WxHomeMapper wxHomeMapper;


    @Override
    public List<WxHome> tag(WxHome wxHome) {
        return wxHomeMapper.tag(wxHome);
    }


    @Override
    public List<WxHome> commodity(WxHome wxHome) {
        return wxHomeMapper.commodity(wxHome);
    }

    @Override
    public List<WxHome> img(WxHome wxHome) {
        return wxHomeMapper.img(wxHome);
    }

    @Override
    public List<WxHome> type(WxHome wxHome) {
        return wxHomeMapper.type(wxHome);
    }

    @Override
    public List<WxHome> typePriceUp(WxHome wxHome) {
        return wxHomeMapper.typePriceUp(wxHome);
    }

    @Override
    public List<WxHome> typePriceDown(WxHome wxHome) {
        return wxHomeMapper.typePriceDown(wxHome);
    }

    @Override
    public List<WxHome> typeWageUp(WxHome wxHome) {
        return wxHomeMapper.typeWageUp(wxHome);
    }

    @Override
    public List<WxHome> typeWageDown(WxHome wxHome) {
        return wxHomeMapper.typeWageDown(wxHome);
    }

    @Override
    public List<WxHome> typeTimeUp(WxHome wxHome) {
        return wxHomeMapper.typeTimeUp(wxHome);
    }

    @Override
    public List<WxHome> typeTimeDown(WxHome wxHome) {
        return wxHomeMapper.typeTimeDown(wxHome);
    }

    @Override
    public List<WxHome> style(WxHome wxHome) {
        return wxHomeMapper.style(wxHome);
    }

    @Override
    public List<WxHome> stylePriceUp(WxHome wxHome) {
        return wxHomeMapper.stylePriceUp(wxHome);
    }

    @Override
    public List<WxHome> stylePriceDown(WxHome wxHome) {
        return wxHomeMapper.stylePriceDown(wxHome);
    }

    @Override
    public List<WxHome> styleWageUp(WxHome wxHome) {
        return wxHomeMapper.styleWageUp(wxHome);
    }

    @Override
    public List<WxHome> styleWageDown(WxHome wxHome) {
        return wxHomeMapper.styleWageDown(wxHome);
    }

    @Override
    public List<WxHome> styleTimeUp(WxHome wxHome) {
        return wxHomeMapper.styleTimeUp(wxHome);
    }

    @Override
    public List<WxHome> styleTimeDown(WxHome wxHome) {
        return wxHomeMapper.styleTimeDown(wxHome);
    }
    @Override
    public List<WxHome> activity(WxHome wxHome) {
        return wxHomeMapper.activity(wxHome);
    }

    @Override
    public List<WxHome> activityPriceUp(WxHome wxHome) {
        return wxHomeMapper.activityPriceUp(wxHome);
    }

    @Override
    public List<WxHome> activityPriceDown(WxHome wxHome) {
        return wxHomeMapper.activityPriceDown(wxHome);
    }

    @Override
    public List<WxHome> activityWageUp(WxHome wxHome) {
        return wxHomeMapper.activityWageUp(wxHome);
    }

    @Override
    public List<WxHome> activityWageDown(WxHome wxHome) {
        return wxHomeMapper.activityWageDown(wxHome);
    }

    @Override
    public List<WxHome> activityTimeUp(WxHome wxHome) {
        return wxHomeMapper.activityTimeUp(wxHome);
    }

    @Override
    public List<WxHome> activityTimeDown(WxHome wxHome) {
        return wxHomeMapper.activityTimeDown(wxHome);
    }
}
