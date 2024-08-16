package com.xwj2001.server.impl;

import com.xwj2001.mapper.CommodityStyleMapper;
import com.xwj2001.entity.CommodityStyle;
import com.xwj2001.server.CommodityStyleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
/**
 * @author 79837
 */
public class CommodityStyleImpl implements CommodityStyleService {
    @Autowired
    CommodityStyleMapper commodityStyleMapper;

    @Override
    public List<CommodityStyle> findAllStyle() {
        return commodityStyleMapper.findAllStyle();
    }

    @Override
    public List<CommodityStyle> findStyle(CommodityStyle style) {
        return commodityStyleMapper.findStyle(style);
    }

    @Override
    public int addStyle(CommodityStyle style) {
        return commodityStyleMapper.addStyle(style);
    }

    @Override
    public int updateStyle(CommodityStyle style) {
        return commodityStyleMapper.updateStyle(style);
    }

    @Override
    public int deleteStyleById(int id) {
        return commodityStyleMapper.deleteStyleById(id);
    }
}
