<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2021/4/14
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>后台登录-X-admin2.2</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="css/font.css">
    <link rel="stylesheet" href="css/xadmin.css">
    <script src="./layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="js/xadmin.js"></script>
    <!--        <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>-->
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script>
        // 是否开启刷新记忆tab功能
        // var is_remember = false;
    </script>
</head>
<body class="index">
<!-- 顶部开始 -->
<div class="container">
    <div class="logo">
        <a href="index.jsp">大学生创新创业项目管理</a></div>
    <div class="left_open">
        <a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
    </div>
<%--    <ul class="layui-nav left fast-add" lay-filter="">--%>
<%--        <li class="layui-nav-item">--%>
<%--            <a href="javascript:;">+新增</a>--%>
<%--            <dl class="layui-nav-child">--%>
<%--                <!-- 二级菜单 -->--%>
<%--                <dd>--%>
<%--                    <a onclick="xadmin.open('最大化','http://www.baidu.com','','',true)">--%>
<%--                        <i class="iconfont">&#xe6a2;</i>弹出最大化</a></dd>--%>
<%--                <dd>--%>
<%--                    <a onclick="xadmin.open('弹出自动宽高','http://www.baidu.com')">--%>
<%--                        <i class="iconfont">&#xe6a8;</i>弹出自动宽高</a></dd>--%>
<%--                <dd>--%>
<%--                    <a onclick="xadmin.open('弹出指定宽高','http://www.baidu.com',500,300)">--%>
<%--                        <i class="iconfont">&#xe6a8;</i>弹出指定宽高</a></dd>--%>
<%--                <dd>--%>
<%--                    <a onclick="xadmin.add_tab('在tab打开','member-list.html')">--%>
<%--                        <i class="iconfont">&#xe6b8;</i>在tab打开</a></dd>--%>
<%--                <dd>--%>
<%--                    <a onclick="xadmin.add_tab('在tab打开刷新','member-del.html',true)">--%>
<%--                        <i class="iconfont">&#xe6b8;</i>在tab打开刷新</a></dd>--%>
<%--            </dl>--%>
<%--        </li>--%>
<%--    </ul>--%>
    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;">
                <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                ${user.name}</a>
            <dl class="layui-nav-child">
                <!-- 二级菜单 -->
                <dd>
                    <a onclick="xadmin.add_tab('个人信息','user?method=getYhxx2')">个人信息</a></dd>
                <dd>
                    <a onclick="xadmin.add_tab('修改密码','http://www.baidu.com')">切换帐号</a></dd>
                <dd class="close-all" data-type="closeall">
                    <a href="index.jsp">退出</a></dd>
            </dl>
        </li>
        <!--                <li class="layui-nav-item to-index">-->
        <!--                    <a href="/">前台首页</a></li>-->
    </ul>
</div>
<!-- 顶部结束 -->
<!-- 中部开始 -->
<!-- 左侧菜单开始 -->
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">
            <c:forEach var="item" items="${permlist}">
                <li>
                    <a onclick="xadmin.add_tab('${item.name}','${item.url}')">
                        <i class="layui-icon left-nav-li" lay-tips="${item.name}">${item.tb}</i>
                        <cite>${item.name}</cite>
                    </a>
                </li>
            </c:forEach>



<%--            <li>--%>
<%--                <a onclick="xadmin.add_tab('查询页面','select.html')">--%>
<%--                    <i class="layui-icon left-nav-li" lay-tips="信息查询">&#xe615;</i>--%>
<%--                    <cite>信息查询</cite>--%>
<%--                </a>--%>
<%--            </li>--%>
<%--            <li>--%>
<%--                <a href="javascript:;">--%>
<%--                    <i class="iconfont left-nav-li" lay-tips="项目管理">&#xe723;</i>--%>
<%--                    <cite>项目管理</cite>--%>
<%--                    <i class="iconfont nav_right">&#xe697;</i></a>--%>
<%--                <ul class="sub-menu">--%>
<%--                    <c:forEach var="item" items="${xvQiuList}">--%>

<%--                    </c:forEach>--%>
<%--                    <li>--%>
<%--                        <a onclick="xadmin.add_tab('我的项目','xs_wdxm.jsp')">--%>
<%--                            <i class="iconfont">&#xe6a7;</i>--%>
<%--                            <cite>我的项目</cite></a>--%>
<%--                    </li>--%>

<%--                    <li>--%>
<%--                        <a onclick="xadmin.add_tab('项目评审','xyzj_xmps.jsp')">--%>
<%--                            <i class="iconfont">&#xe6a7;</i>--%>
<%--                            <cite>项目评审</cite></a>--%>
<%--                    </li>--%>

<%--                    <li>--%>
<%--                        <a onclick="xadmin.add_tab('评审结果','xyzj_psjg.jsp')">--%>
<%--                            <i class="iconfont">&#xe6a7;</i>--%>
<%--                            <cite>评审结果</cite></a>--%>
<%--                    </li>--%>

<%--                    <li>--%>
<%--                        <a onclick="xadmin.add_tab('学院项目','xyzj_xmps.jsp')">--%>
<%--                            <i class="iconfont">&#xe6a7;</i>--%>
<%--                            <cite>学院项目</cite></a>--%>
<%--                    </li>--%>

<%--                    <li>--%>
<%--                        <a onclick="xadmin.add_tab('学校项目','xyzj_xmps.jsp')">--%>
<%--                            <i class="iconfont">&#xe6a7;</i>--%>
<%--                            <cite>学校项目</cite></a>--%>
<%--                    </li>--%>

<%--                </ul>--%>
<%--            </li>--%>
<%--            <li>--%>
<%--                <a href="javascript:;">--%>
<%--                    <i class="iconfont left-nav-li" lay-tips="分类管理">&#xe723;</i>--%>
<%--                    <cite>分类管理</cite>--%>
<%--                    <i class="iconfont nav_right">&#xe697;</i></a>--%>
<%--                <ul class="sub-menu">--%>
<%--                    <li>--%>
<%--                        <a onclick="xadmin.add_tab('多级分类','cate.html')">--%>
<%--                            <i class="iconfont">&#xe6a7;</i>--%>
<%--                            <cite>多级分类</cite></a>--%>
<%--                    </li>--%>
<%--                </ul>--%>
<%--            </li>--%>
        </ul>
    </div>
</div>
<!-- <div class="x-slide_left"></div> -->
<!-- 左侧菜单结束 -->
<!-- 右侧主体开始 -->
<div class="page-content">
    <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
        <ul class="layui-tab-title">
            <li class="home">
                <i class="layui-icon">&#xe68e;</i>欢迎</li></ul>
        <div class="layui-unselect layui-form-select layui-form-selected" id="tab_right">
            <dl>
                <dd data-type="this">关闭当前</dd>
                <dd data-type="other">关闭其它</dd>
                <dd data-type="all">关闭全部</dd>
            </dl>
        </div>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <iframe src='WelcomeServlet' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
            </div>
        </div>
        <div id="tab_show"></div>
    </div>
</div>
<div class="page-content-bg"></div>
<style id="theme_style"></style>
<!-- 右侧主体结束 -->
<!-- 中部结束 -->
<script>
    //js代码
    layui.use('element',function(){
        var $ = layui.jquery;
        var element = layui.element;//Tab的切换功能，切换事件监听等，需要依赖element模块
        var layer = layui.layer;
        var active = {
            //在这里给active绑定事件，后面可通过active调用这些事件
            tabDeleteAll:function(ids){//删除所有
                $.each(ids,function(i,item){
                    element.tabDelete("xbs_tab",item);//ids是一个数组，里面存放了多个id，调用tabDelete方法分别删除
                })
            }
        };

        $(".close-all").click(function () {
            if ($(this).attr("data-type") == "closeall") {
                var tabtitle = $(".layui-tab-title li");
                var ids = new Array();
                $.each(tabtitle, function (i) {
                    ids[i] = $(this).attr("lay-id");
                });
                active.tabDeleteAll(ids);
            }

        })
    });

</script>
</body>
</html>
