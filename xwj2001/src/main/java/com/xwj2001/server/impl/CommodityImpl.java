package com.xwj2001.server.impl;

import com.xwj2001.mapper.CommodityMapper;
import com.xwj2001.entity.Commodity;
import com.xwj2001.server.CommodityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
/**
 * @author 79837
 */
public class CommodityImpl implements CommodityService {
    @Autowired
    CommodityMapper commodityMapper;

    @Override
    public List<Commodity> findAllCommodity() {
        return commodityMapper.findAllCommodity();
    }

    @Override
    public List<Commodity> findCommodity(Commodity commodity) {
        return commodityMapper.findCommodity(commodity);
    }

    @Override
    public int addCommodity(Commodity commodity) {
        return commodityMapper.addCommodity(commodity);
    }

    @Override
    public int updateCommodity(Commodity commodity) {
        return commodityMapper.updateCommodity(commodity);
    }

    @Override
    public int deleteCommodityById(int id) {
        return commodityMapper.deleteCommodityById(id);
    }
}
