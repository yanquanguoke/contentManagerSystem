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

    <script type="text/javascript" src="${ctx}/static/js/nav.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/leftNav.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/index.js"></script>

</head>
<body class="main_body">
    <div class="layui-layout layui-layout-admin">
        <!-- 顶部-->
        <div class="layui-header header">
        </div>
        <!-- 左侧导航-->
        <div class="layui-side layui-bg-black">
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
                        <iframe src="page/main.html"></iframe>
                    </div>
                </div>
            </div>
        </div>
        <!-- 底部-->
        <div class="layui-footer footer">
            <p>copyright @2017 请叫我马哥　　<a onclick="donation()" class="layui-btn layui-btn-danger l·ayui-btn-small">捐赠作者</a></p>
        </div>
    </div>

</body>
</html>