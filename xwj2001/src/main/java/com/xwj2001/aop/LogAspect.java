package com.xwj2001.aop;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.ObjectUtil;
import com.xwj2001.common.JwtTokenUtils;
import com.xwj2001.common.Result;
import com.xwj2001.entity.Log;
import com.xwj2001.entity.User;
import com.xwj2001.server.LogService;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.logging.Logger;

/**
 * @author 79837
 */
@Component
@Aspect
public class LogAspect {

    @Resource
    private LogService logService;
//    private static final Logger log = (Logger) LoggerFactory.getLogger(LogAspect.class);

    @Around("@annotation(autoLog)")
    public Object doAround(ProceedingJoinPoint joinPoint, AutoLog autoLog) throws Throwable{

        //操作内容， 在注解中定义value(),在需要切入的接口上面去写上对应的操作内容
        String name = autoLog.value();
        //当前时间
        String time = DateUtil.now();
        //操作人
        String userName = "";
        User currentUser = JwtTokenUtils.getCurrentUser();
        if(ObjectUtil.isNotNull(currentUser)){
            userName = currentUser.getUserName();
        }else {
            userName = "微信端执行";
        }
        //操作人IP
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        String ip = request.getRemoteAddr();

        Result result = (Result) joinPoint.proceed();

        Log log = new Log(null, name, time, userName, ip);
        logService.addLog(log);

        return result;
    }
}
