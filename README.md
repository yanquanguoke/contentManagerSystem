contentManagerSystem后台管理系统2.0
===============
简介
-----------------------------------
contentManagerSystem,后台管理系统,采用SpringBoot构建整个项目框架,apacheShiro权限验证，mybatis+druid数据持久化动作,前端采用layui(http://www.layui.com/)展示，整个项目全部通过注解方式进行配置,具体大家可以下载代码自行查看.

PS:由于此项目完全是在业余时间写的,部分功能和代码可能会有缺陷或者不足，但核心代码都已写完，大家可以下载下来在此基础上继续扩展，我也会一直维护，有问题我们可以一起交流.

功能说明
-----------------------------------

* 用户管理:简单实现用户新增，编辑，添加角色等功能.
* 角色管理:简单实现角色新增，编辑，角色赋权等功能
* 菜单管理:简单实现菜单新增，编辑等功能

 PS：后续会继续增加功能.
 


使用说明
-----------------------------------

* 导入项目根目录下:contentmanagersystem_db.sql文件到mysql数据库
* 导入项目到Eclipse或Idea.
* 修改数据库配置文件jdbc.properties中的账号密码.
* 配置maven命令:spring-boot:run启动项目,访问链接:http://localhost:8080/login.do
* redis配置请参考https://blog.csdn.net/jinwufeiyang/article/details/52156817

项目演示地址:
-----------------------------------
#### http://yangxiaobing.org
#### 账号:user_system/123456 用户管理员
#### 账号:user_readonly/123456 只读用户

License:
-----------------------------------
contentManagerSystem是一个自由软件，您可以自由分发、修改其中的源代码或者重新发布它，新的任何修改后的重新发布版必须同样在遵守GPL3或更后续的版本协议下发布.
关于GPL协议的细则请参考COPYING文件，您可以在contentManagerSystem的相关目录中获得GPL协议的副本，
如果没有找到，请连接到 http://www.gnu.org/licenses/ 查看。

平台目录结构说明
-----------------------------------
```
├─main
│  │
│  ├──conf---------------项目环境配置文件
│  │   ├─beta ------测试环境配置文件
│  │   ├─prd -------生产环境配置文件
│  │
│  ├──java
│  │   │
│  │   └─com.yxb.cms----------------项目主代码
│  │             │
│  │             ├─architect----------------项目装配目录
│  │             │    │
│  │             │    ├─conf----------------项目配置路径
│  │             │    │
│  │             │    ├─constant------------项目常量枚举路径
│  │             │    │
│  │             │    ├─filter--------------项目过滤器路径
│  │             │    │
│  │             │    ├─interceptor---------项目拦截器路径
│  │             │    │
│  │             │    ├─properties----------项目属性文件读取路径
│  │             │    │
│  │             │    ├─realm---------------自定义shiroRealm路径
│  │             │    │
│  │             │    ├─utils----------------项目帮助类路径
│  │             │
│  │             ├─controller----------------项目controller路径
│  │             │
│  │             ├─dao-----------------------项目dao层路径
│  │             │
│  │             ├─domain--------------------项目domain层路径
│  │             │
│  │             ├─service-------------------项目service层路径
│  │             │
│  │             └─Application ------springBoot 启动类
│  │
│  ├─resources----------------项目资源文件
│  │     │
│  │     ├─mapper----------------mybatis映射文件路径
│  │     │
│  │     ├─application.properties-----springBoot核心配置
│  │     │
│  │     ├─ehcache-shiro.xml----shiro缓存配置
│  │     │
│  │     ├─log4j.properties------log4j配置
│  │     │
│  │     ├─mybatis-config.xml-------mybatis配置
│  │
│  │
│  └─webapp----------------web页面和静态资源存放的目录
│      │
│      └─WEB-INF
│            │
│            ├─comm----------------静态资源公共目录
│            │
│            ├─static----------------静态资源目录
│            │
│            └─WEB-INF
│                │
│                ├─views----------------视图文件目录
│
│
```
项目截图演示
-----------------------------------
![](https://git.oschina.net/yangxiaobing_175/contentManagerSystem/raw/master/temp/1.png)
![](https://git.oschina.net/yangxiaobing_175/contentManagerSystem/raw/master/temp/2.png)
![](https://git.oschina.net/yangxiaobing_175/contentManagerSystem/raw/master/temp/3.png)
![](https://git.oschina.net/yangxiaobing_175/contentManagerSystem/raw/master/temp/4.png)
![](https://git.oschina.net/yangxiaobing_175/contentManagerSystem/raw/master/temp/5.png)
![](https://git.oschina.net/yangxiaobing_175/contentManagerSystem/raw/master/temp/6.png)
![](https://git.oschina.net/yangxiaobing_175/contentManagerSystem/raw/master/temp/7.png)