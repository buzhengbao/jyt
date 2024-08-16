package com.xwj2001.mapper;

import com.xwj2001.entity.Commodity;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author 79837
 */
@Repository
@Mapper
public interface CommodityMapper {
    public List<Commodity> findAllCommodity();

    public List<Commodity> findCommodity(Commodity commodity);

    public int addCommodity(Commodity commodity);

    public int updateCommodity(Commodity commodity);

    public int deleteCommodityById(int id);

}
