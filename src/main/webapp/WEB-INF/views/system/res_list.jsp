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
    <link rel="stylesheet" href="${ctx}/static/css/global.css">

    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/common.css" media="all">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/personal.css" media="all">

    <script src="${ctx}/static/layui/layui.js"></script>
    <%--<script type="text/javascript" src="${ctx}/static/js/index.js"></script>--%>


<body>
<div class="larry-grid">
    <div class="larry-personal">
        <div class="layui-tab">
            <blockquote class="layui-elem-quote mylog-info-tit">
                <div class="layui-inline">
                    <a class="layui-btn  newsAdd_btn"> <i class="layui-icon">&#xe608;</i>添加文章</a>
                </div>
            </blockquote>
            <div class="larry-separate"></div>
            <!-- 操作日志 -->
            <div class="layui-tab-item layui-field-box layui-show">
                <div class="layui-form" style="height: 300px;">
                    <table class="layui-table" lay-even="" lay-skin="row">
                        <colgroup>
                            <col width="50">
                            <col width="150">
                            <col width="150">
                            <col width="150">
                        </colgroup>
                        <thead >
                            <tr>
                                <th style="height: 20px;"><input name="" lay-skin="primary" lay-filter="allChoose" type="checkbox"></th>
                                <th>昵称</th>
                                <th>加入时间</th>
                                <th>签名</th>
                            </tr>
                        </thead>
                        <tbody style="height: 50px;" id="resTbody">
                            <%--<tr>--%>
                                <%--<td><input name="" lay-skin="primary" type="checkbox"></td>--%>
                                <%--<td>贤心</td>--%>
                                <%--<td>2016-11-29</td>--%>
                                <%--<td>人生就像是一场修行</td>--%>
                            <%--</tr>--%>

                        </tbody>
                    </table>
                </div>
                <div class="larry-table-page clearfix" id="resPage"></div>
            </div>

        </div>
    </div>
</div>
<script type="text/javascript">
    layui.use(['form', 'laypage', 'layer'], function () {
        var $ = layui.jquery,
                form = layui.form(),
                laypage = layui.laypage,
                layer = layui.layer;

        //全选
        form.on('checkbox(allChoose)', function (data) {
            var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]');
            child.each(function (index, item) {
                item.checked = data.elem.checked;
            });
            form.render('checkbox');
        });






        //添加文章
        $(".newsAdd_btn").click(function(){
            var index = layui.layer.open({
                title : "添加文章",
                type : 2,
                content : "${ctx}/system/res_edit",
                area: ['100%', '100%    '],
                success : function(layero, index){
                    layui.layer.tips('点击此处返回文章列表', '.layui-layer-setwin .layui-layer-close', {
                        tips: 3
                    });
                }
            })
        })

        function paging(curr){
            var loginLoading = top.layer.msg('数据加载中，请稍候',{icon: 16,time:false,shade:0.8});
            $.ajax({
                url : '${ctx}/system/ajax_res_list',
                type : 'post',
                data :{
                    page: curr || 1 ,   //当前页
                    rows: 3            //每页显示四条数据
                },
                success : function(data) {
                    var pdata = $.parseJSON(data);
                    $(pdata.rows).each(function(index,item){
                        $("#resTbody").append(
                             '<tr>'+
                                 '<td><input name="" lay-skin="primary" type="checkbox"></td>'+
                                '<td>'+item.resName+'</td>'+
                                '<td>'+item.resModelCode+'</td>'+
                                '<td>'+item.resRemark+'</td>'+
                             '</tr>'
                        );
                        form.render();

                    });
                    laypage({
                        cont: 'resPage',
                        pages:  pdata.totalSize,
                        curr: curr || 1, //当前页
                        skip: true,
                        jump: function(obj, first){ //触发分页后的回调
                            if(!first){ //点击跳页触发函数自身，并传递当前页：obj.curr
                                $("#resTbody").text('');//先清空原先内容
                                paging(obj.curr);


                            }
                        }
                    });
                    top.layer.close(loginLoading);

                }

            });
        }


        paging(1);







    });



</script>

</body>
</html>