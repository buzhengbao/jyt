package com.xwj2001.server;

import com.xwj2001.entity.Home;
import com.xwj2001.entity.WxHome;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface WxHomeService {

    List<WxHome> tag(WxHome wxHome);

    List<WxHome> type(WxHome wxHome);

    List<WxHome> commodity(WxHome wxHome);

    List<WxHome> img(WxHome wxHome);

    List<WxHome> typePriceUp(WxHome wxHome);

    List<WxHome> typePriceDown(WxHome wxHome);

    List<WxHome> typeWageUp(WxHome wxHome);

    List<WxHome> typeWageDown(WxHome wxHome);

    List<WxHome> typeTimeUp(WxHome wxHome);

    List<WxHome> typeTimeDown(WxHome wxHome);

    List<WxHome> style(WxHome wxHome);

    List<WxHome> stylePriceUp(WxHome wxHome);

    List<WxHome> stylePriceDown(WxHome wxHome);

    List<WxHome> styleWageUp(WxHome wxHome);

    List<WxHome> styleWageDown(WxHome wxHome);

    List<WxHome> styleTimeUp(WxHome wxHome);

    List<WxHome> styleTimeDown(WxHome wxHome);

    List<WxHome> activity(WxHome wxHome);

    List<WxHome> activityPriceUp(WxHome wxHome);

    List<WxHome> activityPriceDown(WxHome wxHome);

    List<WxHome> activityWageUp(WxHome wxHome);

    List<WxHome> activityWageDown(WxHome wxHome);

    List<WxHome> activityTimeUp(WxHome wxHome);

    List<WxHome> activityTimeDown(WxHome wxHome);
}
