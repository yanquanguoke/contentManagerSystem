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
    <link rel="stylesheet" type="text/css" href="http://at.alicdn.com/t/font_9h680jcse4620529.css">


    <script src="${ctx}/static/layui/layui.js"></script>
<body>
<div class="larry-grid larryTheme-A">
    <div class="larry-personal">
        <div class="layui-tab">
            <blockquote class="layui-elem-quote mylog-info-tit">
                <div class="layui-inline">
                    <form class="layui-form" id="userSearchForm">
                        <div class="layui-input-inline" style="width:110px;">
                            <select name="searchTerm" >
                                <option value="userLoginNameTerm">登陆账号</option>
                                <option value="userNameTerm">用户姓名</option>
                            </select>
                        </div>
                        <div class="layui-input-inline" style="width:145px;">
                            <input type="text" name="searchContent" value="" placeholder="请输入关键字" class="layui-input search_input">
                        </div>
                        <a class="layui-btn userSearchList_btn" lay-submit lay-filter="userSearchFilter"><i class="layui-icon larry-icon larry-chaxun7"></i>查询</a>
                    </form>
                </div>
                <div class="layui-inline">
                    <a class="layui-btn layui-btn-normal userAdd_btn"> <i class="layui-icon larry-icon larry-xinzeng1"></i>新增用户</a>
                </div>
                <div class="layui-inline">
                    <a class="layui-btn layui-btn-normal excelUserExport_btn"  style="background-color:#5FB878"> <i class="layui-icon larry-icon larry-danye"></i>导出</a>
                </div>
                <div class="layui-inline">
                    <a class="layui-btn layui-btn-danger userBatchFail_btn"><i class="layui-icon larry-icon larry-shanchu"></i>批量失效</a>
                </div>
            </blockquote>
            <div class="larry-separate"></div>
            <!-- 用户列表 -->
            <div class="layui-tab-item layui-field-box layui-show">
                <div class="layui-form">
                    <table class="layui-table" lay-even="" lay-skin="row">
                        <thead >
                            <tr>
                                <th><input name="" lay-skin="primary" lay-filter="allChoose" type="checkbox"></th>
                                <th>登陆账号</th>
                                <th>用户姓名</th>
                                <th>用户状态</th>
                                <th>拥有角色</th>
                                <th>创建人</th>
                                <th>创建时间</th>
                                <th>修改人</th>
                                <th>修改时间</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody id="userTbody"></tbody>
                    </table>
                </div>
                <div class="larry-table-page clearfix" id="userPage"></div>
            </div>

        </div>
    </div>
</div>
<script type="text/javascript">
    layui.config({
        base : "${ctx}/static/js/"
    }).use(['form', 'laypage', 'layer','common'], function () {
        var $ = layui.jquery,
                form = layui.form(),
                laypage = layui.laypage,
                layer = layui.layer,
                common = layui.common;


        /**加载用户列表信息*/
        userPageList(1);

        /**全选*/
        form.on('checkbox(allChoose)', function (data) {
            var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]');
            child.each(function (index, item) {
                item.checked = data.elem.checked;
            });
            form.render('checkbox');
        });
        /**添加用户*/
        $(".userAdd_btn").click(function(){
            var index = layui.layer.open({
                title : "新增用户",
                type : 2,
                content : "${ctx}/user/user_add.do",
                area: ['550px', '265px'],
                success : function(layero, index){

                }
            });
        });
        /**修改用户*/
        $("body").on("click",".user_edit",function(){
            var userId = $(this).attr("data-id");
             var index = layui.layer.open({
                 title : "编辑用户",
                 type : 2,
                 content : "${ctx}/user/user_update.do?userId="+userId,
                 area: ['550px', '265px'],
                 success : function(layero, index){

                 }
             });
        });

        /**用户失效*/
        $("body").on("click",".user_fail",function(){
            var userId = $(this).attr("data-id");
            var userStatus = $(this).attr("data-status");
            var currentUserId = '${LOGIN_NAME.userId}';/*当前登录用户的ID*/
            if(userStatus == 1){
                layer.msg("当前用户已失效");
                return false;
            }
            if(userId == currentUserId){
                layer.msg("当前登陆用户不能被失效");
                return false;
            }

            var url = "${ctx}/user/ajax_user_fail.do";
            var param = {userId:userId};
            common.ajaxCmsConfirm('系统提示', '确定失效当前用户，并解除与角色绑定关系吗?',url,param)

        });
        /**分配角色*/
        $("body").on("click",".user_grant",function(){
            var userId = $(this).attr("data-id");
            var userStatus = $(this).attr("data-status");
            if(userStatus == 1){
                layer.msg("当前用户已失效,不能被分配角色");
                return false;
            }
            var index = layui.layer.open({
                title : '<i class="larry-icon larry-jiaoseguanli1"></i>分配角色',
                type : 2,
                content : "${ctx}/user/user_grant.do?userId="+userId,
                area: ['500px', '440px'],
                success : function(layero, index){

                }
            });
        });
        /**导出用户信息*/
        $(".excelUserExport_btn").click(function(){
            var url = '${ctx}/user/excel_users_export.do';
            $("#userSearchForm").attr("action",url);
            $("#userSearchForm").submit();
        });
            //
        /**查询*/
        $(".userSearchList_btn").click(function(){
            //监听提交
            form.on('submit(userSearchFilter)', function (data) {
                userPageList(1,data.field.searchTerm,data.field.searchContent);
            });

        });
        /**批量失效*/
        $(".userBatchFail_btn").click(function(){
            if($("input:checkbox[name='userIdCK']:checked").length == 0){
                layer.msg("请选择要失效的用户信息");
            }else{
                var isCreateBy = false;
                var userStatus = false;
                var currentUserName = '${LOGIN_NAME.userId}';
                var userIds = [];

                $("input:checkbox[name='userIdCK']:checked").each(function(){
                    userIds.push($(this).val());
                    //不能失效当前登录用户
                    if(currentUserName != $(this).val()){
                        isCreateBy = true;
                    }else{
                        isCreateBy = false;
                        return false;
                    }
                    //用户已失效
                    if($(this).attr('alt') == 0){
                        userStatus = true;
                    }else{
                        userStatus = false;
                        return false;
                    }

                });
                if(isCreateBy==false){
                    layer.msg("当前登录用户不能被失效,请重新选择");
                    return false;
                }
                if(userStatus==false){
                    layer.msg("当前选择的用户已失效");
                    return false;
                }

                var url = "${ctx}/user/ajax_user_batch_fail.do";
                var param = {userIds:userIds};
                common.ajaxCmsConfirm('系统提示', '确定失效当前用户，并解除与角色绑定关系吗?',url,param);


            }



        });

        /**加载用户信息**/
        function userPageList(curr,searchTerm,searchContent){
            var pageLoading = layer.load(2);
            $.ajax({
                url : '${ctx}/user/ajax_user_list.do',
                type : 'post',
                data :{
                    page: curr || 1 ,   //当前页
                    rows: 7 ,          //每页显示7条数据
                    searchTerm: searchTerm,
                    searchContent: searchContent
                },
                success : function(data) {
                    if(data != "" ){
                        $("#userTbody").text('');//先清空原先内容
                        var pdata = $.parseJSON(data);
                        $(pdata.rows).each(function(index,item){

                            //登陆用户名
                            var userLoginNameLable;
                            if(objNull(item.userLoginName) != "" && item.userLoginName.length > 9){
                                userLoginNameLable = item.userLoginName.substring(0,9) +"...";

                            }else{
                                userLoginNameLable = item.userLoginName;
                            }

                            //用户姓名
                            var userNameLable;
                            if(objNull(item.userName) != "" && item.userName.length > 9){
                                userNameLable = item.userName.substring(0,9) +"...";

                            }else{
                                userNameLable = item.userName;
                            }
                            //用户状态
                            var userStatusLable;
                            switch (item.userStatus){
                                case 0:
                                    userStatusLable = '<span class="label label-success ">0-有效</span>';
                                    break;
                                case 1:
                                    userStatusLable = '<span class="label label-danger ">1-失效</span>'
                                    break;
                            }
                            //拥有角色
                            var roleNamesLable;
                            if(objNull(item.roleNames) != "" && item.roleNames.length > 15){
                                roleNamesLable = item.roleNames.substring(0,15) +"...";

                            }else{
                                roleNamesLable = item.roleNames;
                            }
                            //操作按钮
                            var opt ='<div class="layui-btn-group">';
                                opt+=  '<a class="layui-btn layui-btn-mini user_edit" data-id="'+item.userId+'"><i class="layui-icon larry-icon larry-bianji2"></i> 编辑</a>';
                                opt+=  '<a class="layui-btn layui-btn-mini layui-btn-warm  user_grant" data-id="'+item.userId+'" data-status= "'+item.userStatus+'"><i class="layui-icon larry-icon larry-jiaoseguanli3"></i>角色</a>';
                                opt+=  '<a class="layui-btn layui-btn-mini layui-btn-danger  user_fail" data-id="'+item.userId+'" data-status= "'+item.userStatus+'"><i class="layui-icon larry-icon larry-ttpodicon"></i>失效</a>';
                                opt+= '</div>';
                            //组装table
                            $("#userTbody").append(
                                    '<tr>'+
                                    '<td><input name="userIdCK" lay-skin="primary" type="checkbox"  alt="'+item.userStatus+'" value="'+item.userId+'"></td>'+
                                    '<td title="'+objNull(item.userLoginName)+'">'+objNull(userLoginNameLable)+'</td>'+
                                    '<td title="'+objNull(item.userName)+'">'+objNull(userNameLable)+'</td>'+
                                    '<td>'+userStatusLable+'</td>'+
                                    '<td title="'+objNull(item.roleNames)+'" style="text-align:left;">'+objNull(roleNamesLable)+'</td>'+
                                    '<td>'+item.creator+'</td>'+
                                    '<td>'+item.createTime+'</td>'+
                                    '<td>'+objNull(item.modifier)+'</td>'+
                                    '<td>'+objNull(item.updateTime)+'</td>'+
                                    '<td>'+opt+'</td>'+
                                    '</tr>'
                            );
                            //重新渲染form
                            form.render();

                        });
                        //分页
                        laypage({
                            cont: 'userPage',
                            pages:  pdata.totalSize,
                            curr: curr || 1, //当前页
                            groups: 8, //连续显示分页数
                            skip: true,
                            jump: function(obj, first){ //触发分页后的回调
                                if(!first){ //点击跳页触发函数自身，并传递当前页：obj.curr
                                    userPageList(obj.curr);
                                }
                            }
                        });
                        layer.close(pageLoading);
                    }
                }

            });
        };
    });
    /**undefined 值 过滤*/
    function objNull(obj) {
        if(typeof(obj) == "undefined" || obj == null){
            return "";
        }
        return obj;
    }

</script>

</body>
</html>