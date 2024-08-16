package com.xwj2001.mapper;

import com.xwj2001.entity.CommodityImg;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author 79837
 */
@Repository
@Mapper
public interface CommodityImgMapper {
    public List<CommodityImg> findAllImg();

    public List<CommodityImg> findImg(CommodityImg img);

    public int addImg(CommodityImg img);

    public int updateImg(CommodityImg img);

    public int deleteImgById(int id);

}
