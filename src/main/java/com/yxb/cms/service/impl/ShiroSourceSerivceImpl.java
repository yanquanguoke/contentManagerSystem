package com.yxb.cms.service.impl;

import com.yxb.cms.dao.ResourceMapper;
import com.yxb.cms.domain.vo.Resource;
import com.yxb.cms.service.ShiroSourceSerivce;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by YXB on 2017/7/26.
 */
@Service
public class ShiroSourceSerivceImpl implements ShiroSourceSerivce {

    @Autowired
    private ResourceMapper resourceMapper;


    @Override
    public Resource selectByPrimaryKey(Integer resId) {
        return resourceMapper.selectByPrimaryKey(resId);
    }
}
