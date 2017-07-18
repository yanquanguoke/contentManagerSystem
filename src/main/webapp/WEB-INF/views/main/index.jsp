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
    <link rel="stylesheet" href="${ctx}/static/css/global.css">

    <link rel="stylesheet" type="text/css" href="http://at.alicdn.com/t/font_9h680jcse4620529.css">
    <link rel="stylesheet" href="${ctx}/static/css/main.css">
    <link rel="stylesheet" href="${ctx}/static/css/backstage.css">

    <script src="${ctx}/static/layui/layui.js"></script>


    <%--<script type="text/javascript" src="${ctx}/static/js/nav.js"></script>--%>
    <%--<script type="text/javascript" src="${ctx}/static/js/leftNav.js"></script>--%>
    <%--<script type="text/javascript" src="${ctx}/static/js/indexBack.js"></script>--%>


</head>
<body class="main_body">
    <div class="layui-layout layui-layout-admin">
        <!-- 顶部-->
        <div class="layui-header header header-menu">
            <div class="layui-main">
                <a href="#" class="logo">CMS后台管理系统</a>
                <!-- 左侧导航收缩开关 -->
                <div class="side-menu-switch" id="toggle"><span class="switch" ara-hidden="true"></span></div>
                <!-- 顶级菜单 -->
                <div class="larry-top-menu posb">
                    <ul class="layui-nav clearfix" id="menu">
                        <li class="layui-nav-item layui-this" data-pid="0" "="">
                            <a><i class="larry-icon larry-xitongshezhi1" data-icon="larry-xitongshezhi1" aria-hidden="true"></i><cite>系统管理</cite></a>
                        </li>
                        <li style="" class="layui-nav-item" data-pid="35" "="">
                            <a><i class="larry-icon larry-neirongguanli" data-icon="larry-neirongguanli" aria-hidden="true"></i><cite>内容管理</cite></a>
                        </li>
                        <li style="" class="layui-nav-item" data-pid="40" "="">
                            <a><i class="larry-icon larry-weixingongzhongpingtai" data-icon="larry-weixingongzhongpingtai" aria-hidden="true"></i><cite>微信公众</cite></a>
                        </li>
                        <li style="" class="layui-nav-item" data-pid="46" "="">
                            <a><i class="larry-icon larry-ht_expand" data-icon="larry-ht_expand" aria-hidden="true"></i><cite>扩展模块</cite></a>
                        </li>
                            <span style="left: 205.5px; top: 65px; width: 0px; opacity: 0;" class="layui-nav-bar"></span></ul>
                </div>
                <!-- 右侧常用菜单导航 -->
                <div class="larry-right-menu posb">
                    <ul class="layui-nav clearfix">
                        <li style="" class="layui-nav-item">
                            <a class="onFullScreen" id="FullScreen"><i class="larry-icon larry-quanping"></i>全屏</a>
                        </li>
                        <li style="" class="layui-nav-item">
                            <a id="lock"><i class="larry-icon larry-diannao5"></i>锁屏</a>
                        </li>
                        <li style="" class="layui-nav-item">
                            <a id="clearCached"><i class="larry-icon larry-qingchuhuancun"></i>清除缓存</a>
                        </li>
                        <li style="" class="layui-nav-item">
                            <a id="larryTheme"><i class="larry-icon larry-theme1"></i>设置主题</a>
                        </li>
                        <li class="layui-nav-item kjfs">
                            <a class="kuaijiefangshi"><i class="larry-icon larry-kuaijie"></i><cite>快捷方式</cite><span class="layui-nav-more"></span></a>
                            <dl class="layui-nav-child">
                                <dd>
                                    <a href="http://www.larrycms.com/" target="_blank">网站主页</a>
                                </dd>
                                <dd>
                                    <a href="http://blog.larrycms.com/" target="_blank">我的博客</a>
                                </dd>
                            </dl>
                        </li>
                        <li class="layui-nav-item exit">
                            <a id="logout" onclick="logout();"><i class="larry-icon larry-exit"></i><cite>退出</cite></a>
                        </li>
                        <span style="left: 176.2px; top: 65px; width: 0px; opacity: 0;" class="layui-nav-bar"></span></ul>
                </div>
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
        <div class="layui-body layui-form" id="larry-body">
            <div class="layui-tab marg0" lay-filter="bodyTab">

                <div class="larry-title-box">
                    <div class="go-left key-press pressKey" id="titleLeft" title="滚动至最右侧"><i class="larry-icon larry-weibiaoti6-copy"></i> </div>
                    <ul class="layui-tab-title top_tab">
                        <li class="layui-this" lay-id=""><i class="iconfont icon-computer "></i> <cite>后台首页</cite></li>
                    </ul>
                    <div class="title-right" id="titleRbox">
                        <div class="go-right key-press pressKey" id="titleRight" title="滚动至最左侧"><i class="larry-icon larry-right"></i></div>
                        <div class="refresh key-press" id="refresh_iframe"><i class="larry-icon larry-shuaxin2"></i><cite>刷新</cite></div>
                        <div class="often key-press" lay-filter="larryOperate" id="buttonRCtrl">
                            <ul class="layui-nav posr">
                                <li class="layui-nav-item posb">
                                    <a class="top"><i class="larry-icon larry-caozuo"></i><cite>常用操作</cite><span class="layui-nav-more"></span></a>
                                    <dl class="layui-nav-child">
                                        <dd>
                                            <a data-ename="closeCurrent"><i class="larry-icon larry-guanbidangqianye"></i>关闭当前选项卡</a>
                                        </dd>
                                        <dd>
                                            <a data-ename="closeOther"><i class="larry-icon larry-guanbiqita"></i>关闭其他选项卡</a>
                                        </dd>
                                        <dd>
                                            <a data-ename="closeAll"><i class="larry-icon larry-guanbiquanbufenzu"></i>关闭全部选项卡</a>
                                        </dd>
                                        <dd>
                                            <a data-ename="refreshAdmin"><i class="larry-icon larry-kuangjia_daohang_shuaxin"></i>刷新最外层框架</a>
                                        </dd>
                                    </dl>
                                </li>
                                <span class="layui-nav-bar"></span></ul>
                        </div>

                    </div>
                </div>
                <div class="layui-tab-content clildFrame" style="height: 793px;">
                    <div class="layui-tab-item layui-show">
                        <iframe src=""></iframe>
                    </div>
                </div>
            </div>
        </div>
        <!-- 底部-->
        <div class="layui-footer footer layui-larry-foot">
            <div class="layui-main">
                <p>copyright @2017 技术支持：873559947@qq.com</p>
            </div>
        </div>
    </div>
</body>
</html>
<script>
    function logout() {
        layui.config({base: '/static/js/'});
        layui.use(['jquery', 'common'], function () {
            var $ = layui.jquery, common = layui.common;
            var url = '${ctx}/logout';
            common.logOut('退出登陆提示！', '你真的确定要退出系统吗？', url)

        });
    }
</script>