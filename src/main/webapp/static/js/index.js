layui.config({base: '/static/js/'});
layui.use(['jquery', 'common','layer','element'], function () {
    var $ = layui.jquery,
        layer = layui.layer,
        common = layui.common;
     var  element = layui.element()   //导航的hover效果、二级菜单等功能，需要依赖element模块
        ;


    //退出
    $('#logout').on('click', function () {
        var url = '/logout';
        common.logOut('退出登陆提示！', '你真的确定要退出系统吗？', url)
    })

});
