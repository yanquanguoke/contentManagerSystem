package com.yxb.cms.test;

import com.yxb.cms.Application;
import com.yxb.cms.architect.properties.JdbcProperties;
import com.yxb.cms.architect.utils.HttpUtil;
import com.yxb.cms.service.ResourceService;
import com.yxb.cms.service.UserService;
import net.sf.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.HashMap;
import java.util.Map;

/**
 * Spring boot 测试
 * @author yangxiaobing
 * @date 2017/4/1 11:34
 */

@RunWith(SpringRunner.class)
@SpringBootTest(classes = Application.class)
public class AppTest {

    @Autowired
    private JdbcProperties jdbcProperties;

    @Autowired
    private UserService userService;

    @Autowired
    private ResourceService resourceService;
    @Test
    public void test() {}

    @Test
    public void test2() throws Exception{


        String url = "http://ip.taobao.com/service/getIpInfo.php";
        Map<String,Object> param = new HashMap<>();
        param.put("ip","192.168.1.1");
       String str =  HttpUtil.post(url,param);

        JSONObject obj = JSONObject.fromObject(str);
        JSONObject obj2 =  (JSONObject) obj.get("data");

      //String dd =  ClientIpUtil.decodeUnicode(obj2.get("country").toString());
        System.out.println(obj2.get("region")+" " +obj2.get("city")+" " +obj2.get("isp"));


    }





    


}
