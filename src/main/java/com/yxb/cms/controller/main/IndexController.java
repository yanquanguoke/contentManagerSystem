package com.yxb.cms.controller.main;

import com.yxb.cms.controller.BasicController;
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
        return "mian/home";
    }

}
