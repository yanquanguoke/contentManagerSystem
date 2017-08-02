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
    <link rel="stylesheet" href="${ctx}/static/css/main.css">


    <script src="${ctx}/static/layui/layui.js"></script>

</head>
<body class="childrenBody" style="font-size: 12px;">
<div class="row" style="height:330px;overflow: auto;">
    <div class="sysNotice col" style="width: 49%;">
        <blockquote class="layui-elem-quote title">待分配的角色</blockquote>
        <div class="layui-form" style="height: 270px;  border: 1px solid #e2e2e2;">
            <table class="layui-table" style="border: 0px;" >
                <colgroup>
                    <col width="10">
                </colgroup>
                <tbody>
                    <tr>
                        <td><input name="" lay-skin="primary" type="checkbox"></td>
                        <td>系统名称:</td>
                    </tr>
                    <tr>
                        <td><input name="" lay-skin="primary" type="checkbox"></td>
                        <td>系统名称:</td>
                    </tr>
                    <tr>
                        <td><input name="" lay-skin="primary" type="checkbox"></td>
                        <td>系统名称:</td>
                    </tr>
                    <tr>
                        <td><input name="" lay-skin="primary" type="checkbox"></td>
                        <td>系统名称:</td>
                    </tr>
                    <tr>
                        <td><input name="" lay-skin="primary" type="checkbox"></td>
                        <td>系统名称:</td>
                    </tr>


                </tbody>
            </table>
        </div>

    </div>
    <div style="width:20px;  position: absolute; top: 138px; left:240px;">
        <%--<img alt="右移" onclick="selectRoleRight();" src="${ctx}/static/img/right.gif"><br>--%>
        <%--<img alt="左移" onclick="selectRoleLeft();" id="left_option" src="${ctx}/static/img/left.gif">--%>
        <a title="右移" style="cursor: pointer"><i class="layui-icon" style="color: #009688;">&#xe602;</i></a>
        <a title="左移" style="cursor: pointer"><i class="layui-icon" style="color: #009688;">&#xe603;</i></a>
    </div>
    <div class="sysNotice col" style="width: 49%;margin-left: 8px;">
        <blockquote class="layui-elem-quote title">已分配的角色</blockquote>
        <div class="layui-form" style="height: 270px;  border: 1px solid #e2e2e2;">
            <table class="layui-table" style="border: 0px;" >
                <colgroup>
                    <col width="10">
                </colgroup>
                <tbody>
                <tr>
                    <td><input name="" lay-skin="primary" type="checkbox"></td>
                    <td>系统名称:</td>
                </tr>
                <tr>
                    <td><input name="" lay-skin="primary" type="checkbox"></td>
                    <td>系统名称:</td>
                </tr>
                <tr>
                    <td><input name="" lay-skin="primary" type="checkbox"></td>
                    <td>系统名称:</td>
                </tr>
                <tr>
                    <td><input name="" lay-skin="primary" type="checkbox"></td>
                    <td>系统名称:</td>
                </tr>
                <tr>
                    <td><input name="" lay-skin="primary" type="checkbox"></td>
                    <td>系统名称:</td>
                </tr>


                </tbody>
            </table>
        </div>
    </div>
</div>
    <div class="layui-form-item" style="text-align: center;">
            <button class="layui-btn" lay-submit="" lay-filter="saveUser">保存</button>
            <button type="layui-btn" id="cancle" class="layui-btn layui-btn-primary">取消</button>

    </div>

<script type="text/javascript">
    layui.use(['form','layer','jquery'],function(){
        var $ = layui.jquery,
                form = layui.form(),
                layer = parent.layer === undefined ? layui.layer : parent.layer;


        //保存
        form.on("submit(saveUser)",function(data){
            var userSaveLoading = top.layer.msg('数据提交中，请稍候',{icon: 16,time:false,shade:0.8});
            //登陆验证
            $.ajax({
                url : '${ctx}/user/ajax_save_user',
                type : 'post',
                async: false,
                data : data.field,
                success : function(data) {
                    if(data.returnCode == 0000){
                        top.layer.close(userSaveLoading);
                        top.layer.msg("用户信息保存成功！");
                        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                        parent.layer.close(index); //再执行关闭                        //刷新父页面
                        parent.location.reload();
                    }else{
                        top.layer.close(userSaveLoading);
                        top.layer.msg(data.returnMessage);
                    }
                },error:function(data){
                    top.layer.close(index);

                }
            });
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