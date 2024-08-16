package com.xwj2001.server;

import com.xwj2001.entity.CommodityType;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CommodityTypeService {
    public List<CommodityType> findAllType();

    public List<CommodityType> findType(CommodityType type);

    public int addType(CommodityType type);

    public int updateType(CommodityType type);

    public int deleteTypeById(int id);
}
