<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/comm/mytags.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
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

    <link rel="stylesheet" href="${ctx}/static/layui_v2/css/layui.css">
    <link rel="stylesheet" href="${ctx}/static/css/global.css">

    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/common.css" media="all">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/personal.css" media="all">
    <link rel="stylesheet" type="text/css" href="http://at.alicdn.com/t/font_9h680jcse4620529.css">


    <script src="${ctx}/static/layui_v2/layui.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/gtf.js"></script>






<body>

<div class="table-list">
    <table class="layui-table" id="tabletree">
        <colgroup>
            <col width="150">
            <col width="150">
            <col width="200">
            <col width="200">
        </colgroup>
        <thead>
        <tr>
            <th>菜单名称</th>
            <th>菜单操作</th>
            <th>菜单状态</th>
            <th>菜单状态</th>
        </tr>
        </thead>
        <tbody>
        <tr data-tb-pid="0" data-tb-id="1">
            <td>系统应用</td>
            <td>/</td>
            <td>启用</td>
            <td>启用</td>
        </tr>
        <tr data-tb-pid="1" data-tb-id="13">
            <td>首页管理</td>
            <td>/</td>
            <td>启用</td>
            <td>启用</td>
        </tr>
        <tr data-tb-pid="13" data-tb-id="6">
            <td>后台首页</td>
            <td>Index/home</td>
            <td>启用</td>
            <td>启用</td>
        </tr>
        <tr data-tb-pid="1" data-tb-id="33">
            <td>管理员管理</td>
            <td>/</td>
            <td>启用</td>
            <td>启用</td>
        </tr>

        </tbody>
    </table>
</div>



</body>
</html>
<script type="text/javascript">


</script>