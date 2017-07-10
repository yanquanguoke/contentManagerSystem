package com.yxb.cms.controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import com.yxb.cms.architect.utils.BussinessCodeUtil;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * 主页Controller
 *
 * @author yangxiaobing
 * @date 2017/7/6
 */
@Controller
public class IndexController {

    private Log log = LogFactory.getLog(IndexController.class);
    /**
     * 跳转到登录页面
     *
     * @return
     */
    @RequestMapping("/login")
    public String toLoginPage() {
        return "login";
    }


    /**
     *  登录验证处理
     * @param username 用户名
     * @param password 密码
     * @return
     */
    @RequestMapping("/loginCheck")
    public String loginCheck(String username,String password,Model model){
        log.info("------"+username+"---"+password);
        String code = null;
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        token.setRememberMe(true);
        Subject currentUser = SecurityUtils.getSubject();
        try {
            currentUser.login(token);
            if (currentUser.isAuthenticated()) {
                log.info(">>>用户登录状态" + BussinessCodeUtil.GLOBAL_SUCCESS.getMsg());
                //request.getSession().setAttribute(Constants.SESSION_KEY_LOGIN_NAME,getCurrentUser());
                code = BussinessCodeUtil.GLOBAL_SUCCESS.getCode();
                return "redirect:/main";
            }
        }catch(IncorrectCredentialsException ice ){
            log.error(BussinessCodeUtil.GLOBAL_LOGIN_FAIL.getMsg());
            code = BussinessCodeUtil.GLOBAL_LOGIN_FAIL.getCode();
        } catch (Exception e) {
            log.error(BussinessCodeUtil.GLOBAL_LOGIN_ERROR.getMsg(),e);
            code = BussinessCodeUtil.GLOBAL_ERROR.getCode();
        }
        model.addAttribute("code",BussinessCodeUtil.getByCode(code).toJson());
        return "login";
    }

    @RequestMapping("/main")
    public String toMainPage() {
        return "main";
    }

    @RequestMapping("/home")
    public String toHomePage() {
        return "home";
    }

}
