package com.yxb.cms.service;

import com.yxb.cms.architect.enums.BusinessConstants;
import com.yxb.cms.dao.UserMapper;
import com.yxb.cms.domain.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author yangxiaobing@ule.com
 * @date 2017/7/14 16:26
 */

@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    /**
     * 根据用户Id查询用户信息
     * @param userLoginName 登陆用户名
     * @return
     */
    public User selectUserByloginName(String  userLoginName){
        return userMapper.selectUserByloginNameAndStatus(userLoginName, Long.valueOf(BusinessConstants.SYS_USER_STATUS_0.getCode()));
    }
}
