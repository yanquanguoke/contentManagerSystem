package com.yxb.cms.service;


import com.yxb.cms.dao.ResourceMapper;
import com.yxb.cms.domain.vo.Resource;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.nutz.json.Json;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
