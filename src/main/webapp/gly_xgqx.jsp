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
<form action="qxgl?method=xgPerm"  method="post">
    <div class="layui-form-item" style="margin-top: 10px">
        <input type="text" name="id" hidden="hidden" value="${perm.id}">
        <div class="layui-inline">
            <label class="layui-form-label">权限名称</label>
            <div class="layui-input-inline">
                <input type="text" name="name" lay-verify="required|phone" autocomplete="off" class="layui-input" value="${perm.name}">
            </div>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label">权限链接</label>
            <div class="layui-input-inline">
                <input type="text" name="url" lay-verify="email" autocomplete="off" class="layui-input" value="${perm.url}">
            </div>
        </div>
    </div>

    <div class="layui-form-item" >
        <div class="layui-inline">
            <label class="layui-form-label">权限描述</label>
            <div class="layui-input-inline">
                <input type="text" name="desc" lay-verify="required|phone" autocomplete="off" class="layui-input" value="${perm.desc}">
            </div>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label">所属角色</label>
            <div class="layui-input-inline">
                <select class="layui-input" name="role">
                    <option value="1">学生</option>
                    <option value="2">指导教师</option>
                    <option value="3">专家</option>
                    <option value="4">教务处管理员</option>
                </select>
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
