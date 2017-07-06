package com.yxb.cms.common.conf;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * @author yangxiaobing
 * @date 2017/7/6
 */

public class MyWebAppConfigurer extends WebMvcConfigurerAdapter {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/common/**").addResourceLocations("/common/");
        registry.addResourceHandler("/staitc/**").addResourceLocations("/staitc/");
        super.addResourceHandlers(registry);
    }
}
