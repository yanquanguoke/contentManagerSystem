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
    <link rel="stylesheet" type="text/css" href="http://at.alicdn.com/t/font_9h680jcse4620529.css">


    <script src="${ctx}/static/layui/layui.js"></script>
</head>
<body class="childrenBody" style="font-size: 12px;">
<form class="layui-form layui-form-pane">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">菜单名称</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input newsName" lay-verify="required" placeholder="请输入菜单名称">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">菜单路径</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input newsName" >
            </div>
        </div>

    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">菜单类型</label>
            <div class="layui-input-inline">
                <select name="city" >
                    <option value=""></option>
                    <option value="0">0-菜单</option>
                    <option value="1">1-按钮</option>
                </select>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">父级菜单</label>
            <div class="layui-input-inline">
                <select name="city" >
                    <option value=""></option>

                </select>
            </div>
        </div>
    </div>
    <div class="layui-form-item">

        <div class="layui-inline">
            <label class="layui-form-label">排序</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input newsName" >
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">菜单图标</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="resImage" name="resImage" value="" disabled>
            </div>
            <div class="layui-form-mid layui-word-aux">
                <a class="layui-btn layui-btn-mini select_img" data-id="" title="选择图标"><i class="layui-icon larry-icon larry-tupianguanli"></i></a>'
            </div>
        </div>
    </div>
    <div class="layui-form-item" pane>
        <label class="layui-form-label">资源状态</label>
        <div class="layui-input-inline">
            <input type="radio" name="userStatus" value="0" title="有效" checked>
            <input type="radio" name="userStatus" value="1" title="失效" >
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-block">
            <textarea name="desc" placeholder="请输入内容" class="layui-textarea" maxlength="50" style="resize:none;min-height:40px;"></textarea>
        </div>
    </div>
    </div>
    <div class="layui-form-item" style="text-align: center;">
        <button class="layui-btn" lay-submit="" lay-filter="saveRes">保存</button>
        <button type="layui-btn" id="cancle" class="layui-btn layui-btn-primary">取消</button>

    </div>
</form>
<script type="text/javascript">
    layui.use(['form','layer','jquery'],function(){
        var $ = layui.jquery,
                form = layui.form(),
                layer = parent.layer === undefined ? layui.layer : parent.layer;

        //选择图标
        $(".select_img").click(function(){
            var index = top.layui.layer.open({
                title : '<i class="larry-icon larry-tupianguanli"></i>选择图标',
                type : 2,
                skin : 'layui-layer-molv',
                content : "${ctx}/res/res_img",
                area: ['485px', '370px '],
                resize:false,
                anim:1,
                success : function(layero, index){


                }
            })
        })


        //保存
        form.on("submit(saveRes)",function(data){
            alert(data.field.resImage)
            <%--var userSaveLoading = top.layer.msg('数据提交中，请稍候',{icon: 16,time:false,shade:0.8});--%>
            <%--//登陆验证--%>
            <%--$.ajax({--%>
                <%--url : '${ctx}/user/ajax_save_user',--%>
                <%--type : 'post',--%>
                <%--async: false,--%>
                <%--data : data.field,--%>
                <%--success : function(data) {--%>
                    <%--if(data.returnCode == 0000){--%>
                        <%--top.layer.close(userSaveLoading);--%>
                        <%--top.layer.msg("用户信息保存成功！");--%>
                        <%--var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引--%>
                        <%--parent.layer.close(index); //再执行关闭                        //刷新父页面--%>
                        <%--parent.location.reload();--%>
                    <%--}else{--%>
                        <%--top.layer.close(userSaveLoading);--%>
                        <%--top.layer.msg(data.returnMessage);--%>
                    <%--}--%>
                <%--},error:function(data){--%>
                    <%--top.layer.close(index);--%>

                <%--}--%>
            <%--});--%>
            return false;
        });

        //取消
        $("#cancle").click(function(){
            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
            parent.layer.close(index); //再执行关闭
            // layer.closeAll("iframe");
        });

    });

</script>
</body>
</html>