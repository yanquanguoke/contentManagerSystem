package com.yxb.cms.test;

import com.yxb.cms.Application;
import com.yxb.cms.handler.RedisClient;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * Spring boot 测试
 * @author yangxiaobing
 * @date 2017/4/1 11:34
 */

@RunWith(SpringRunner.class)
@SpringBootTest(classes = Application.class)
public class AppTest {


    @Autowired
    RedisClient redisClient;



    @Test
    public void test() {}

    @Test
    public void test2() {
        redisClient.del("user_pv_key");
        System.out.println(redisClient.get("user_pv_key"));





    }





    


}
