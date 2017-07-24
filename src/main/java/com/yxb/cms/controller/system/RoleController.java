package com.yxb.cms.controller.system;

import com.yxb.cms.architect.constant.BussinessCode;
import com.yxb.cms.architect.utils.BussinessMsgUtil;
import com.yxb.cms.controller.BasicController;
import com.yxb.cms.domain.bo.BussinessMsg;
import com.yxb.cms.domain.vo.Role;
import com.yxb.cms.domain.vo.User;
import com.yxb.cms.service.RoleService;
import com.yxb.cms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * 角色管理Controller
 *
 * @author yangxiaobing
 * @date 2017/7/6
 */
@Controller
@RequestMapping("role")
public class RoleController extends BasicController {


    @Autowired
    private RoleService roleService;


    /**
     *跳转到角色列表页面
     * @return
     */
    @RequestMapping("/role_list")
    public String toRoleListPage() {
        return "system/role_list";
    }
    /**
     * 加载角色列表List
     * @param role 角色实体
     * @return
     */
    @RequestMapping("/ajax_role_list")
    @ResponseBody
    public String ajaxRoleList(Role role){
        return roleService.selectRoleResultPageList(role);
    }

    /**
     * 跳转到角色新增页面
     * @return
     */
    @RequestMapping("/role_add")
    public String toRoleAddPage(Model model) {
        //新增页面标识
        model.addAttribute("pageFlag", "addPage");
        return "system/role_edit";
    }

    /**
     * 跳转到角色修改页面
     * @param userId 用户Id
     * @return
     */
    @RequestMapping("/role_update")
    public String roleUpdatePage(Model model,Integer roleId){
        Role role = roleService.selectRoleById(roleId);
        //修改页面标识
        model.addAttribute("pageFlag", "updatePage");
        model.addAttribute("role", role);
        return "system/role_edit";
    }

}
