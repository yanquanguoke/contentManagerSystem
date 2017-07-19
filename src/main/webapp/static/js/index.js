layui.config({
    base : "/static/js/"
}).use(['jquery', 'common','layer','element','bodyTab'], function () {
    var $ = layui.jquery,
        layer = layui.layer,
        common = layui.common,
        element = layui.element() ,  //导航的hover效果、二级菜单等功能，需要依赖element模块
        tab = layui.bodyTab()
        ;



    //退出
    $('#logout').on('click', function () {
        var url = '/logout';
        common.logOut('退出登陆提示！', '你真的确定要退出系统吗？', url)
    })

    // 添加新窗口
    $(".layui-nav .layui-nav-item a").on("click",function(){
        // element.tabAdd('bodyTab', {
        //     title: '选项卡的标题'
        //     ,content: '选项卡的内容' //支持传入html
        //     ,id: '选项卡标题的lay-id属性值'
        // });
        tab.tabAdd($(this));
        $(this).parent("li").siblings().removeClass("layui-nav-itemed");

        //$(this).parent("li").siblings().removeClass("layui-nav-itemed");
    })


});
