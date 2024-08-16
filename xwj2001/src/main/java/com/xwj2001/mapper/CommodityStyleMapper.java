package com.xwj2001.mapper;

import com.xwj2001.entity.CommodityStyle;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author 79837
 */
@Repository
@Mapper
public interface CommodityStyleMapper {
    public List<CommodityStyle> findAllStyle();

    public List<CommodityStyle> findStyle(CommodityStyle style);

    public int addStyle(CommodityStyle style);

    public int updateStyle(CommodityStyle style);

    public int deleteStyleById(int id);

}
