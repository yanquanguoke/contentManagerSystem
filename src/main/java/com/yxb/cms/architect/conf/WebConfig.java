package com.yxb.cms.architect.conf;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.filter.DelegatingFilterProxy;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by YXB on 2017/7/26.
 */
@Configuration
public class WebConfig extends WebMvcConfigurerAdapter {
    @Bean
    public FilterRegistrationBean getDemoFilter(){
        //DemoFilter demoFilter=new DemoFilter();

        System.out.println("-----------------ddddddd");
        FilterRegistrationBean registrationBean = new FilterRegistrationBean();
        DelegatingFilterProxy httpBasicFilter = new DelegatingFilterProxy();
        registrationBean.setFilter(httpBasicFilter);
        Map<String,String> m = new HashMap<String,String>();
        m.put("targetBeanName","demoFilter");
        m.put("targetFilterLifecycle","true");
        registrationBean.setInitParameters(m);
        List<String> urlPatterns = new ArrayList<String>();
        urlPatterns.add("/*");
        registrationBean.setUrlPatterns(urlPatterns);
        return registrationBean;
    }

//    //    @Bean
//    public FilterRegistrationBean filterProxy(){
//        System.out.println("-----------------ddddddd");
//        FilterRegistrationBean registrationBean = new FilterRegistrationBean();
//        DelegatingFilterProxy httpBasicFilter = new DelegatingFilterProxy();
//        registrationBean.setFilter(httpBasicFilter);
//        Map<String,String> m = new HashMap<String,String>();
//        m.put("targetBeanName","shiroFilter");
//        m.put("targetFilterLifecycle","true");
//        registrationBean.setInitParameters(m);
//        List<String> urlPatterns = new ArrayList<String>();
//        urlPatterns.add("/*");
//        registrationBean.setUrlPatterns(urlPatterns);
//        return registrationBean;
//    }
}
