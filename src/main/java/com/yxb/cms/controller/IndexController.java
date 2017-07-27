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
@RequestMapping("main")
public class IndexController extends BasicController {


    /**
     *跳转到主页
     * @return
     */
    @RequestMapping("/index")
    public String toIndexPage() {
        return "main/index";
    }

    /**
     * 跳转到欢迎页
     * @return
     */
    @RequestMapping("/home")
    public String toHomePage() {
        return "main/home";
    }

    /**
     * 跳转到权限不足页面
     * @return
     */
    @RequestMapping("/unauthorized")
    public String toUnauthorizedPage() {
        return "error/unauthorized";
    }


}
