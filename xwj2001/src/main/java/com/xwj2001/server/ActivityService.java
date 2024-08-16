package com.xwj2001.server;

import com.xwj2001.entity.Activity;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ActivityService {
    public List<Activity> findAllActivity();

    List<Activity> findActivityCount();

    public List<Activity> findActivity(Activity activity);

    public int addActivity(Activity activity);

    public int updateActivity(Activity activity);

    public int deleteActivityById(int id);
}
