<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2021/4/18
  Time: 16:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>首页-大学生创新创业项目管理系统</title>
    <script src="./js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="layui/css/layui.css"  media="all">
    <script src="layui/layui.js" charset="utf-8"></script>
    <style>
        .content{
            border: 1px solid #009688;
            background: #009688;
        }
        td{
            max-width: 300px;
            overflow:hidden;
            white-space:nowrap;
            text-overflow:ellipsis;
            -o-text-overflow:ellipsis;
            -moz-text-overflow: ellipsis;
            -webkit-text-overflow: ellipsis;
        }
    </style>
</head>
<body>
<div class="content" style="height: 45px">
    <div style="margin-left: 100px">
        <div>
            <img src="./img/基奥沙2.png" style="height:50px;width: auto"/>
            <label style="font-size:35px;height:40px;color:#ffffff">基奥沙大学生创新创业项目管理系统</label>
        </div>
        <div style="margin-left: 1200px">
            <i class="layui-icon left-nav-li" lay-tips="1">&#xe613;</i>
            <label >
                <a href="index.jsp" style="font-size:15px;height:40px;color:#ffffff">登录/注册</a>
            </label>
        </div>
    </div>
</div>

<div class="content">
    <div style="margin-left: 80px;margin-right: 300px">
        <ul class="layui-nav layui-bg-green">
            <li class="layui-nav-item layui-this"><a href="tzgg?method=getTzgg">首页</a></li>
            <li class="layui-nav-item"><a href="tzgg?method=tz">通知公告</a></li>
            <li class="layui-nav-item"><a href="tzgg?method=xm">历届项目</a></li>
<%--            <li class="layui-nav-item">--%>
<%--                <a href="javascript:;">历届项目</a>--%>
<%--                <dl class="layui-nav-child">--%>
<%--                    <dd><a href="">2020</a></dd>--%>
<%--                    <dd><a href="">2019</a></dd>--%>
<%--                    <dd><a href="">2018</a></dd>--%>
<%--                    <dd><a href="">2017</a></dd>--%>
<%--                    <dd><a href="">2016</a></dd>--%>
<%--                    <dd><a href="">2015</a></dd>--%>
<%--                </dl>--%>
<%--            </li>--%>
            <li class="layui-nav-item"><a href="ListFileServlet">下载专区</a></li>
        </ul>
    </div>
</div>

<div class="layui-bg-gray" style="padding-left: 80px;padding-right: 80px;padding-top: 20px">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md6">
            <div class="layui-card">
                <div class="layui-card-header" style="background: gainsboro">
                    <i class="layui-icon left-nav-li" lay-tips="1">&#xe611;</i>
                    <label style="font-size: 18px">通知公告</label>
                    <a href="" style="margin-left: 75%">更多》</a>
                </div>
                <div class="layui-card-body">
                    <table width="100%">
                        <ul>
                            <c:forEach var="item" items="${tzlist}">
                                <li style="margin-top: 3px">
                                    <tr style="width: 100%">
                                        <td align="left"><a href="tzgg?method=cktz&id=${item.id}">${item.head}</a></td>
                                        <td align="right" style="font-size: 12px">${item.create_time}</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <hr>
                                        </td>
                                    </tr>
                                </li>
                            </c:forEach>
                        </ul>
                    </table>
                </div>
            </div>
        </div>
        <div class="layui-col-md6">
            <div class="layui-card">
                <div class="layui-card-header" style="background: gainsboro">
                    <i class="layui-icon left-nav-li" lay-tips="1">&#xe611;</i>
                    <label style="font-size: 18px">往届项目</label>
                    <a href="" style="margin-left: 75%">更多》</a>
                </div>
                <div class="layui-card-body">
                    <table width="100%">
                        <ul class="list-unstyled">
                            <c:forEach var="item" items="${itemlist}">
                                <li style="margin-top: 3px">
                                    <tr style="width: 100%;">
                                        <td align="left"><a href="ckljxm.jsp?item_num=${item.item_num}">${item.item_name}</a></td>
                                        <td align="right" style="font-size: 12px">${item.create_time}</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <hr>
                                        </td>
                                    </tr>

                                </li>
                            </c:forEach>
                        </ul>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="content" style="margin-top: 70px;height: 40px">
    <h3 align="center">Copyright © 石家庄铁道大学  联系地址：石家庄市北二环东路17号 邮编：050043</h3>
</div>

</body>
<script>
    layui.use('element', function(){
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

        //监听导航点击
        element.on('nav(demo)', function(elem){
            //console.log(elem)
            layer.msg(elem.text());
        });
    });
</script>
</html>
