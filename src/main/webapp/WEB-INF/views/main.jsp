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
    <link rel="stylesheet" type="text/css" href="http://at.alicdn.com/t/font_9h680jcse4620529.css">
    <link rel="stylesheet" href="${ctx}/static/css/main.css">
    <link rel="stylesheet" href="${ctx}/static/css/backstage.css">

    <script src="${ctx}/static/layui/layui.js"></script>

    <%--<script type="text/javascript" src="${ctx}/static/js/nav.js"></script>--%>
    <%--<script type="text/javascript" src="${ctx}/static/js/leftNav.js"></script>--%>
    <%--<script type="text/javascript" src="${ctx}/static/js/index.js"></script>--%>

</head>
<body class="main_body">
    <div class="layui-layout layui-layout-admin">
        <!-- 顶部-->
        <div class="layui-header header header-menu">
            <div class="layui-main">
                <a href="#" class="logo">CMS后台管理系统</a>
                <!-- 左侧导航收缩开关 -->
                <div class="side-menu-switch posb" id="toggle"><span class="switch" ara-hidden="true"></span></div>
                <!-- 顶部右侧菜单 -->
                <ul class="layui-nav top_menu">
                    <li class="layui-nav-item showNotice" id="showNotice" pc>
                        <a href="javascript:;"><i class="iconfont icon-gonggao"></i><cite>系统公告</cite></a>
                    </li>
                    <li class="layui-nav-item lockcms" pc>
                        <a href="javascript:;"><i class="iconfont icon-lock1"></i><cite>锁屏</cite></a>
                    </li>
                    <li class="layui-nav-item" pc>
                        <a href="javascript:;">
                            <img src="${ctx}/static/img/face.jpg" class="layui-circle" width="35" height="35">
                            <cite>系统管理员</cite>
                        </a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:;" data-url=""><i class="iconfont icon-zhanghu" data-icon="icon-zhanghu"></i><cite>个人资料</cite></a></dd>
                            <dd><a href="javascript:;" data-url=""><i class="iconfont icon-shezhi1" data-icon="icon-shezhi1"></i><cite>修改密码</cite></a></dd>
                            <dd><a href="javascript:;"><i class="iconfont icon-loginout"></i><cite>退出</cite></a></dd>
                        </dl>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 左侧导航-->
        <div class="layui-side layui-bg-black">
            <div class="user-photo">
                <a class="img" title="我的头像" ><img src="${ctx}/static/img/face.jpg"></a>
                <p>你好！<span class="userName">系统管理员</span>, 欢迎登录</p>
            </div>
            <div class="navBar layui-side-scroll"></div>
        </div>
        <!--中间内容 -->
        <div class="layui-body layui-form">
            <div class="layui-tab marg0" lay-filter="bodyTab">
                <ul class="layui-tab-title top_tab">
                    <li class="layui-this" lay-id=""><i class="iconfont icon-computer"></i> <cite>后台首页</cite></li>
                </ul>
                <div class="layui-tab-content clildFrame">
                    <div class="layui-tab-item layui-show">
                        <iframe src="${ctx}/home"></iframe>
                    </div>
                </div>
            </div>
        </div>
        <!-- 底部-->
        <div class="layui-footer footer">
            <p>copyright @2017 技术支持：873559947@qq.com</p>
        </div>
    </div>
    <!-- 锁屏 -->
    <div class="admin-header-lock" id="lock-box" style="display: none;">
        <div class="admin-header-lock-img"><img src="${ctx}/static/img/face.jpg"/></div>
        <div class="admin-header-lock-name" id="lockUserName">系统管理员</div>
        <div class="input_btn">
            <input type="password" class="admin-header-lock-input layui-input" placeholder="请输入密码解锁.." name="lockPwd" id="lockPwd" />
            <button class="layui-btn" id="unlock">解锁</button>
        </div>
        <p>请输入“123456”，否则不会解锁成功哦！！！</p>
    </div>
</body>
</html>