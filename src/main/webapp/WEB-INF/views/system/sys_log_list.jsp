<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/comm/mytags.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>后台管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="keywords" content="后台管理系统">
    <meta name="description" content="致力于提供通用版本后台管理解决方案">

    <link rel="shortcut icon" href="${ctx}/static/img/favicon.ico">
    <link rel="stylesheet" href="${ctx}/static/layui_v2/css/layui.css">
    <link rel="stylesheet" href="${ctx}/static/css/global.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/common.css" media="all">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/personal.css" media="all">
    <link rel="stylesheet" type="text/css" href="http://at.alicdn.com/t/font_9h680jcse4620529.css">
    <script src="${ctx}/static/layui_v2/layui.js"></script>

<body>
<div class="larry-grid layui-anim layui-anim-upbit larryTheme-A ">
    <div class="larry-personal">
        <div class="layui-tab layui-tab-brief" lay-filter="filterSysLogTab">
            <ul class="layui-tab-title">
                <li class="layui-this">业务日志</li>
                <li>异常日志</li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show">
                    <!--  业务日志列表 -->
                    <table id="sysLogTableList" lay-filter="sysLogTableId"></table>
                </div>
                <div class="layui-tab-item">
                    <!-- 异常日志列表 -->
                    <table id="sysLogExceptionTableList" lay-filter="sysLogExceptionTableId"></table>
                </div>
            </div>

        </div>
    </div>
</div>

<script type="text/javascript">
    var $,table;
    layui.config({
        base : "${ctx}/static/js/"
    }).use(['form', 'table','common','element'], function () {
        $ =  layui.$;
        table = layui.table;
       var  form = layui.form,
        element = layui.element,
        common = layui.common;



        //业务日志
        sysLogTable();

        /**tab监听*/
        element.on('tab(filterSysLogTab)', function(data){
            if(data.index == 1){
                sysLogExceptionTable(); //异常日志table
            }

        });
    });


    /**业务日志table*/
    function sysLogTable() {
        table.render({
            elem: '#sysLogTableList',
            url: '${ctx}/syslog/ajax_sys_log_list.do',
            id:'sysLogTableId',
            method: 'post',
            height:'full-120',
            skin:'row',
            even:'true',
            size: 'sm',
            where: {
                logType:'info',
            },
            cols: [[
                {field:'logTitle', title: '日志标题',width: 150 },
                {field:'logType', title: '日志类型',align:'center',width: 85,templet: '#logTypeTpl'},
                {field:'logUrl', title: '日志请求URL',align:'center',width: 200},
                {field:'logMethod', title: '请求方式',align:'center',width: 85},
                {field:'logParams', title: '请求参数',align:'center',width: 200},
                {field:'logUserName', title: '用户Id',align:'center',width: 90},
                {field:'logIp', title: '请求IP',align:'center',width: 120},
                {field:'logIpAddress', title: 'IP归属',align:'center',width: 120},
                {field:'logStartTime', title: '请求时间',align:'center',width: 150},
                {field:'logElapsedTime', title: '耗时',align:'center',width: 75}


            ]],
            page: true,
            limit: 10//默认显示10条
        });

    }
    /**异常日志table*/
    function sysLogExceptionTable() {
        table.render({
            elem: '#sysLogExceptionTableList',
            url: '${ctx}/syslog/ajax_sys_log_list.do',
            id:'sysLogExceptionTableId',
            method: 'post',
            height:'full-120',
            skin:'row',
            even:'true',
            size: 'sm',
            where: {
                logType:'error',
            },
            cols: [[
                {field:'logTitle', title: '日志标题',width: 150 },
                {field:'logType', title: '日志类型',align:'center',width: 85,templet: '#logTypeTpl'},
                {field:'logUrl', title: '异常方法',align:'center',width: 200},
                {field:'logMethod', title: '请求方式',align:'center',width: 85},
                {field:'logParams', title: '请求参数',align:'center',width: 150},
                {field:'logException', title: '异常信息',align:'center',width: 150},
                {field:'logUserName', title: '用户Id',align:'center',width: 90},
                {field:'logIp', title: '请求IP',align:'center',width: 120},
                {field:'logIpAddress', title: 'IP归属',align:'center',width: 120},
                {field:'logStartTime', title: '请求时间',align:'center',width: 150},
                {field:'logElapsedTime', title: '耗时',align:'center',width: 75}


            ]],
            page: true,
            limit: 10//默认显示10条
        });

    }

</script>
<!-- 日志类型tpl-->
<script type="text/html" id="logTypeTpl">

    {{# if(d.logType == 'info'){ }}
    <span class="label label-info ">业务日志</span>
    {{# } else if(d.logType == 'error'){ }}
    <span class="label label-danger ">异常日志</span>
    {{# } else { }}
    {{d.logType}}
    {{# }  }}
</script>




</body>
</html>