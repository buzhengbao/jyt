package com.xwj2001.mapper;

import com.xwj2001.entity.WxHome;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author 79837
 */
@Repository
@Mapper
public interface WxHomeMapper {
    public List<WxHome> tag(WxHome wxHome);
    public List<WxHome> commodity(WxHome wxHome);
    public List<WxHome> img(WxHome wxHome);
    public List<WxHome> type(WxHome wxHome);
    public List<WxHome> typePriceUp(WxHome wxHome);
    public List<WxHome> typePriceDown(WxHome wxHome);
    public List<WxHome> typeWageUp(WxHome wxHome);
    public List<WxHome> typeWageDown(WxHome wxHome);
    public List<WxHome> typeTimeUp(WxHome wxHome);
    public List<WxHome> typeTimeDown(WxHome wxHome);

    public List<WxHome> style(WxHome wxHome);
    public List<WxHome> stylePriceUp(WxHome wxHome);
    public List<WxHome> stylePriceDown(WxHome wxHome);
    public List<WxHome> styleWageUp(WxHome wxHome);
    public List<WxHome> styleWageDown(WxHome wxHome);
    public List<WxHome> styleTimeUp(WxHome wxHome);
    public List<WxHome> styleTimeDown(WxHome wxHome);

    public List<WxHome> activity(WxHome wxHome);
    public List<WxHome> activityPriceUp(WxHome wxHome);
    public List<WxHome> activityPriceDown(WxHome wxHome);
    public List<WxHome> activityWageUp(WxHome wxHome);
    public List<WxHome> activityWageDown(WxHome wxHome);
    public List<WxHome> activityTimeUp(WxHome wxHome);
    public List<WxHome> activityTimeDown(WxHome wxHome);

}
