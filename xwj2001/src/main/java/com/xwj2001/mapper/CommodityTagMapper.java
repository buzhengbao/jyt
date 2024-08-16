package com.xwj2001.mapper;

import com.xwj2001.entity.CommodityTag;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author 79837
 */
@Repository
@Mapper
public interface CommodityTagMapper {
    public List<CommodityTag> findAllTag();

    public List<CommodityTag> findTag(CommodityTag tag);

    public int addTag(CommodityTag tag);

    public int updateTag(CommodityTag tag);

    public int deleteTagById(int id);

}
