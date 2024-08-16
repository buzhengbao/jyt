package com.xwj2001.mapper;

import com.xwj2001.entity.Activity;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author 79837
 */
@Repository
@Mapper
public interface ActivityMapper {
    public List<Activity> findAllActivity();

    public List<Activity> findActivityCount();

    public List<Activity> findActivity(Activity activity);

    public int addActivity(Activity activity);

    public int updateActivity(Activity activity);

    public int deleteActivityById(int id);

}
