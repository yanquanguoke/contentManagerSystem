/**
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS HEADER.
 *
 * Copyright 2017 © yangxiaobing, 873559947@qq.com
 *
 * This file is part of contentManagerSystem.
 * contentManagerSystem is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * contentManagerSystem is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with contentManagerSystem.  If not, see <http://www.gnu.org/licenses/>.
 *
 * 这个文件是contentManagerSystem的一部分。
 * 您可以单独使用或分发这个文件，但请不要移除这个头部声明信息.
 * contentManagerSystem是一个自由软件，您可以自由分发、修改其中的源代码或者重新发布它，
 * 新的任何修改后的重新发布版必须同样在遵守GPL3或更后续的版本协议下发布.
 * 关于GPL协议的细则请参考COPYING文件，
 * 您可以在contentManagerSystem的相关目录中获得GPL协议的副本，
 * 如果没有找到，请连接到 http://www.gnu.org/licenses/ 查看。
 *
 * - Author: yangxiaobing
 * - Contact: 873559947@qq.com
 * - License: GNU Lesser General Public License (GPL)
 * - source code availability: http://git.oschina.net/yangxiaobing_175/contentManagerSystem
 */
package com.yxb.cms.service;

import com.yxb.cms.architect.constant.BusinessConstants;
import com.yxb.cms.architect.constant.BussinessCode;
import com.yxb.cms.architect.utils.BussinessMsgUtil;
import com.yxb.cms.dao.RoleMapper;
import com.yxb.cms.dao.UserMapper;
import com.yxb.cms.dao.UserRoleMapper;
import com.yxb.cms.domain.bo.BussinessMsg;
import com.yxb.cms.domain.vo.Role;
import com.yxb.cms.domain.vo.User;
import com.yxb.cms.domain.vo.UserRole;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.nutz.json.Json;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 用户信息服务类
 * @author yangxiaobing
 * @date 2017/7/14
 */

@Service
public class UserService {

    private Log log = LogFactory.getLog(UserService.class);

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private RoleMapper roleMapper;
    @Autowired
    private UserRoleMapper userRoleMapper;
    /**
     * 根据用户Id查询用户信息
     * @param userLoginName 登陆用户名
     * @return
     */
    public User selectUserByloginName(String  userLoginName){
        return userMapper.selectUserByloginNameAndStatus(userLoginName, Long.valueOf(BusinessConstants.SYS_USER_STATUS_0.getCode()));
    }
    /**
     * 根据用户Id查询用户信息
     * @param userId 用户Id
     * @return
     */
    public User selectUserById(Integer userId){
        return userMapper.selectByPrimaryKey(userId);
    }

    /**
     * 用户信息分页显示
     * @param user 用户实体
     * @return
     */
    public String selectUserResultPageList(User user){

        List<User> userList = userMapper.selectUserListByPage(user);

        Long count = userMapper.selectCountUser(user);
        user.setTotalCount(count);

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("total",count);
        map.put("totalSize",user.getTotalSize());
        map.put("rows", userList);

        return Json.toJson(map);
    }


    /**
     * 保存用户信息
     * @param user 用户对象
     * @param loginName 当前登录用户
     * @return
     * @throws Exception
     */
    @Transactional
    public BussinessMsg saveOrUpdateUser(User user, String loginName) throws Exception{
        log.info("保存用户信息开始");
        long start = System.currentTimeMillis();
        try {
            //保存用户信息
            if (null == user.getUserId()) {
                user.setUserPassword("123456");
                user.setCreator(loginName);
                user.setCreateTime(new Date());
                userMapper.insertSelective(user);
            } else {
                //更新用户信息
                user.setModifier(loginName);
                user.setUpdateTime(new Date());
                userMapper.updateByPrimaryKeySelective(user);
            }
        } catch (Exception e) {
            log.error("保存用户信息方法内部错误",e);
            throw e;
        }finally {
            log.info("保存用户信息结束,用时" + (System.currentTimeMillis() - start) + "毫秒");
        }
        return BussinessMsgUtil.returnCodeMessage(BussinessCode.GLOBAL_SUCCESS);
    }


    /**
     * 根据用户Id查询用户角色信息
     * @param userId 用户id
     * @return
     */
    public User selectUserRolesByUserId(Integer userId){
        if(userId != null){
            User user = userMapper.selectByPrimaryKey(userId);
            StringBuilder sb = new StringBuilder();
            StringBuilder sb2 = new StringBuilder();
            //用户所对应的角色信息
            List<Role> roles = roleMapper.selectUserRolesByUserId(userId);
            if(null != roles && !roles.isEmpty()){
                for (Role role : roles) {
                    sb.append(role.getRoleId()).append(",");
                    sb2.append(role.getRoleName()).append(",");
                }
                if(sb.length()>0){
                    sb.deleteCharAt(sb.length()-1);
                    user.setRoleIds(sb.toString());
                }
                if(sb2.length()>0){
                    sb2.deleteCharAt(sb2.length()-1);
                    user.setRoleNames(sb2.toString());
                }

            }
            return user;

        }
        return null;
    }


    /**
     * 保存用户分配角色信息
     * @param userId 用户id
     * @param roleIds 分配的角色信息
     * @param longinName 当前登录用户名称
     * @return
     * @throws Exception
     */
    @Transactional
    public BussinessMsg saveUserRole(Integer userId,String roleIds,String longinName) throws Exception{
        log.info("保存用户分配角色信息开始");
        long start = System.currentTimeMillis();
        try {
            List<UserRole> userRoles = userRoleMapper.selectUserRolesListByUserId(userId);
            //如果角色Id不为空插入用户角色信息，否则删除用户下所有分配的角色
            if (StringUtils.isNotEmpty(roleIds)) {
                if (null != userRoles && !userRoles.isEmpty()) {
                    for (UserRole userRole : userRoles) {
                        userRoleMapper.deleteByPrimaryKey(userRole.getUserRoleId());
                    }
                }

                for (String roleId : roleIds.split(",")) {
                    UserRole ur = new UserRole();
                    ur.setUserId(userId);
                    ur.setRoleId(Integer.valueOf(roleId));
                    ur.setCreateTime(new Date());
                    ur.setCreator(longinName);
                    userRoleMapper.insertSelective(ur);
                }

            } else {
                if (null != userRoles && !userRoles.isEmpty()) {
                    for (UserRole userRole : userRoles) {
                        userRoleMapper.deleteByPrimaryKey(userRole.getUserRoleId());
                    }
                }
            }
        } catch (Exception e) {
            log.error("用户分配角色信息方法内部错误",e);
            throw e;
        }finally {
            log.info("保存用户分配角色信息结束,用时" + (System.currentTimeMillis() - start) + "毫秒");
        }
        return BussinessMsgUtil.returnCodeMessage(BussinessCode.GLOBAL_SUCCESS);
    }


}
