package com.yxb.cms.architect.conf;

import com.yxb.cms.architect.interceptor.CommonInterceptor;
import com.yxb.cms.architect.interceptor.ErrorInterceptor;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * WebMvc适配器<br>
 * 添加 listener、filter、interceptor
 * @author yangxiaobing
 * @date 2017/7/26.
 */
@Configuration
public class MyWebAppConfigurer extends WebMvcConfigurerAdapter {
    private Log log = LogFactory.getLog(MyWebAppConfigurer.class);

    /**
     * 拦截器添加
     * addPathPatterns 用于添加拦截规则
     * excludePathPatterns 用户排除拦截
     * @param registry
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        log.info(">>>>拦截器注册>>>");

        // 多个拦截器组成一个拦截器链依次加载

        //通用错误页面拦截器
        registry.addInterceptor(new CommonInterceptor()).addPathPatterns("/**");
        //通用错误页面拦截器
        registry.addInterceptor(new ErrorInterceptor()).addPathPatterns("/**");
        super.addInterceptors(registry);
    }
}
