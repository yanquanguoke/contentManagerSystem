package com.yxb.cms.architect.annotation;

import java.lang.annotation.*;

/**
 * 系统级别的Service层自定义注解，拦截Service  层异常
 * @author yangxiaobing
 * @date 2017/9/6
 *
 */
@Target({ElementType.PARAMETER, ElementType.METHOD})//作用于参数或方法上
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface SystemServiceLog {
    String description() default "";
}