package com.yxb.cms.architect.interceptor;

import com.yxb.cms.domain.bo.PermissionSubject;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *公共拦截器添加<br>
 *
 *1.使所有页面支持currentUser的el表达式调用<br>
 *2.清除缓存
 * @author yangxiaobing
 * @date 2017/7/27
 */
@Controller
public class CommonInterceptor implements HandlerInterceptor {
    private Log log = LogFactory.getLog(CommonInterceptor.class);


    /**
     * 在请求处理之前进行调用（Controller方法调用之前）当preHandle的返回值为false的时候整个请求结束
     */
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        return true; // 只有返回true才会继续向下执行，返回false取消当前请求;
    }

    /**
     * 请求处理之后进行调用，但是在视图被渲染之前（Controller方法调用之后）
     */
    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse response, Object o, ModelAndView model) throws Exception {
        // 如果view是MappingJacksonJsonView，则model中不添加currentUser；
        // 因为JACKSON会转换model中的数据为JSON，这两个对象没有JACKSON注解，无法转换
        if (model != null && !(model.getView() instanceof MappingJackson2JsonView)) {

            model.addObject("currentUser", new PermissionSubject(SecurityUtils.getSubject()));

        }


        //清除缓存
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        response.setHeader("Expires", "0"); // Proxies.


    }
    /**
     * 请求完成之后，也就是DispatcherServlet渲染了视图执行，主要作用是用于清理资源
     */
    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
