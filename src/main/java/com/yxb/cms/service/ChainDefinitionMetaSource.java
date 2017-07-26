package com.yxb.cms.service;

import com.yxb.cms.domain.vo.Resource;
import org.apache.shiro.config.Ini;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.FactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @author yangxiaobing@ule.com
 * @date 2017/7/26 17:57
 */

@Component
public class ChainDefinitionMetaSource implements FactoryBean<Ini.Section> {

    private String filterChainDefinitions = "/ = authc\n"
            + "/loginCheck = anon\n"
            + "/loginProxy = anon\n"
            + "/fristchangePwd = anon\n"
            + "/login = anon\n"
            + "/timeout = anon\n"
            + "/service/** = anon\n"
            + "/resources/** = anon";

    @Autowired
    ResourceService resourceService;

    public Ini.Section getObject() throws BeansException {
        System.out.println("--------------------ChainDefinitionMetaSource");
        Ini ini = new Ini();
        // 加载默认的url
        ini.load(filterChainDefinitions);
        Ini.Section section = ini.addSection(Ini.DEFAULT_SECTION_NAME);

        // 防盗链处理
        Resource resource = resourceService.selectByPrimaryKey(2);
        section.put(resource.getResLinkAddress(), "perms[" + resource.getResModelCode() + "]");


        section.put("/**", "authc");

        return section;
    }

    @Override
    public Class<?> getObjectType() {
        return this.getClass();
    }

    @Override
    public boolean isSingleton() {
        return false;
    }


}
