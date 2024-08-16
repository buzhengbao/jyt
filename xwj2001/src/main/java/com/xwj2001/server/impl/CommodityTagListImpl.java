package com.xwj2001.server.impl;

import com.xwj2001.mapper.CommodityTagListMapper;
import com.xwj2001.entity.CommodityTagList;
import com.xwj2001.server.CommodityTagListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 79837
 */
@Service

public class CommodityTagListImpl implements CommodityTagListService {
    @Autowired
    CommodityTagListMapper commodityTagListMapper;

    @Override
    public List<CommodityTagList> findAllTagList() {
        return commodityTagListMapper.findAllTagList();
    }

    @Override
    public List<CommodityTagList> findTagList(CommodityTagList tagList) {
        return commodityTagListMapper.findTagList(tagList);
    }

    @Override
    public int addTagList(CommodityTagList tagList) {
        return commodityTagListMapper.addTagList(tagList);
    }

    @Override
    public int updateTagList(CommodityTagList tagList) {
        return commodityTagListMapper.updateTagList(tagList);
    }

    @Override
    public int deleteTagListById(int id) {
        return commodityTagListMapper.deleteTagListById(id);
    }
}
