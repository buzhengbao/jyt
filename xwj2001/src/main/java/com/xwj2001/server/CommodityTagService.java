package com.xwj2001.server;

import com.xwj2001.entity.CommodityTag;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CommodityTagService {
    public List<CommodityTag> findAllTag();

    public List<CommodityTag> findTag(CommodityTag tag);

    public int addTag(CommodityTag tag);

    public int updateTag(CommodityTag tag);

    public int deleteTagById(int id);
}
