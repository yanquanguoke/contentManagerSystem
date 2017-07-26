package com.yxb.cms.architect.realm;


import com.yxb.cms.dao.ResourceMapper;
import com.yxb.cms.service.ResourceService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;


/**
 * 菜单资源服务类
 * @author yangxiaobing
 * @date 2017/7/14
 *
 */
@Component
public class ShiroService implements CommandLineRunner {

	private static  Log log = LogFactory.getLog(ShiroService.class);

    @Override
    public void run(String... args) throws Exception {
        System.out.println(">>>>>>>>>>>>>>>服务启动执行，执行加载数据等操作<<<<<<<<<<<<<");
    }

}
