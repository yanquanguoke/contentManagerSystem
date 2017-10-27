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

import com.yxb.cms.dao.SystemLogMapper;
import com.yxb.cms.domain.bo.ExcelExport;
import com.yxb.cms.domain.vo.SystemLog;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.nutz.json.Json;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 系统日志Servce
 *
 * @author yangxiaobing
 * @date 2017/9/6
 */

@Service
public class SystemLogService {

    private Logger log = LogManager.getLogger(SystemLogService.class);



    @Autowired
    private SystemLogMapper systemLogMapper;


    /**
     * 插入日志记录
     * @param systemLog 日志实体
     */
    @Transactional
    public void insertSelective(SystemLog systemLog){
        systemLogMapper.insertSelective(systemLog);
    }

    /**
     * 更新日志记录
     * @param systemLog 日志实体
     */
    @Transactional
    public void updateByPrimaryKeySelective(SystemLog systemLog){
        systemLogMapper.updateByPrimaryKeySelective(systemLog);
    }


    /**
     * 日志信息分页显示
     * @param systemLog 日志实体
     * @return
     */
    public String selectSystemLogResultPageList(SystemLog systemLog){

        List<SystemLog> systemLogList = systemLogMapper.selectSystemLogListByPage(systemLog);

        Long count = systemLogMapper.selectCountSystemLog(systemLog);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",count);
        map.put("data", systemLogList);

        return Json.toJson(map);
    }

    /**
     * 业务日志EXCEL导出
     * @param systemLog 日志实体
     * @return
     */
    public ExcelExport excelExportSystemLogList(SystemLog systemLog){
        ExcelExport excelExport = new ExcelExport();
        List<SystemLog> systemLogList = systemLogMapper.selectSystemLogList(systemLog);
        excelExport.addColumnInfo("日志标题","logTitle");
        excelExport.addColumnInfo("日志类型","logType_Lable");
        excelExport.addColumnInfo("日志请求URL","logUrl");
        excelExport.addColumnInfo("请求方式","logMethod");
        excelExport.addColumnInfo("请求参数","logParams");
        excelExport.addColumnInfo("请求用户","logUserName");
        excelExport.addColumnInfo("请求IP","logIp");
        excelExport.addColumnInfo("IP归属","logIpAddress");
        excelExport.addColumnInfo("请求时间","logStartTime_Lable");
        excelExport.addColumnInfo("耗时(毫秒)","logElapsedTime");


        excelExport.setDataList(systemLogList);
        return excelExport;
    }


    /**
     * 异常日志EXCEL导出
     * @param systemLog 日志实体
     * @return
     */
    public ExcelExport excelExportSysExceptionLogList(SystemLog systemLog){
        ExcelExport excelExport = new ExcelExport();
        List<SystemLog> systemLogList = systemLogMapper.selectSystemLogList(systemLog);
        excelExport.addColumnInfo("日志标题","logTitle");
        excelExport.addColumnInfo("日志类型","logType_Lable");
        excelExport.addColumnInfo("异常方法","logUrl");
        excelExport.addColumnInfo("请求参数","logParams");
        excelExport.addColumnInfo("异常信息","logException");
        excelExport.addColumnInfo("请求用户","logUserName");
        excelExport.addColumnInfo("请求IP","logIp");
        excelExport.addColumnInfo("IP归属","logIpAddress");
        excelExport.addColumnInfo("请求时间","logStartTime_Lable");
        excelExport.addColumnInfo("耗时(毫秒)","logElapsedTime");


        excelExport.setDataList(systemLogList);
        return excelExport;
    }


}
