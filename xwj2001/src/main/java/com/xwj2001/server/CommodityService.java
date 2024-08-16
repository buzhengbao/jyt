package com.xwj2001.server;

import com.xwj2001.entity.Commodity;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CommodityService {
    public List<Commodity> findAllCommodity();

    public List<Commodity> findCommodity(Commodity commodity);

    public int addCommodity(Commodity commodity);

    public int updateCommodity(Commodity commodity);

    public int deleteCommodityById(int id);
}
