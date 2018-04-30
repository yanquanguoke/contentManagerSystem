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
package com.yxb.cms.controller;

import com.yxb.cms.architect.annotation.SystemControllerLog;
import com.yxb.cms.architect.constant.Constants;
import com.yxb.cms.handler.RedisClient;
import com.yxb.cms.service.DataCleaningService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;


/**
 * 主页Controller
 *
 * @author yangxiaobing
 * @date 2017/7/6
 */
@Controller
@RequestMapping("main")
public class IndexController extends BasicController {

    @Autowired
    private DataCleaningService dataCleaningService;
    @Autowired
    private RedisClient redisClient;

    /**
     *跳转到主页
     * @return
     */
    @RequestMapping("/index.do")
    public String toIndexPage() {
        return "main/index";
    }

    /**
     * 跳转到欢迎页
     * @return
     */
    @RequestMapping("/home.do")
    public String toHomePage() {
        return "main/home";
    }

    /**
     * 跳转到权限不足页面
     * @return
     */
    @RequestMapping("/unauthorized.do")
    public String toUnauthorizedPage() {
        return "error/unauthorized";
    }

    /**
     * 网站访问量,图表展示
     * @return
     */
    @RequestMapping("/ajax_echarts_login_info.do")
    @ResponseBody
    public String  ajaxEchartsByLoginInfo() {

        String userPv = redisClient.get(Constants.REDIS_KEY_ECHARTS_USER_PV);
        if(StringUtils.isNotEmpty(userPv)){
            return userPv;
        }
        log.info("redis值为空，查询数据库，并重新set到redis");
        String dataUserPv = dataCleaningService.selectEchartsByLoginInfo();
        redisClient.set(Constants.REDIS_KEY_ECHARTS_USER_PV,dataUserPv);
        return dataUserPv;

    }


}
