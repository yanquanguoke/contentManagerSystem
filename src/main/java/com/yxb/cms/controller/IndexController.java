package com.yxb.cms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * 主页Controller
 *
 * @author yangxiaobing
 * @date 2017/7/6
 */
@Controller
public class IndexController {


    /**
     * 跳转到登录页面
     *
     * @return
     */
    @RequestMapping("/login")
    public String toLoginPage() {
        return "login";
    }


    @RequestMapping("/main")
    public String toMainPage() {
        return "main";
    }
}
