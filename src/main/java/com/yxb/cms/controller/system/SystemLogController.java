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
package com.yxb.cms.controller.system;

import com.yxb.cms.architect.utils.CommonHelper;
import com.yxb.cms.architect.utils.DateUtil;
import com.yxb.cms.controller.BasicController;
import com.yxb.cms.domain.bo.ExcelExport;
import com.yxb.cms.domain.vo.SystemLog;
import com.yxb.cms.service.SystemLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;


/**
 * 日志管理Controller
 *
 * @author yangxiaobing
 * @date 2017/9/8
 */
@Controller
@RequestMapping("syslog")
public class SystemLogController extends BasicController {


    @Autowired
    private SystemLogService systemLogService;


    /**
     *跳转到日志管理页面
     * @return
     */
    @RequestMapping("/sys_log_list.do")
    public String toSysLogPage(Model model) {
        String currentDate = DateUtil.Date2Stirng(new Date());
        model.addAttribute("currentDate",currentDate);
        return "system/sys_log_list";
    }
    /**
     * 日志信息列表List
     * @param systemLog 日志实体
     * @return
     */
    @RequestMapping("/ajax_sys_log_list.do")
    @ResponseBody
    public String ajaxSysLogList(SystemLog systemLog){
        return systemLogService.selectSystemLogResultPageList(systemLog);
    }

    /**
     * 业务日志导出
     * @param systemLog 日志实体
     * @return
     */
    @RequestMapping("/excel_sys_log_export.do")
    public ModelAndView excelSysLogExport(SystemLog systemLog){
        ExcelExport excelExport = systemLogService.excelExportSystemLogList(systemLog);
        return CommonHelper.getExcelModelAndView(excelExport);
    }

    /**
     * 异常日志导出
     * @param systemLog 日志实体
     * @return
     */
    @RequestMapping("/excel_sys_exception_log_export.do")
    public ModelAndView excelSysExceptionLogExport(SystemLog systemLog){
        ExcelExport excelExport = systemLogService.excelExportSysExceptionLogList(systemLog);
        return CommonHelper.getExcelModelAndView(excelExport);
    }



}
