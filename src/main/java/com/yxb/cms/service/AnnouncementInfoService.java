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

import com.yxb.cms.dao.AnnouncementInfoMapper;
import com.yxb.cms.domain.vo.AnnouncementInfo;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.nutz.json.Json;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 站内公告信息服务
 *
 * @author yangxiaobing
 * @date 2017/9/1
 */

@Service
public class AnnouncementInfoService {

    private Log log = LogFactory.getLog(AnnouncementInfoService.class);


    @Autowired
    private AnnouncementInfoMapper announcementInfoMapper;


    /**
     * 公告信息分页显示
     *
     * @param annInfo 公告实体
     * @return
     */
    public String selectAnnInfoResultPageList(AnnouncementInfo annInfo) {

        List<AnnouncementInfo> annList = announcementInfoMapper.selectAnnouncementInfoListByPage(annInfo);
        Long count = announcementInfoMapper.selectCountAnnouncementInfo(annInfo);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", count);
        map.put("data", annList);

        return Json.toJson(map);
    }

    /**
     * 根据ID查询公告信息
     * @param announcementId  公共Id
     * @return
     */
    public AnnouncementInfo selectAnnouncementInfoById(Integer announcementId){
        return announcementInfoMapper.selectByPrimaryKey(announcementId);
    }


}
