package com.xwj2001.server;

import com.xwj2001.entity.Activity;
import com.xwj2001.entity.Home;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface HomeService {

    List<Home> cCount();
    List<Home> ctyCount();
    List<Home> csCount();
    List<Home> aCount();
    List<Home> uCount();
    List<Home> ctCount();
    List<Home> typeTotal();
    List<Home> styleTotal();
    List<Home> tagTotal();
}
