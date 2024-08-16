package com.xwj2001.common;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.config.annotation.PathMatchConfigurer;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Override
    public void configurePathMatch(PathMatchConfigurer pathMatchConfigurer){
        //指定controller统一的接口前缀
        pathMatchConfigurer.addPathPrefix("/api", clazz -> clazz.isAnnotationPresent(RestController.class));
    }
}
