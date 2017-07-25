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
    <style type="text/css">
        a {
            cursor: pointer;
        }

    </style>
</head>
<body class="childrenBody" style="font-size:12px;">
<fieldset class="layui-elem-field ">
    <legend style="font-size: 12px;color:#FF5722;">双击选择图标</legend>
    <div class="layui-field-box">
        <form class="layui-form layui-form-pane">
        <div class="layui-form-item" style="margin-bottom:0px;">
            <div class="layui-inline" style="margin-bottom:0px;">
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="larry-add2" title="添加"><i class="layui-icon larry-icon larry-add2"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux" >
                    <a class="select_img" data-id="larry-xinzeng" title="新增"><i class="layui-icon larry-icon larry-xinzeng"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="larry-larry-xiugai" title="修改"><i class="layui-icon larry-icon larry-larry-xiugai"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="duanxin" title="短信"><i class="layui-icon larry-icon larry-duanxin"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="shuaxin3" title="刷新"><i class="layui-icon larry-icon larry-shuaxin3"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="liuyan" title="留言"><i class="layui-icon larry-icon larry-liuyan"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="tuichu1" title="退出"><i class="layui-icon larry-icon larry-tuichu1"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="iconfontxiazai" title="下载"><i class="layui-icon larry-icon larry-iconfontxiazai"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="shanchu" title="删除"><i class="layui-icon larry-icon larry-shanchu"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="tags" title="tags"><i class="layui-icon larry-icon larry-tags"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="shanchu6" title="删除"><i class="layui-icon larry-icon larry-shanchu6"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="xitongrizhi" title="系统日志"><i class="layui-icon larry-icon larry-xitongrizhi"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="shanchu1" title="删除"><i class="layui-icon larry-icon larry-shanchu1"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="jiekouguanli" title="接口管理"><i class="layui-icon larry-icon larry-jiekouguanli"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="huishouzhan1" title="回收站"><i class="layui-icon larry-icon larry-huishouzhan1"></i></a>
                </div>
            </div>
            <div class="layui-inline" style="margin-bottom: 0px;">
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="tianjia2" title="添加"><i class="layui-icon larry-icon larry-tianjia2"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="unie614" title="密码"><i class="layui-icon larry-icon larry-unie614"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="circularxiangxi" title="参数"><i class="layui-icon larry-icon larry-circularxiangxi"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="shuaxin4" title="刷新"><i class="layui-icon larry-icon larry-shuaxin4"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="bianji2" title="编辑"><i class="layui-icon larry-icon larry-bianji2"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="ttpodicon" title="删除"><i class="layui-icon larry-icon larry-ttpodicon"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="xitongshezhi" title="系统设置"><i class="layui-icon larry-icon larry-xitongshezhi"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="shanchu7" title="删除"><i class="layui-icon larry-icon larry-shanchu7"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="logoshuiyin" title="logo水印"><i class="layui-icon larry-icon larry-logoshuiyin"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="guanbi1" title="关闭"><i class="layui-icon larry-icon larry-guanbi1"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="iconzfb" title="支付宝"><i class="layui-icon larry-icon larry-iconzfb"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="iconfontadd" title="添加"><i class="layui-icon larry-icon larry-iconfontadd"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="xiazai1" title="下载"><i class="layui-icon larry-icon larry-xiazai1"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="chaxun2" title="查询"><i class="layui-icon larry-icon larry-chaxun2"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="bianji3" title="编辑"><i class="layui-icon larry-icon larry-bianji3"></i></a>
                </div>
            </div>
            <div class="layui-inline" style="margin-bottom:0px;">
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="tianjia3" title="添加"><i class="layui-icon larry-icon larry-tianjia3"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="iconshanchu" title="删除"><i class="layui-icon larry-icon larry-iconshanchu"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="shanchu8" title="删除"><i class="layui-icon larry-icon larry-shanchu8"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="bianji4" title="编辑"><i class="layui-icon larry-icon larry-bianji4"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="zhandianneirong" title="站点内容"><i class="layui-icon larry-icon larry-zhandianneirong"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="iconfontfilesfill" title="文章"><i class="layui-icon larry-icon larry-iconfontfilesfill"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="chaxun3" title="查询"><i class="layui-icon larry-icon larry-chaxun3"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="nav" title="栏目"><i class="layui-icon larry-icon larry-nav"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="close" title="关闭"><i class="layui-icon larry-icon larry-close"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="shanchu9" title="删除"><i class="layui-icon larry-icon larry-shanchu9"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="11" title="验证"><i class="layui-icon larry-icon larry-11"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="zidingyicaidan" title="自定义菜单"><i class="layui-icon larry-icon larry-zidingyicaidan"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="iconfontcolor16" title="图片"><i class="layui-icon larry-icon larry-iconfontcolor16"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="guanwangicon31319" title="主题风格"><i class="layui-icon larry-icon larry-guanwangicon31319"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="rizhi1" title="日志"><i class="layui-icon larry-icon larry-rizhi1"></i></a>
                </div>
            </div>

            <div class="layui-inline" style="margin-bottom:0px;">
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="zidian" title="字典"><i class="layui-icon larry-icon larry-zidian"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="duanxin1" title="短信"><i class="layui-icon larry-icon larry-duanxin1"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="shenhe" title="审核"><i class="layui-icon larry-icon larry-shenhe"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="bianji5" title="编辑"><i class="layui-icon larry-icon larry-bianji5"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="wangzhanneirong" title="网站内容"><i class="layui-icon larry-icon larry-wangzhanneirong"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="xiugai3" title="修改"><i class="layui-icon larry-icon larry-xiugai3"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="tianjia5" title="添加"><i class="layui-icon larry-icon larry-tianjia5"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="gerenxinxi3" title="个人信息"><i class="layui-icon larry-icon larry-gerenxinxi3"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="tianjia6" title="添加"><i class="layui-icon larry-icon larry-tianjia6"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="gerenxinxi4" title="个人信息"><i class="layui-icon larry-icon larry-gerenxinxi4"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="zhifubao" title="支付宝"><i class="layui-icon larry-icon larry-zhifubao"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="dianzan" title="点赞"><i class="layui-icon larry-icon larry-dianzan"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="diannao3" title="电脑"><i class="layui-icon larry-icon larry-diannao3"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="icon040" title="电脑"><i class="layui-icon larry-icon larry-icon040"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="dengjipingdingguanli" title="等级评定管理"><i class="layui-icon larry-icon larry-dengjipingdingguanli"></i></a>
                </div>
            </div>





            <! --修改 / -->


            <div class="layui-inline" style="margin-bottom: 0px;">
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="tianjia2" title="添加"><i class="layui-icon larry-icon larry-tianjia2"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="unie614" title="密码"><i class="layui-icon larry-icon larry-unie614"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="circularxiangxi" title="参数"><i class="layui-icon larry-icon larry-circularxiangxi"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="shuaxin4" title="刷新"><i class="layui-icon larry-icon larry-shuaxin4"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="bianji2" title="编辑"><i class="layui-icon larry-icon larry-bianji2"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="ttpodicon" title="删除"><i class="layui-icon larry-icon larry-ttpodicon"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="xitongshezhi" title="系统设置"><i class="layui-icon larry-icon larry-xitongshezhi"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="shanchu7" title="删除"><i class="layui-icon larry-icon larry-shanchu7"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="logoshuiyin" title="logo水印"><i class="layui-icon larry-icon larry-logoshuiyin"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="guanbi1" title="关闭"><i class="layui-icon larry-icon larry-guanbi1"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="iconzfb" title="支付宝"><i class="layui-icon larry-icon larry-iconzfb"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="iconfontadd" title="添加"><i class="layui-icon larry-icon larry-iconfontadd"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="xiazai1" title="下载"><i class="layui-icon larry-icon larry-xiazai1"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="chaxun2" title="查询"><i class="layui-icon larry-icon larry-chaxun2"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="bianji3" title="编辑"><i class="layui-icon larry-icon larry-bianji3"></i></a>
                </div>
            </div>
            <div class="layui-inline" style="margin-bottom:0px;">
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="tianjia3" title="添加"><i class="layui-icon larry-icon larry-tianjia3"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="iconshanchu" title="删除"><i class="layui-icon larry-icon larry-iconshanchu"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="shanchu8" title="删除"><i class="layui-icon larry-icon larry-shanchu8"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="bianji4" title="编辑"><i class="layui-icon larry-icon larry-bianji4"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="zhandianneirong" title="站点内容"><i class="layui-icon larry-icon larry-zhandianneirong"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="iconfontfilesfill" title="文章"><i class="layui-icon larry-icon larry-iconfontfilesfill"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="chaxun3" title="查询"><i class="layui-icon larry-icon larry-chaxun3"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="nav" title="栏目"><i class="layui-icon larry-icon larry-nav"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="close" title="关闭"><i class="layui-icon larry-icon larry-close"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="shanchu9" title="删除"><i class="layui-icon larry-icon larry-shanchu9"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="11" title="验证"><i class="layui-icon larry-icon larry-11"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="zidingyicaidan" title="自定义菜单"><i class="layui-icon larry-icon larry-zidingyicaidan"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="iconfontcolor16" title="图片"><i class="layui-icon larry-icon larry-iconfontcolor16"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="guanwangicon31319" title="主题风格"><i class="layui-icon larry-icon larry-guanwangicon31319"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="rizhi1" title="日志"><i class="layui-icon larry-icon larry-rizhi1"></i></a>
                </div>
            </div>

            <div class="layui-inline" style="margin-bottom:0px;">
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="zidian" title="字典"><i class="layui-icon larry-icon larry-zidian"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="duanxin1" title="短信"><i class="layui-icon larry-icon larry-duanxin1"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="shenhe" title="审核"><i class="layui-icon larry-icon larry-shenhe"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="bianji5" title="编辑"><i class="layui-icon larry-icon larry-bianji5"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="wangzhanneirong" title="网站内容"><i class="layui-icon larry-icon larry-wangzhanneirong"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="xiugai3" title="修改"><i class="layui-icon larry-icon larry-xiugai3"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="tianjia5" title="添加"><i class="layui-icon larry-icon larry-tianjia5"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="gerenxinxi3" title="个人信息"><i class="layui-icon larry-icon larry-gerenxinxi3"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="tianjia6" title="添加"><i class="layui-icon larry-icon larry-tianjia6"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="gerenxinxi4" title="个人信息"><i class="layui-icon larry-icon larry-gerenxinxi4"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="zhifubao" title="支付宝"><i class="layui-icon larry-icon larry-zhifubao"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="dianzan" title="点赞"><i class="layui-icon larry-icon larry-dianzan"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="diannao3" title="电脑"><i class="layui-icon larry-icon larry-diannao3"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="icon040" title="电脑"><i class="layui-icon larry-icon larry-icon040"></i></a>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a class="select_img" data-id="dengjipingdingguanli" title="等级评定管理"><i class="layui-icon larry-icon larry-dengjipingdingguanli"></i></a>
                </div>
            </div>

        </div>
    </form>
    </div>
</fieldset>
<script type="text/javascript">
    layui.use(['form','layer','jquery'],function(){
        var $ = layui.jquery,
                form = layui.form(),
                layer = parent.layer === undefined ? layui.layer : parent.layer;

        //选择图标
        $("body").on("dblclick",".select_img",function(){
            //得到当前iframe层的索引
            var index = parent.layer.getFrameIndex(window.name);

            //得到父级iframe层的索引
            var indexTop = parent.layer.getFrameIndex(top.window.name);
            var body = layer.getChildFrame('body', indexTop);
            //赋值
            var resImage = $(this).attr("data-id");
            body.find("#resImage").val(resImage)

           parent.layer.close(index); //执行关闭
        });




    });
    
    function ddd() {
        
    }

</script>
</body>
</html>