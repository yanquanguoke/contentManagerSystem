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
<%--<blockquote class="layui-elem-quote layui-quote-nm"--%>
        <%--style="border-radius:0.25em;color: #31708f;background-color: #d9edf7;border-width:1px; padding:6px; border-color:#bce8f1;">--%>
        <%--温馨提示:1.菜单类型为菜单时父级菜单可以为空;2.菜单类型为按钮时父级菜单不能为空;3.父级菜单选中时，资源路径不能为空--%>
<%--</blockquote>--%>
<form class="layui-form layui-form-pane">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">菜单名称</label>
            <div class="layui-input-inline">
                <input type="text" id="resName" name="resName" class="layui-input" lay-verify="required" placeholder="请输入菜单名称">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">菜单类型</label>
            <div class="layui-input-inline">
                <select id="resType" name="resType" lay-filter="resTypeFilter">
                    <option value=""></option>
                    <option value="0">0-菜单</option>
                    <option value="1">1-按钮</option>
                </select>
            </div>
        </div>


    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">菜单级别</label>
            <div class="layui-input-inline">
                <select id="resLevel" name="resLevel" lay-filter="resLevelFilter">
                    <option value=""></option>
                    <option value="1">一级菜单</option>
                    <option value="2">二级菜单</option>
                    <option value="3">三级菜单</option>
                </select>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">父级菜单</label>
            <div class="layui-input-inline">
                <select id="resParentid" name="resParentid" >
                    <option value=""></option>
                </select>
            </div>
        </div>
    </div>
    <div class="layui-form-item">

        <div class="layui-inline">
            <label class="layui-form-label">菜单路径</label>
            <div class="layui-input-inline">
                <input type="text" id="resLinkAddress" name="resLinkAddress" class="layui-input" >
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
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">菜单状态</label>
            <div class="layui-input-inline" style="border: 1px solid #e6e6e6;background-color: #fff;height: 36px;">
                <input type="radio" name="resStatus" value="0" title="有效" checked>
                <input type="radio" name="resStatus" value="1" title="失效" >
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">排序</label>
            <div class="layui-input-inline">
                <input type="text" id="resDisplayOrder" name="resDisplayOrder" class="layui-input" >
            </div>
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-block">
            <textarea id="resRemark" name="resRemark" placeholder="请输入内容" class="layui-textarea" maxlength="50" style="resize:none;min-height:40px;"></textarea>
        </div>
    </div>
    </div>
    <div class="layui-form-item" style="text-align: center;">
        <button class="layui-btn" lay-submit="" lay-filter="saveRes">保存</button>
        <button type="layui-btn" id="cancle" class="layui-btn layui-btn-primary">取消</button>
    </div>
</form>
<script type="text/javascript">
    layui.config({
        base : "${ctx}/static/js/"
    }).use(['form','layer','jquery','common'],function(){
        var $ = layui.jquery,
                form = layui.form(),
                common = layui.common,
                layer = parent.layer === undefined ? layui.layer : parent.layer;


        /**监听菜单类型选择*/
        form.on('select(resTypeFilter)', function(data){
            console.log(data.elem); //得到select原始DOM对象
            console.log(data.value); //得到被选中的值
            console.log(data.othis); //得到美化后的DOM对象
        });

        /**监听菜单级别选择*/
        form.on('select(resLevelFilter)', function(data){
            console.log(data.elem); //得到select原始DOM对象
            console.log(data.value); //得到被选中的值
            console.log(data.othis); //得到美化后的DOM对象
        });



        /**选择图标*/
        $(".select_img").click(function(){
            var url = "${ctx}/res/res_img.do";
            common.cmsLayOpen('选择图标',url,'485px','370px','top');
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


        /**取消*/
        $("#cancle").click(function(){
            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
            parent.layer.close(index); //再执行关闭
        });

    });

</script>
</body>
</html>