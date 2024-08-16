package com.xwj2001.mapper;

import com.xwj2001.entity.CommodityType;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author 79837
 */
@Repository
@Mapper
public interface CommodityTypeMapper {
    public List<CommodityType> findAllType();

    public List<CommodityType> findType(CommodityType type);

    public int addType(CommodityType type);

    public int updateType(CommodityType type);

    public int deleteTypeById(int id);

}
