package com.xwj2001.mapper;

import com.xwj2001.entity.CommodityTagList;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author 79837
 */
@Repository
@Mapper
public interface CommodityTagListMapper {
    public List<CommodityTagList> findAllTagList();

    public List<CommodityTagList> findTagList(CommodityTagList tagList);

    public int addTagList(CommodityTagList tagList);

    public int updateTagList(CommodityTagList tagList);

    public int deleteTagListById(int id);

}
