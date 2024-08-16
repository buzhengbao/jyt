package com.xwj2001.aop;
import java.lang.annotation.*;

/**
 * @author 79837
 */
//该注解只能声明在一个类的方法前
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface AutoLog {
    String value() default "";
}
