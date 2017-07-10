package com.yxb.cms.architect.realm;

import com.yxb.cms.domain.vo.User;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

/**
 *
 * 自定义Realm 实现Shiro权限验证
 *
 * @author yangxiaobing
 * @date 2017/7/10
 */

public class ShiroDbRealm extends AuthorizingRealm{

    private Log log = LogFactory.getLog(ShiroDbRealm.class);

    /**
     * 获取认证信息
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        log.info("认证用户登陆信息开始>>>>");
        UsernamePasswordToken userToken = (UsernamePasswordToken) token;
        String username = userToken.getUsername();
        if(StringUtils.isEmpty(username)){
            log.error("获取认证信息失败，原因:用户名为空");
            throw new AccountException("用户名为空");
        }
        User user = new User();
        user.setUserName("admin");
        user.setUserPassword("123456");
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(user,user.getUserPassword(),getName());

        return info;
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
