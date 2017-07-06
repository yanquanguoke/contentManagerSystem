package com.yxb.cms;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

/**
 * Spring boot 主类入口测试
 *
 * @author yangxiaobing
 * @date 2017年4月5日
 */
@SpringBootApplication
public class Application extends SpringBootServletInitializer{
	
	@Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(Application.class);
    }


	
    public static void main(String[] args) throws Exception {
    	SpringApplication.run(Application.class, args);  
    }
}

