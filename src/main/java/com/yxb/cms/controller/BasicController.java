package com.yxb.cms.controller;

import com.yxb.cms.domain.vo.User;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

/**
 * Controller 父类
 * @author yangxiaobing
 * @date 2017/7/17
 *
 */
@Controller
@Scope("prototype")
public class BasicController {

    protected Log log = LogFactory.getLog(getClass());


    /**
     * 登录用户名
     */
    public String getCurrentLoginName() {
        Subject currentUser = SecurityUtils.getSubject();
        User user = currentUser.getPrincipals().oneByType(User.class);
        return user.getUserLoginName();
    }

}
