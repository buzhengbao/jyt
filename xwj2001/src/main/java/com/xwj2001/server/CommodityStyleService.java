package com.xwj2001.server;

import com.xwj2001.entity.CommodityStyle;
import com.xwj2001.entity.CommodityTag;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CommodityStyleService {
    public List<CommodityStyle> findAllStyle();

    public List<CommodityStyle> findStyle(CommodityStyle style);

    public int addStyle(CommodityStyle style);

    public int updateStyle(CommodityStyle style);

    public int deleteStyleById(int id);
}
