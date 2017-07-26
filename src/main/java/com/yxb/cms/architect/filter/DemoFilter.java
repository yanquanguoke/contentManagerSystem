package com.yxb.cms.architect.filter;

import com.yxb.cms.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.*;
import java.io.IOException;

/**
 * Created by YXB on 2017/7/26.
 */
//@Component
public class DemoFilter implements Filter {
    @Autowired
    ResourceService resourceService;
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        resourceService.selectByPrimaryKey(2);
        System.out.println("demoFilter初始化"+resourceService.selectByPrimaryKey(2).getResLinkAddress());
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

    }

    @Override
    public void destroy() {

    }
}
