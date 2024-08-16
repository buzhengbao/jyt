package com.xwj2001.server.impl;

import com.xwj2001.mapper.ActivityMapper;
import com.xwj2001.entity.Activity;
import com.xwj2001.server.ActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
/**
 * @author 79837
 */
public class ActivityImpl implements ActivityService {
    @Autowired
    ActivityMapper activityMapper;

    @Override
    public List<Activity> findAllActivity() {
        return activityMapper.findAllActivity();
    }

    @Override
    public List<Activity> findActivityCount() {
        return activityMapper.findActivityCount();
    }

    @Override
    public List<Activity> findActivity(Activity activity) {
        return activityMapper.findActivity(activity);
    }

    @Override
    public int addActivity(Activity activity) {
        return activityMapper.addActivity(activity);
    }

    @Override
    public int updateActivity(Activity activity) {
        return activityMapper.updateActivity(activity);
    }

    @Override
    public int deleteActivityById(int id) {
        return activityMapper.deleteActivityById(id);
    }
}
