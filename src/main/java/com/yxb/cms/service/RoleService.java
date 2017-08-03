/**
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS HEADER.
 * <p>
 * Copyright 2017 © yangxiaobing, 873559947@qq.com
 * <p>
 * This file is part of contentManagerSystem.
 * contentManagerSystem is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * <p>
 * contentManagerSystem is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 * <p>
 * You should have received a copy of the GNU Lesser General Public License
 * along with contentManagerSystem.  If not, see <http://www.gnu.org/licenses/>.
 * <p>
 * 这个文件是contentManagerSystem的一部分。
 * 您可以单独使用或分发这个文件，但请不要移除这个头部声明信息.
 * contentManagerSystem是一个自由软件，您可以自由分发、修改其中的源代码或者重新发布它，
 * 新的任何修改后的重新发布版必须同样在遵守GPL3或更后续的版本协议下发布.
 * 关于GPL协议的细则请参考COPYING文件，
 * 您可以在contentManagerSystem的相关目录中获得GPL协议的副本，
 * 如果没有找到，请连接到 http://www.gnu.org/licenses/ 查看。
 * <p>
 * - Author: yangxiaobing
 * - Contact: 873559947@qq.com
 * - License: GNU Lesser General Public License (GPL)
 * - source code availability: http://git.oschina.net/yangxiaobing_175/contentManagerSystem
 */
package com.yxb.cms.service;

import com.yxb.cms.architect.constant.BussinessCode;
import com.yxb.cms.architect.utils.BussinessMsgUtil;
import com.yxb.cms.architect.utils.ParseObjectUtils;
import com.yxb.cms.dao.RoleMapper;
import com.yxb.cms.domain.bo.BussinessMsg;
import com.yxb.cms.domain.vo.Role;
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
 * 角色信息服务类
 *
 * @author yangxiaobing
 * @date 2017/7/14
 */

@Service
public class RoleService {

    private Log log = LogFactory.getLog(RoleService.class);


    @Autowired
    private RoleMapper roleMapper;


    /**
     * 根据角色Id查询角色信息
     *
     * @param roleId 角色Id
     * @return
     */
    public Role selectRoleById(Integer roleId) {
        return roleMapper.selectByPrimaryKey(roleId);
    }

    /**
     * 角色信息分页显示
     *
     * @param role 角色实体
     * @return
     */
    public String selectRoleResultPageList(Role role) {

        List<Role> roleList = roleMapper.selectRoleListByPage(role);
        Long count = roleMapper.selectCountRole(role);
        role.setTotalCount(count);

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("total", count);
        map.put("totalSize", role.getTotalSize());
        map.put("rows", roleList);

        return Json.toJson(map);
    }


    /**
     * 保存角色信息
     *
     * @param role      角色对象
     * @param loginName 当前登录用户
     * @return
     * @throws Exception
     */
    @Transactional
    public BussinessMsg saveOrUpdateRole(Role role, String loginName) throws Exception {
        log.info("保存用户角色开始");
        long start = System.currentTimeMillis();
        try {
            //保存角色信息
            if (null == role.getRoleId()) {
                role.setCreator(loginName);
                role.setCreateTime(new Date());
                roleMapper.insertSelective(role);
            } else {
                //更新角色
                role.setModifier(loginName);
                role.setModifierTime(new Date());
                roleMapper.updateByPrimaryKeySelective(role);
            }
        } catch (Exception e) {
            log.error("保存角色方法内部错误", e);
            throw e;
        } finally {
            log.info("保存角色信息结束,用时" + (System.currentTimeMillis() - start) + "毫秒");
        }
        return BussinessMsgUtil.returnCodeMessage(BussinessCode.GLOBAL_SUCCESS);
    }



    /**
     * 查询状态为有效,待分配的角色信息(用以用户分配角色时显示)
     * @param 已分配角色Id,以逗号分割
     */
    public String selectUserRoleByRoleIdList(String roleIds){
        Map<String, Object> map = new HashMap<String, Object>();
        //如果已给用户分配角色,则待分配用户显示栏中去除已分配的角色信息
        if(StringUtils.isNotEmpty(roleIds)){
            Integer[] roleIdInt = ParseObjectUtils.strArrayToIntArray(roleIds);
            List<Role> lists = roleMapper.selectUserRoleByRoleIdList(roleIdInt);
            map.put("rows", lists);
            return Json.toJson(map);
        }
        map.put("rows", roleMapper.selectRoleList());
        //没有给用户分配角色,待分配显示栏中显示所有角色信息
        return Json.toJson(map);
    }
    /**
     * 查询状态为有效,已分配的角色信息(用已用户分配角色显示)
     * @param roleIds 角色Id
     * @return
     */
    public String selectDeceasedUserRoleByRoleIdList(String roleIds){
        Map<String, Object> map = new HashMap<String, Object>();
        //没有给用户分配角色，则已分配角色列表为空
        if(StringUtils.isNotEmpty(roleIds)){
            Integer[] roleIdInt = ParseObjectUtils.strArrayToIntArray(roleIds);
            List<Role> lists = roleMapper.selectDeceasedUserRoleByRoleIdList(roleIdInt);
            map.put("rows", lists);
            return Json.toJson(map);
        }
        return null;
    }
}
