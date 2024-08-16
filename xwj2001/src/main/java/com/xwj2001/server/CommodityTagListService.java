package com.xwj2001.server;

import com.xwj2001.entity.CommodityTagList;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 79837
 */
@Service
public interface CommodityTagListService {
    public List<CommodityTagList> findAllTagList();

    public List<CommodityTagList> findTagList(CommodityTagList tagList);

    public int addTagList(CommodityTagList tagList);

    public int updateTagList(CommodityTagList tagList);

    public int deleteTagListById(int id);
}
