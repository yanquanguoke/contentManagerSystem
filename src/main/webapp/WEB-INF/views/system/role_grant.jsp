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

    <link rel="stylesheet" href="${ctx}/static/tree/tree.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="http://at.alicdn.com/t/font_9h680jcse4620529.css">


    <script src="${ctx}/static/layui/layui.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="${ctx}/static/tree/tree.min.js" ></script>
    <script type="text/javascript" src="${ctx}/static/tree/extend.tree.js" ></script>


</head>
<body class="childrenBody" style="font-size:12px;">
<fieldset class="layui-elem-field">
    <legend  style="font-size: 12px;color:#FF5722;">请选择菜单信息</legend>
    <div class="layui-field-box" style="height: 430px; overflow: auto;">
        <ul id="resourceTree"></ul>
    </div>
</fieldset>




<script type="text/javascript">
    layui.use(['tree', 'layer','form'], function() {
        var layer = layui.layer
                , $ = layui.jquery,
         form = layui.form();


        initResourceAllTree();


    });


    /**获取所有有效的资源菜单*/
    function initResourceAllTree(){
        var resourceTree;
        resourceTree =  $('#resourceTree').tree({
            url:'${ctx}/role/ajax_resource_tree_list.do',
            parentField : 'pid',
            checkbox : true,
            cascadeCheck : false,
            lines : true,
            cache:false,
            onCheck: function (node,checked) {
                if(checked){
                    var parentNode = resourceTree.tree('getParent', node.target);
                    if(parentNode != null){
                        resourceTree.tree('check', parentNode.target);
                    }

                }else{
                    var childNode = resourceTree.tree('getChildren', node.target);
                    if (childNode.length > 0) {
                        for (var i = 0; i < childNode.length; i++) {
                            resourceTree.tree('uncheck', childNode[i].target);
                        }
                    }
                }
            },
            onLoadSuccess : function(node, data) {

            }
        });
    }

</script>
</body>
</html>