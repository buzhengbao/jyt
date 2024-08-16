package com.xwj2001.common;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.xwj2001.entity.User;
import com.xwj2001.server.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.Objects;

@Configuration
public class JwtTokenUtils {
    private static UserService stateUserService;
    private static final Logger log = LoggerFactory.getLogger(JwtTokenUtils.class);

    @Resource
    public UserService userService;

    @PostConstruct
    public void setUserService(){
        stateUserService = userService;
    }

    /**
     * 生成token
     * 将userId保存到token里面，作为载荷
     *  2个小时过期
     *  密码作为token
     * */
    public static String genToken(String userId, String userAccount){
//        System.out.println(userId);
        return JWT.create().withAudience(userId)
                .withExpiresAt(DateUtil.offsetHour(new Date(), 2))
                .sign(Algorithm.HMAC256(userAccount));
    }

    /**
     * 获取当前用户信息
     * */
    public static User getCurrentUser(){
        String token = null;
        try {
            HttpServletRequest request = ((ServletRequestAttributes) Objects.requireNonNull(RequestContextHolder.getRequestAttributes())).getRequest();
            token = request.getHeader("token");
            if(StrUtil.isBlank(token)){
                token = request.getParameter("token");
            }
            if(StrUtil.isBlank(token)){
                log.error("获取当前登录的token失败，token:{}", token);
                return null;
            }
            //解析token，获取用户的ID
            String userId = JWT.decode(token).getAudience().get(0);
//            System.out.println(userId);
            return stateUserService.findUserById(Integer.parseInt(userId));
        }catch (Exception e) {
            log.error("获取当前登录状态的管理员失败，token:{}", token, e);
            return null;
        }
    }

}

