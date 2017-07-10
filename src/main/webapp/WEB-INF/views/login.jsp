<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/comm/mytags.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>后台管理系统登陆</title>
    <link rel="shortcut icon" href="${ctx}/static/img/favicon.ico">
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css">
    <link rel="stylesheet" href="${ctx}/static/css/global.min.css">
    <link rel="stylesheet" href="${ctx}/static/css/login.css">
    <script  type="text/javascript" src="${ctx}/static/layui/layui.js"></script>
    <script  type="text/javascript" src="${ctx}/static/js/login.min.js"></script>
</head>
<body>
    <div id="login-wrap">
        <div class="logo">
            <p>CMS 后台管理系统2</p>
        </div>
        ${code}
        <form class="layui-form login-form" action="${ctx}/loginCheck" method="post" id="login-form">
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <input type="text" name="username"  lay-verify="required" placeholder="管理员账号" autocomplete="off" class="layui-input radius-5">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <input type="password" name="password"  lay-verify="required" placeholder="管理员密码" autocomplete="off" class="layui-input radius-5">
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block" style="text-align: center;">
                    <button class="layui-btn radius-5" lay-submit lay-filter="login">登陆系统</button>
                </div>
            </div>
        </form>
    </div>
</body>
</html>