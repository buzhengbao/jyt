package com.xwj2001.server.impl;

import com.xwj2001.mapper.CommodityImgMapper;
import com.xwj2001.entity.CommodityImg;
import com.xwj2001.server.CommodityImgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 79837
 */
@Service

public class CommodityImgImpl implements CommodityImgService {
    @Autowired
    CommodityImgMapper commodityImgMapper;

    @Override
    public List<CommodityImg> findAllImg() {
        return commodityImgMapper.findAllImg();
    }

    @Override
    public List<CommodityImg> findImg(CommodityImg img) {
        return commodityImgMapper.findImg(img);
    }

    @Override
    public int addImg(CommodityImg img) {
        return commodityImgMapper.addImg(img);
    }

    @Override
    public int updateImg(CommodityImg img) {
        return commodityImgMapper.updateImg(img);
    }

    @Override
    public int deleteImgById(int id) {
        return commodityImgMapper.deleteImgById(id);
    }
}
