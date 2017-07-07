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
    <script src="${ctx}/static/js/main.js"></script>

</head>
<body class="childrenBody">
    <div class="panel_box row">
        <div class="panel col">
            <a href="javascript:;" data-url="page/message/message.html">
                <div class="panel_icon">
                    <i class="layui-icon" data-icon="&#xe63a;">&#xe63a;</i>
                </div>
                <div class="panel_word newMessage">
                    <span></span>
                    <cite>新消息</cite>
                </div>
            </a>
        </div>
    </div>
    <blockquote class="layui-elem-quote">
        <p>本模板基于Layui实现，支持除LayIM外所有的Layui组件。<a href="http://layim.layui.com/" target="_blank" class="layui-btn layui-btn-mini">前往获取LayIM授权</a>　　<span style="color:#1E9FFF;">郑重提示：网站所有数据均为静态数据，无数据库，除打开的窗口和部分小改动外所有操作刷新后无效，关闭窗口或清除缓存后，所有操作无效，请知悉</span></p>
        <p style="margin-top:5px;">开发文档地址：<a class="layui-btn layui-btn-mini" target="_blank" href="http://www.layui.com/doc">点此跳转</a> <a class="layui-btn layui-btn-mini layui-btn-danger" target="_blank" href="http://fly.layui.com/case/u/3198216">我要点赞</a>　　技术交流QQ群：<a target="_blank" href="//shang.qq.com/wpa/qunwpa?idkey=8b7dd3ea73528c1e46c5d4e522426d60deed355caefdf481c1eacdd1b7b73bfd"><img border="0" src="//pub.idqqimg.com/wpa/images/group.png" alt="layui后台管理模版" title="layui后台管理模版"></a>（添加时请注明来自本框架） <span style="color:#f00;"> 注：本框架未引入任何第三方组件（天气信息除外），单纯的layui+js实现的各种功能【本框架仅作为学习交流使用，如需用作商业用途，请联系作者授权，谢谢】</span></p>
    </blockquote>
    <div class="row">
        <div class="sysNotice col">
            <blockquote class="layui-elem-quote title">更新日志</blockquote>
            <div class="layui-elem-quote layui-quote-nm">
                <h3># 1.0.9_rls （发行版） - 2017-03-01</h3>
            </div>
        </div>
        <div class="sysNotice col">
            <blockquote class="layui-elem-quote title">系统基本参数</blockquote>

        </div>
    </div>
</body>
</html>