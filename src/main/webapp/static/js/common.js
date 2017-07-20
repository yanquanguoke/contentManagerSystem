/**
 *  自定义扩转模块
 */
layui.define(['layer'], function (exports) {
    var $ = layui.jquery, layer = layui.layer;
    var CmsCommon = {
        cmsError: function (msg, title) {
            parent.layer.alert(msg, {
                title: title,
                icon: 2,
                time: 0,
                resize: false,
                zIndex: layer.zIndex,
                anim: Math.ceil(Math.random() * 6)
            });
            return
        }, cmsInfo: function (msg, title) {
            parent.layer.alert(msg, {
                title: title,
                icon: 6,
                time: 0,
                resize: false,
                zIndex: layer.zIndex,
                anim: Math.ceil(Math.random() * 6)
            });
            return
        }, cmsConfirm: function () {
        },
        logOut: function (title, text, url, type, dataType, data, callback) {
            parent.layer.confirm(text, {
                title: title,
                resize: false,
                btn: ['确定退出系统', '不，我点错了！'],
                btnAlign: 'c',
                icon: 3
            }, function () {
                location.href = url
            }, function () {
               
            })
        }
    };
    exports('common', CmsCommon)
})



