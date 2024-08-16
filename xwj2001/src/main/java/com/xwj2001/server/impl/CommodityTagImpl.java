package com.xwj2001.server.impl;

import com.xwj2001.mapper.CommodityTagMapper;
import com.xwj2001.entity.CommodityTag;
import com.xwj2001.server.CommodityTagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
/**
 * @author 79837
 */
public class CommodityTagImpl implements CommodityTagService {
    @Autowired
    CommodityTagMapper commodityTagMapper;

    @Override
    public List<CommodityTag> findAllTag() {
        return commodityTagMapper.findAllTag();
    }

    @Override
    public List<CommodityTag> findTag(CommodityTag tag) {
        return commodityTagMapper.findTag(tag);
    }

    @Override
    public int addTag(CommodityTag tag) {
        return commodityTagMapper.addTag(tag);
    }

    @Override
    public int updateTag(CommodityTag tag) {
        return commodityTagMapper.updateTag(tag);
    }

    @Override
    public int deleteTagById(int id) {
        return commodityTagMapper.deleteTagById(id);
    }
}
