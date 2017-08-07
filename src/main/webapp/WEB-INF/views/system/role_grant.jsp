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

    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css">


    <script src="${ctx}/static/layui/layui.js"></script>

</head>
<body class="childrenBody" style="font-size: 12px;">

<ul id="demo"></ul>
<script type="text/javascript">
    layui.use(['tree', 'layer'], function() {
        var layer = layui.layer
                , $ = layui.jquery;

        var tree = layui.tree({
            elem: '#demo',
            //指定元素，生成的树放到哪个元素上
            check: 'checkbox',
            //勾选风格
            skin: 'as',
            //设定皮肤
            drag: true,
            //点击每一项时是否生成提示信息
            checkboxName: 'aa[]',
            //复选框的name属性值
            checkboxStyle: "",
            //设置复选框的样式，必须为字符串，css样式怎么写就怎么写
            click: function(item) { //点击节点回调
                console.log(item)
            },
            nodes: [ //节点
                {
                    name: '常用文件夹',
                    //节点名称
                    spread: true,
                    //是否是展开状态，true为展开状态
                    href: "http://www.baidu.com",
                    //设置节点跳转的链接，如果不设置则不会跳转
                    target: "_self",
                    //节点链接打开方式
                    alias: 'changyong',
                    checkboxValue: 1,
                    //复选框的值
                    checked: true,
                    //复选框默认是否选中
                    children: [{
                        name: '所有未读',
                        alias: 'weidu',
                        checked: true,
                        checkboxValue: 2
                    },
                        {
                            name: '置顶邮件',
                        },
                        {
                            name: '标签邮件',
                            checked: false,
                            checkboxValue: 3
                        }]
                },
                {
                    name: '我的邮箱',
                    checked: true,
                    spread: true,
                    children: [{
                        name: 'QQ邮箱',
                        checked: true,
                        checkboxValue: 4,
                        spread: true,
                        children: [{
                            name: '收件箱',
                            checked: false,
                            checkboxValue: 5,
                            children: [{
                                name: '所有未读',
                                checked: false,
                                checkboxValue: 6,
                                children: [{
                                    name: '一周未读',
                                    checked: false,
                                    checkboxValue: 6
                                }]
                            },
                                {
                                    name: '置顶邮件',
                                    checked: false,
                                    checkboxValue: 7
                                },
                                {
                                    name: '标签邮件',
                                    checked: false,
                                    checkboxValue: 8
                                }]
                        },
                            {
                                name: '已发出的邮件',
                                checked: false,
                                checkboxValue: 9
                            },
                            {
                                name: '垃圾邮件',
                                checked: false,
                                checkboxValue: 10
                            }]
                    },
                        {
                            name: '阿里云邮',
                            checked: true,
                            checkboxValue: 11,
                            children: [{
                                name: '收件箱',
                                checked: true,
                                checkboxValue: 12
                            },
                                {
                                    name: '已发出的邮件',
                                    checked: true,
                                    checkboxValue: 13
                                },
                                {
                                    name: '垃圾邮件',
                                    checked: true,
                                    checkboxValue: 14
                                }]
                        }]
                }]
        });

        $("ul.layui-tree i.layui-tree-check").on("click",function(){
            if($(this).hasClass("lee-onChecked")){//已勾选，需要取消购销
                $(this).html("&#xe626;");
                $(this).removeClass("lee-onChecked");
                var childUL = $(this).parent().find("ul");
                if(childUL.length > 0){//存在子文件夹，需要全部自动取消勾选
                    childUL.each(function(){
                        var childCheck = $(this).find("i.layui-tree-check");
                        childCheck.html("");
                        childCheck.removeClass("lee-onChecked");
                    });
                }
            }else{
                $(this).html("&#xe627;");
                $(this).addClass("lee-onChecked");
                var childUL = $(this).parent().find("ul");
                if(childUL.length > 0){//存在子文件夹，需要全部自动勾选
                    childUL.each(function(){
                        var childCheck = $(this).find("i.layui-tree-check");
                        childCheck.html("");
                        childCheck.addClass("lee-onChecked");
                    });
                }
            }
        });
    });
</script>
</body>
</html>