var navtab;
layui.config({base: '/backstage/js/lib/'}).extend({
    larry: 'larry',
    navtab: 'navtab',
    elemnts: 'elements',
    common: 'common'
});
layui.use(['elements', 'jquery', 'layer', 'larry', 'navtab', 'form', 'common'], function () {
    var $ = layui.jquery, layer = layui.layer, device = layui.device(), elements = layui.elements(), larry = layui.larry(), form = layui.form(), common = layui.common;
    navtab = layui.navtab({elem: '#larry-tab'});
    $('body').bind("selectstart", function () {
        return false
    });
    $(document).ready(function () {
        if (device.ie && device.ie < 9) {
            layer.alert('最低支持ie9，您当前使用的是古老的 IE' + device.ie + '！')
        }
        AdminInit();
        $.ajaxSettings.async = false;
        $.getJSON('/backstage/datas/menu.php?t=' + new Date(), {Param: 'index_menu'}, function (result) {
            larry.set({elem: '#menu', data: result, cached: false});
            larry.render()
        });
        var m = $('#menu');
        m.find('li.layui-nav-item').each(function () {
            var t = $(this);
            t.on('click', function () {
                var id = t.data('pid');
                $.ajaxSettings.async = false;
                $.getJSON('/backstage/datas/menu.php?t=' + new Date(), {
                    pid: id,
                    Param: 'index_menu'
                }, function (result) {
                    larry.set({elem: '#larrySideNav', data: result, spreadOne: true});
                    larry.render();
                    larry.on('click(side)', function (data) {
                        navtab.tabAdd(data.field)
                    })
                })
            })
        });
        m.find('li[data-pid=0]').click();
        $("#larrySideNav").find("li").eq(0).addClass('layui-this');
        $.ajaxSettings.async = true
    });
    $('#larry-tab').bind("contextmenu", function () {
        return false
    });
    $('#buttonRCtrl').find('dd').each(function () {
        $(this).on('click', function () {
            var eName = $(this).children('a').attr('data-eName');
            navtab.tabCtrl(eName)
        })
    });
    $(window).on('resize', function () {
        AdminInit();
        var c = $('#larry-tab .layui-tab-content');
        c.height($(this).height() - 153);
        c.find('iframe').each(function () {
            $(this).height(c.height())
        })
    }).resize();
    $("#refresh_iframe").click(function () {
        $(".layui-tab-content .layui-tab-item").each(function () {
            if ($(this).hasClass('layui-show')) {
                $(this).children('iframe')[0].contentWindow.location.reload(true)
            }
        })
    });
    function AdminInit() {
        $('.layui-layout-admin').height($(window).height());
        $('body').height($(window).height());
        $('#larry-body').width($('.layui-layout-admin').width() - $('#larry-side').width());
        $('#larry-footer').width($('.layui-layout-admin').width() - $('#larry-side').width())
    }

    $('#clearCached').on('click', function () {
        larry.cleanCached();
        layer.alert('缓存清除完成!本地存储数据也清理成功！', {icon: 1, title: '系统提示'}, function () {
            location.reload()
        })
    });
    var fScreen = localStorage.getItem("fullscreen_info");
    var themeName = localStorage.getItem('themeName');
    if (themeName) {
        $("body").attr("class", "");
        $("body").addClass("larryTheme-" + themeName)
    }
    if (fScreen && fScreen != 'false') {
        var fScreenIndex = layer.alert('按ESC退出全屏', {
            title: '进入全屏提示信息',
            skin: 'layui-layer-lan',
            closeBtn: 0,
            anim: 4,
            offset: '100px'
        }, function () {
            entryFullScreen();
            $('#FullScreen').html('<i class="larry-icon larry-quanping"></i>退出全屏');
            layer.close(fScreenIndex)
        })
    }
    $('#larryTheme').on('click', function () {
        var fScreen = localStorage.getItem('fullscreen_info');
        var themeName = localStorage.getItem('themeName');
        layer.open({
            type: 1,
            title: false,
            closeBtn: true,
            shadeClose: false,
            shade: 0.35,
            area: ['450px', '300px'],
            isOutAnim: true,
            resize: false,
            anim: Math.ceil(Math.random() * 6),
            content: $('#LarryThemeSet').html(),
            success: function (layero, index) {
                if (fScreen && fScreen != 'false') {
                    $("input[lay-filter='fullscreen']").attr("checked", "checked")
                }
                if (themeName) {
                    $("#themeName option[value='" + themeName + "']").attr("selected", "selected")
                }
                form.render()
            }
        });
        form.on('switch(fullscreen)', function (data) {
            var fValue = data.elem.checked;
            localStorage.setItem('fullscreen_info', fValue)
        });
        form.on('select(larryTheme)', function (data) {
            var themeValue = data.value;
            localStorage.setItem('themeName', themeValue);
            if (themeName) {
                $("body").attr("class", "");
                $("body").addClass("larryTheme-" + themeName)
            }
            form.render('select')
        })
    });
    $('#FullScreen').bind('click', function () {
        var fullscreenElement = document.fullscreenElement || document.mozFullScreenElement || document.webkitFullscreenElement;
        if (fullscreenElement == null) {
            entryFullScreen();
            $(this).html('<i class="larry-icon larry-quanping"></i>退出全屏')
        } else {
            exitFullScreen();
            $(this).html('<i class="larry-icon larry-quanping"></i>全屏')
        }
    });
    function entryFullScreen() {
        var docE = document.documentElement;
        if (docE.requestFullScreen) {
            docE.requestFullScreen()
        } else if (docE.mozRequestFullScreen) {
            docE.mozRequestFullScreen()
        } else if (docE.webkitRequestFullScreen) {
            docE.webkitRequestFullScreen()
        }
    }

    function exitFullScreen() {
        var docE = document;
        if (docE.exitFullscreen) {
            docE.exitFullscreen()
        } else if (docE.mozCancelFullScreen) {
            docE.mozCancelFullScreen()
        } else if (docE.webkitCancelFullScreen) {
            docE.webkitCancelFullScreen()
        }
    }

    $('#toggle').click(function () {
        var sideWidth = $('#larry-side').width();
        var bodyW = $('#larry-body').width();
        if (sideWidth === 200) {
            bodyW += 203;
            $('#larry-body').animate({left: '0', width: bodyW});
            $('#larry-footer').animate({left: '0', width: bodyW});
            $('#larry-side').animate({width: '0'})
        } else {
            bodyW -= 203;
            $('#larry-body').animate({left: '203px', width: bodyW});
            $('#larry-footer').animate({left: '203px', width: bodyW});
            $('#larry-side').animate({width: '200px'})
        }
    });
    $('#lock').mouseover(function () {
        layer.tips('请按Alt+L快速锁屏！', '#lock', {tips: [1, '#FF5722'], time: 2000})
    });
    $(document).keydown(function (e) {
        if (e.altKey && e.which == 76) {
            lockSystem()
        }
    });
    checkLockStatus('0');
    function lockSystem() {
        var url = '/backstage/datas/lock.php';
        $.post(url, function (data) {
            if (data == '1') {
                checkLockStatus(1)
            } else {
                layer.alert('锁屏失败，请稍后再试！')
            }
        });
        startTimer()
    }

    function unlockSystem() {
        checkLockStatus(0)
    }

    $('#lock').click(function () {
        lockSystem()
    });
    $('#unlock').click(function () {
        unlockSystem()
    });
    $('#lock_password').keypress(function (e) {
        var key = e.which;
        if (key == 13) {
            unlockSystem()
        }
    });
    function startTimer() {
        var today = new Date();
        var h = today.getHours();
        var m = today.getMinutes();
        var s = today.getSeconds();
        m = m < 10 ? '0' + m : m;
        s = s < 10 ? '0' + s : s;
        $('#time').html(h + ":" + m + ":" + s);
        t = setTimeout(function () {
            startTimer()
        }, 500)
    }

    function checkLockStatus(locked) {
        if (locked == 1) {
            $('.lock-screen').show();
            $('#locker').show();
            $('#layui_layout').hide();
            $('#lock_password').val('')
        } else {
            $('.lock-screen').hide();
            $('#locker').hide();
            $('#layui_layout').show()
        }
    }

    $('#dianzhan').click(function (event) {
        layer.open({
            type: 1,
            title: false,
            closeBtn: true,
            shadeClose: false,
            shade: 0.15,
            area: ['505px', '288px'],
            content: '<img src="images/dianzhan.jpg"/>'
        })
    });
    $('#logout').on('click', function () {
        var url = 'login.php';
        common.logOut('退出登陆提示！', '你真的确定要退出系统吗？', url)
    })
})