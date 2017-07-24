package com.yxb.cms.service;

import com.yxb.cms.architect.constant.BusinessConstants;
import com.yxb.cms.architect.constant.BussinessCode;
import com.yxb.cms.architect.utils.BussinessMsgUtil;
import com.yxb.cms.dao.RoleMapper;
import com.yxb.cms.dao.UserMapper;
import com.yxb.cms.domain.bo.BussinessMsg;
import com.yxb.cms.domain.vo.Role;
import com.yxb.cms.domain.vo.User;
import org.nutz.json.Json;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.nutz.dao.util.Pojos.log;

/**
 * 角色信息服务类
 * @author yangxiaobing
 * @date 2017/7/14
 */

@Service
public class RoleService {

    @Autowired
    private RoleMapper roleMapper;


    /**
     * 根据角色Id查询角色信息
     * @param roleId 角色Id
     * @return
     */
    public Role selectRoleById(Integer roleId){
        return roleMapper.selectByPrimaryKey(roleId);
    }

    /**
     * 角色信息分页显示
     * @param role 角色实体
     * @return
     */
    public String selectRoleResultPageList(Role role){

        List<Role> roleList = roleMapper.selectRoleListByPage(role);
        Long count = roleMapper.selectCountRole(role);
        role.setTotalCount(count);

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("total",count);
        map.put("totalSize",role.getTotalSize());
        map.put("rows", roleList);

        return Json.toJson(map);
    }


}
