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
    <link rel="stylesheet" href="${ctx}/static/css/login.css">
    <script  type="text/javascript" src="${ctx}/static/layui/layui.js"></script>
</head>
<body>
    <div id="login-wrap">
        <div class="logo">
            <p>CMS 后台管理系统</p>
        </div>
        <form class="layui-form login-form" action="${ctx}/main/index" method="post" id="login-form">
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <input type="text" name="username"  lay-verify="required" placeholder="请输入账号" autocomplete="off" value="admin" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <input type="password" name="password"  lay-verify="required" placeholder="请输入密码" autocomplete="off" value="123456" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block" style="text-align: center;">
                    <button class="layui-btn" lay-submit lay-filter="login">登陆系统</button>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
<script>
    layui.use('form',function () {
        var form = layui.form(),
                $ = layui.jquery;
        //监听提交
        form.on('submit(login)', function(data){
            //弹出loading
            var loginLoading = top.layer.msg('登陆中，请稍候',{icon: 16,time:false,shade:0.8});
            //记录ajax请求返回值
            var ajaxReturnData;

            //登陆验证
            $.ajax({
                url : '${ctx}/loginCheck',
                type : 'post',
                async: false,
                data : data.field,
                success : function(data) {
                    ajaxReturnData = data;
                }
            });
            //登陆成功
            if(ajaxReturnData.returnCode == 0000){
                top.layer.close(loginLoading);
                return true;
            }else{
                top.layer.close(loginLoading);
                top.layer.msg(ajaxReturnData.returnMessage);
                return false;
            }
        });
    });

</script>