package com.yxb.cms.architect.realm;

import com.yxb.cms.domain.vo.User;
import com.yxb.cms.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

/**
 *
 * 自定义Realm 实现Shiro权限验证
 *
 * @author yangxiaobing
 * @date 2017/7/10
 */
@Component
public class ShiroDbRealm extends AuthorizingRealm{

    private Log log = LogFactory.getLog(ShiroDbRealm.class);

     @Autowired
     @Lazy
    private UserService userService;

    /**
     * 获取认证信息
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        UsernamePasswordToken userToken = (UsernamePasswordToken) token;
        String username = userToken.getUsername();
        if(StringUtils.isEmpty(username)){
            log.error("获取认证信息失败，原因:用户名为空");
            throw new AccountException("用户名为空");
        }
        // 根据登陆用户名查询用户信息
        User user = userService.selectUserByloginName(username);
        if(user == null){
            throw new AccountException("用户信息为空");
        }
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(user,user.getUserPassword(),getName());
        if(null != info){
            log.info("用户认证通过:登陆用户名:"+user.getUserLoginName());
            return info;
        }
        return null;
    }




    /**
     * 获取授权信息
     * @param principalCollection
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        return null;
    }
}
