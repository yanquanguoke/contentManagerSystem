package com.yxb.cms.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

/**
 * Controller 父类
 * @author yangxiaobing
 * @date 2017/7/17
 *
 */
@Controller
@Scope("prototype")
public class BasicController {

    protected Log log = LogFactory.getLog(getClass());

}
