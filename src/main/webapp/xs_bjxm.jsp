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
<form action="item?method=xsXmSq" enctype="multipart/form-data" method="post">
    <div class="layui-form-item" style="margin-top: 10px">
        <div class="layui-inline">
            <label class="layui-form-label">项目名称</label>
            <div class="layui-input-inline">
                <input type="text" name="item_name" lay-verify="required|phone" autocomplete="off" class="layui-input" value="${item.item_name}">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">项目负责人</label>
            <div class="layui-input-inline">
                <input type="text" name="leader_name" lay-verify="email" autocomplete="off" class="layui-input" value="${item.leader_name}">
            </div>
        </div>
    </div>

    <div class="layui-form-item" >
        <div class="layui-inline">
            <label class="layui-form-label">项目负责人学号</label>
            <div class="layui-input-inline">
                <input type="text" name="leader_num" lay-verify="required|phone" autocomplete="off" class="layui-input" value="${item.leader_num}">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">指导老师姓名</label>
            <div class="layui-input-inline">
                <input type="text" name="tutor_name" lay-verify="email" autocomplete="off" class="layui-input" value="${item.tutor_name}">
            </div>
        </div>
    </div>

    <div class="layui-form-item" >
        <div class="layui-inline">
            <label class="layui-form-label">指导老师职工号</label>
            <div class="layui-input-inline">
                <input type="text" name="tutor_num" lay-verify="required|phone" autocomplete="off" class="layui-input" value="${item.tutor_num}">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">校拨经费</label>
            <div class="layui-input-inline">
                <input type="text" name="college_funds" lay-verify="email" autocomplete="off" class="layui-input" value="${itemInfo.college_funds}">
            </div>
        </div>
    </div>

    <div class="layui-form-item" >
        <div class="layui-inline">
            <label class="layui-form-label">项目级别</label>
            <div class="layui-input-inline">
                <input type="text" name="item_level" lay-verify="email" autocomplete="off" class="layui-input" value="${itemInfo.item_level}">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">项目类型</label>
            <div class="layui-input-inline">
                <input type="text" name="item_type" lay-verify="email" autocomplete="off" class="layui-input" value="${itemInfo.item_type}">
            </div>
        </div>
    </div>

    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">项目简介</label>
        <div class="layui-input-block">
            <textarea class="layui-textarea" name="summary">${itemInfo.summary}</textarea>
        </div>
    </div>
    <div class="layui-form-item" >
        <div class="layui-inline">
            <label class="layui-form-label">项目合同书</label>
            <div class="layui-input-inline">
                <input type="file" name="item_contract" autocomplete="off" class="layui-btn">
            </div>
        </div>


    </div>

    <div class="layui-form-item" >

        <div class="layui-inline">
            <label class="layui-form-label">项目结题报告</label>
            <div class="layui-input-inline">
                <input type="file" name="item_concluding_report" autocomplete="off" class="layui-btn">
            </div>
        </div>

    </div>

    <div class="layui-form-item" >

        <div class="layui-inline" style="margin-left: 150px">
            <input type="submit" class="layui-btn" value="立即申请"/>
        </div>
    </div>
</form>
</body>
</html>
