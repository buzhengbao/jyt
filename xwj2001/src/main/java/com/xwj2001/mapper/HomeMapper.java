package com.xwj2001.mapper;

import com.xwj2001.entity.Home;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author 79837
 */
@Repository
@Mapper
public interface HomeMapper {
    public List<Home> cCount();
    public List<Home> ctyCount();
    public List<Home> csCount();
    public List<Home> aCount();
    public List<Home> uCount();
    public List<Home> ctCount();
    public List<Home> typeTotal();
    public List<Home> styleTotal();
    public List<Home> tagTotal();

}
