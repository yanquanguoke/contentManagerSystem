<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/comm/mytags.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>后台管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">

    <link rel="shortcut icon" href="${ctx}/static/img/favicon.ico">
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css">
    <link rel="stylesheet" href="${ctx}/static/css/main.css">

    <script src="${ctx}/static/layui/layui.js"></script>

</head>
<body class="childrenBody">
<blockquote class="layui-elem-quote">
    <p><span style="color:#1E9FFF;">项目简介：</span>
        contentManagerSystem,后台管理系统,采用SpringBoot构建整个项目框架,apacheShiro权限验证，mybatis+druid数据持久化动作
        前端框架采用layui<a class="layui-btn layui-btn-mini" target="_blank" href="http://www.layui.com">点此跳转</a>展示，
        整个项目全部通过注解方式进行配置,具体大家可以下载代码自行查看.
    </p>
    <p><span style="color:#1E9FFF;">友情提示：</span>
        由于此项目完全是在业余时间写的,部分功能和代码可能会有缺陷或者不足，但核心代码都已写完，大家可以下载下来在此基础上继续扩展，我也会一直维护，有问题我们可以一起交流.目前的版本代码刚写完只是测试版本，
        后续我会抽空继续，做一些封装和优化,敬请期待后续的版本.
    </p>
    <p><span style="color:#1E9FFF;">关于作者:</span>
        本人魔都纯后端Java程序员,前端技术确实比较弱，无意间看到layui社区的模板确实比较好看，但大多数都是静态的,于是就想做一套前后端交互的完整一点的项目，供大家一起交流和学习。
        <span style="color:#f00;">郑重声明：</span>
        本项目前端框架，借鉴layui社区,此模板 <a class="layui-btn layui-btn-mini" target="_blank" href="http://demo.larrycms.com/backstage/">点此跳转</a>，部分布局风格，如果有任何问题，
        请原作者联系我:联系方式  <span style="color:#f00;">QQ:873559947 微信:yxb873559947</span>

    </p>
</blockquote>
<div class="row">
    <div class="sysNotice col">
        <blockquote class="layui-elem-quote title">项目信息</blockquote>
        <table class="layui-table">
            <colgroup>
                <col width="150">
                <col>
            </colgroup>
            <tbody>
            <tr>
                <td>系统名称:</td>
                <td class="version">contentManagerSystem(CMS)后台管理系统</td>
            </tr>
            <tr>
                <td>版本信息:</td>
                <td class="author">beta-1.0.0</td>
            </tr>
            <tr>
                <td>开发作者</td>
                <td class="homePage">yangxiaobing</td>
            </tr>
            <tr>
                <td>项目下载：</td>
                <td class="homePage"><a class="layui-btn layui-btn-mini layui-btn-danger" target="_blank" href="http://fly.layui.com/case/u/5849928">我要点赞</a></td>
            </tr>
            <tr>
                <td>官网地址</td>
                <td class="server"><a href="http://www.yangxiaobing.org" class="official" target="_blank">http://www.yangxiaobing.org</a>
                </td>
            </tr>
            <tr>
                <td>服务器环境</td>
                <td class="dataBase">centos 7</td>
            </tr>
            <tr>
                <td>当前用户权限</td>
                <td class="userRights">超级管理员</td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="sysNotice col">
        <blockquote class="layui-elem-quote title">License</blockquote>
        <div class="layui-elem-quote layui-quote-nm">
            <p><span style="color:#f00;">郑重提示：</span></p>
            <p>&nbsp;&nbsp;&nbsp;contentManagerSystem是一个自由软件，您可以自由分发、修改其中的源代码或者重新发布它，
                新的任何修改后的重新发布版必须同样在遵守GPL3或更后续的版本协议下发布. 关于GPL协议的细则请参考COPYING文件，
                您可以在contentManagerSystem的相关目录中获得GPL协议的副本， 如果没有找到，请连接到 http://www.gnu.org/licenses/ 查看.
            </p>

            <p><span style="color:#1E9FFF;">源码地址：</span>
                <a class="layui-btn layui-btn-mini" target="_blank"
                   href="http://git.oschina.net/yangxiaobing_175/contentManagerSystem">点此跳转</a>
            </p>

        </div>
    </div>

</div>
<div class="row">
    <div class="sysNotice col">
        <blockquote class="layui-elem-quote title">更新日志</blockquote>
        <div class="layui-elem-quote layui-quote-nm">
            <h3># beta-1.0.0 (测试版) - 2017-07-31</h3>
            <p>*SpringBoot项目构建</p>
            <p>*加入 mybatis+druid数据持久化功能</p>
            <p>*加入apacheShiro权限验证</p>
            <p>*新增用户管理、角色管理、菜单管理等部分功能实现.</p>
            <p>*页面列表基于后台数据库交互实现table列表展示-分页、form表单提交.</p>
            <p>*动态菜单导航,选项卡功能、弹层实现编辑保存功能</p>

        </div>
    </div>
    <div class="sysNotice col">
        <blockquote class="layui-elem-quote title">系统公告</blockquote>
        <div class="layui-elem-quote layui-quote-nm">
            <h3>#此项目目前部分功能还在进一步完善中，如果出现不能点击或者点击无效的情况，皆属于正常现象，请大家期待后续的版本。</h3>
        </div>
    </div>
</div>
</body>
</html>