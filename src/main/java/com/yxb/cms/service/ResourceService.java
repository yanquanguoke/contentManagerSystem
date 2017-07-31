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


import com.yxb.cms.dao.ResourceMapper;
import com.yxb.cms.domain.dto.ResourceChildrenMenuDto;
import com.yxb.cms.domain.dto.ResourceMenuDto;
import com.yxb.cms.domain.vo.Resource;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.nutz.json.Json;
import org.nutz.json.JsonFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 菜单资源服务类
 * @author yangxiaobing
 * @date 2017/7/14
 *
 */
@Service
public class ResourceService {
	
	private  Log log = LogFactory.getLog(ResourceService.class);
	@Autowired
	private ResourceMapper resourceMapper;

    /**
     * 资源信息分页显示
     * @param resource
     * @return
     */
    public String selectResourceResultPageList(Resource resource){

        List<Resource> resourceList = resourceMapper.selectResourceListByPage(resource);

        Long count = resourceMapper.selectCountResource(resource);
        resource.setTotalCount(count);

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("total",count);
        map.put("totalSize",resource.getTotalSize());
        map.put("rows", resourceList);

        return Json.toJson(map);
    }

    public  Resource selectByPrimaryKey(Integer resId){
        return resourceMapper.selectByPrimaryKey(resId);
    }


    /**
     * 顶部菜单展示封装
     * @return
     */
    public String selectResMenuTop(){

        List<ResourceMenuDto> parentResList =  resourceMapper.selectParentIdResList();
        if(null != parentResList && !parentResList.isEmpty()){
            return Json.toJson(parentResList, JsonFormat.full());
        }
        return null;

    }

    public  String selectResLevelListByParentid(Integer resParentid) {

        //二级菜单
        List<Resource> ResLevel2List =resourceMapper.selectResLevelListByParentid(resParentid);
        if(null != ResLevel2List && !ResLevel2List.isEmpty()){

            List<ResourceMenuDto> resourceMenu = new ArrayList<>();

            for (Resource resource2 : ResLevel2List) {
                ResourceMenuDto menuDto = new ResourceMenuDto();
                menuDto.setTitle(resource2.getResName());
                menuDto.setIcon(resource2.getResImage());
                menuDto.setHref(resource2.getResLinkAddress());

                //三级菜单
                List<Resource> ResLevel3List =resourceMapper.selectResLevelListByParentid(resource2.getResId());
                if(null != ResLevel3List && !ResLevel3List.isEmpty()) {
                    List<ResourceChildrenMenuDto> childrens = new ArrayList<>();
                    for (Resource resource3 : ResLevel3List) {

                        ResourceChildrenMenuDto children = new ResourceChildrenMenuDto();
                        children.setTitle(resource3.getResName());
                        children.setIcon(resource3.getResImage());
                        children.setHref(resource3.getResLinkAddress());
                        childrens.add(children);
                    }
                    menuDto.setChildren(childrens);
                }
                resourceMenu.add(menuDto);

            }
            return Json.toJson(resourceMenu, JsonFormat.full());

        }
        return null;
    }
}
