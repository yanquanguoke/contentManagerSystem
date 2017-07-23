package com.yxb.cms.controller.system;

import com.yxb.cms.architect.constant.BussinessCode;
import com.yxb.cms.architect.utils.BussinessMsgUtil;
import com.yxb.cms.controller.BasicController;
import com.yxb.cms.domain.bo.BussinessMsg;
import com.yxb.cms.domain.vo.User;
import com.yxb.cms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * 用户管理Controller
 *
 * @author yangxiaobing
 * @date 2017/7/6
 */
@Controller
@RequestMapping("user")
public class UserController extends BasicController {


    @Autowired
    private UserService userService;


    /**
     *跳转到用户列表页面
     * @return
     */
    @RequestMapping("/user_list")
    public String toUserListPage() {
        return "system/user_list";
    }
    /**
     * 加载用户列表List
     * @param user
     * @return
     */
    @RequestMapping("/ajax_user_list")
    @ResponseBody
    public String ajaxUserList(User user){
        return userService.selectUserResultPageList(user);
    }

    /**
     * 跳转到用户新增页面
     * @return
     */
    @RequestMapping("/user_add")
    public String toUserAddPage(Model model) {
        //新增页面标识
        model.addAttribute("pageFlag", "addPage");
        return "system/user_edit";
    }

    /**
     * 跳转到用户修改页面
     * @param userId 用户Id
     * @return
     */
    @RequestMapping("/user_update")
    public String userUpdatePage(Model model,Integer userId){
        User user = userService.selectUserById(userId);
        //修改页面标识
        model.addAttribute("pageFlag", "updatePage");
        model.addAttribute("user", user);
        return "system/user_edit";
    }

    /**
     * 保存用户信息
     * @param user 用户实体
     * @return
     */
    @RequestMapping("/ajax_save_user")
    @ResponseBody
    public BussinessMsg ajaxSaveUser(User user){
        try {
            return userService.saveOrUpdateUser(user, this.getCurrentLoginName());
        } catch (Exception e) {
            log.error("保存用户信息方法内部错误",e);
            return BussinessMsgUtil.returnCodeMessage(BussinessCode.USER_SAVE_ERROR);
        }
    }






}
