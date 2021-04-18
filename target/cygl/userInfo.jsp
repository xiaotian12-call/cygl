<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2021/4/11
  Time: 10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
</head>
<script src="./js/jquery-1.11.3.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="layui/css/layui.css"  media="all">
<script src="layui/layui.js" charset="utf-8"></script>
<body>
<form action="user?method=xgYhxx2"  method="post">
    <div class="layui-form-item" style="margin-top: 10px">
        <div class="layui-inline">
            <label class="layui-form-label">学号</label>
            <div class="layui-input-inline">
                <input type="text" name="id" lay-verify="required|phone" autocomplete="off" class="layui-input" value="${yhxx.id}">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline">
                <input type="text" name="name" lay-verify="email" autocomplete="off" class="layui-input" value="${yhxx.name}">
            </div>
        </div>
    </div>

    <div class="layui-form-item" >
        <div class="layui-inline">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-inline">
                <input type="text" name="sex" lay-verify="required|phone" autocomplete="off" class="layui-input" value="${yhxx.sex}">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-inline">
                <input type="text" name="username" lay-verify="email" autocomplete="off" class="layui-input" value="${yhxx.username}">
            </div>
        </div>
    </div>

    <div class="layui-form-item" >
        <div class="layui-inline">
            <label class="layui-form-label">生日</label>
            <div class="layui-input-inline">
                <input type="text" name="sr" lay-verify="required|phone" autocomplete="off" class="layui-input" value="${yhxx.sr}">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">学院</label>
            <div class="layui-input-inline">
                <input type="text" name="xy" lay-verify="email" autocomplete="off" class="layui-input" value="${yhxx.xy}">
            </div>
        </div>
    </div>

    <div class="layui-form-item" >
        <div class="layui-inline">
            <label class="layui-form-label">专业</label>
            <div class="layui-input-inline">
                <input type="text" name="zy" lay-verify="email" autocomplete="off" class="layui-input" value="${yhxx.zy}">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">年级</label>
            <div class="layui-input-inline">
                <input type="text" name="nj" lay-verify="email" autocomplete="off" class="layui-input" value="${yhxx.nj}">
            </div>
        </div>
    </div>

    <div class="layui-form-item" >

        <div class="layui-inline" style="margin-left: 150px">
            <input type="submit" class="layui-btn" value="修改"/>
        </div>
    </div>
</form>
</body>
</html>
