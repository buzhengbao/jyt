package com.xwj2001.server.impl;

import com.xwj2001.mapper.CommodityTypeMapper;
import com.xwj2001.entity.CommodityType;
import com.xwj2001.server.CommodityTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
/**
 * @author 79837
 */
public class CommodityTypeImpl implements CommodityTypeService {
    @Autowired
    CommodityTypeMapper commodityTypeMapper;

    @Override
    public List<CommodityType> findAllType() {
        return commodityTypeMapper.findAllType();
    }

    @Override
    public List<CommodityType> findType(CommodityType type) {
        return commodityTypeMapper.findType(type);
    }

    @Override
    public int addType(CommodityType type) {
        return commodityTypeMapper.addType(type);
    }

    @Override
    public int updateType(CommodityType type) {
        return commodityTypeMapper.updateType(type);
    }

    @Override
    public int deleteTypeById(int id) {
        return commodityTypeMapper.deleteTypeById(id);
    }
}
