package com.xwj2001.server;

import com.xwj2001.entity.CommodityImg;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 79837
 */
@Service
public interface CommodityImgService {
    public List<CommodityImg> findAllImg();

    public List<CommodityImg> findImg(CommodityImg img);

    public int addImg(CommodityImg img);

    public int updateImg(CommodityImg img);

    public int deleteImgById(int id);
}
