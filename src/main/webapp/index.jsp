<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>基奥沙大学生创新创业项目管理系统</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="./js/jquery-1.11.3.min.js"></script>
    <script src="./js/echarts.js"></script>
    <script type="text/javascript" src="login/refresh.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="layui/css/layui.css"  media="all">
    <script src="layui/layui.js" charset="utf-8"></script>
    <style type="text/css">
        .content{
            border: 1px solid #1E9FFF;
            background: #1E9FFF;
        }
        .content1{
            max-width: 1200px;
            margin: 0 auto;
            min-height: 761px;
        }
        .Ftable{
            max-width:600px;
            margin:0 auto;
            min-height:761px;
        }
        .Ltable{
            max-width:600px;
            margin:0 auto;
            margin-top: 60px;
            height: 640px;
            background-color: rgba(255, 255, 255, .15);
            box-shadow: 0 5px 15px rgb(125 136 156 / 15%);
            border: 1px solid #f0f4f7;
            border-radius: 3%;
        }
        ._input{
            width: 80%;
            padding: 0;
            margin-left: 50px;
            padding-left: 10px;
            height: 40px;
            line-height: 40px;
            border: 1px solid #e2e8ec;
            border-radius: 1px;
            border-top-left-radius: 1px;
            border-top-right-radius: 1px;
            border-bottom-right-radius: 1px;
            border-bottom-left-radius: 1px;
        }
        .zc_input{
            width: 100%;
            padding: 0;
            height: 40px;
            padding-left: 10px;
            line-height: 40px;
            border: 1px solid #e2e8ec;
            border-radius: 1px;
            border-top-left-radius: 1px;
            border-top-right-radius: 1px;
            border-bottom-right-radius: 1px;
            border-bottom-left-radius: 1px;
        }

        .dz{
            width: 100px;
            margin-left: 36px;
            margin-bottom:10px;
            height: 40px;
            padding: 0;
            line-height: 40px;
            border: 1px solid #e2e8ec;
            border-radius: 1px;
            border-top-left-radius: 1px;
            border-top-right-radius: 1px;
            border-bottom-right-radius: 1px;
            border-bottom-left-radius: 1px;
        }
    </style>
    <script>
        //表单是否提交
        var isTrueForm = false;
        $(function () {


            //手机号校验
            $("#username").keyup(function () {
                var username = $("#username").val();
                if (username.length<6){
                    $("#error").removeAttr("hidden");
                    isTrueForm =  false;
                    $("#errorspan").text("账号过短！");
                }else if(username.length>18){
                    $("#error").removeAttr("hidden");
                    isTrueForm =  false;
                    $("#errorspan").text("账号过长！")
                }
                else{
                    isTrueForm = true;
                    $("#error").attr("hidden","");
                }
            })	;

            //密码校验
            $("#mm").keyup(function () {
                var password = $("#mm").val();
                if (password.length<6){
                    $("#error").removeAttr("hidden");
                    isTrueForm =  false;
                    $("#errorspan").text("密码过短！");
                }else if(password.length>18){
                    $("#error").removeAttr("hidden");
                    isTrueForm =  false;
                    $("#errorspan").text("密码过长！")
                }
                else{
                    isTrueForm = true;
                    $("#error").attr("hidden","");
                }
            });

            //确认密码校验
            $("#qrmm").keyup(function () {
                var repassword = $("#mm").val();
                var password = $("#qrmm").val();
                if (password!=repassword){
                    $("#error").removeAttr("hidden");
                    isTrueForm =  false;
                    $("#errorspan").text("密码输入不一致！")
                }else {
                    $("#error").attr("hidden","");
                    isTrueForm = true;
                }
            });
            //确认邮箱
            $("#yx").keyup(function () {
                var yxhm = $("#yx").val();
                var isYx = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
                if (isYx.test(yxhm) === false){
                    $("#error").removeAttr("hidden");
                    isTrueForm =  false;
                    $("#errorspan").text("邮箱格式错误！")
                }else {
                    $("#error").attr("hidden","");
                    isTrueForm = true;
                }
            });
            //确认生日
            $("#sr").keyup(function () {
                var gsdm= $("#sr").val();
                if (gsdm.length<1){
                    $("#error").removeAttr("hidden");
                    isTrueForm =  false;
                    $("#errorspan").text("请选择生日！")
                }else {
                    $("#error").attr("hidden","");
                    isTrueForm = true;
                }
            });
            //确认学院
            $("#xy").keyup(function () {
                var gsdm= $("#xy").val();
                if (gsdm.length<1){
                    $("#error").removeAttr("hidden");
                    isTrueForm =  false;
                    $("#errorspan").text("学院不得为空！")
                }else {
                    $("#error").attr("hidden","");
                    isTrueForm = true;
                }
            });

            //确认专业
            $("#zy").keyup(function () {
                var gsdm= $("#zy").val();
                if (gsdm.length<1){
                    $("#error").removeAttr("hidden");
                    isTrueForm =  false;
                    $("#errorspan").text("请填写专业一栏！")
                }else {
                    $("#error").attr("hidden","");
                    isTrueForm = true;
                }
            });
            //确认年级
            $("#nj").keyup(function () {
                var gsdm= $("#nj").val();
                if (gsdm.length<1){
                    $("#error").removeAttr("hidden");
                    isTrueForm =  false;
                    $("#errorspan").text("请填写您的年级！")
                }else {
                    $("#error").attr("hidden","");
                    isTrueForm = true;
                }
            });
            //确认角色
            $("#role").keyup(function () {
                var gsdm= $("#role").val();
                alert(gsdm);
                if (gsdm==4){
                    $("#error").removeAttr("hidden");
                    isTrueForm =  false;
                    $("#errorspan").text("请选择您的角色！")
                }else {
                    $("#error").attr("hidden","");
                    isTrueForm = true;
                }
            });

        });

        //表单校验
        function validate() {

            return isTrueForm;
        }
    </script>


</head>
<body >



<div class="content">
    <div style="margin-left: 120px">
        <ul class="layui-nav layui-bg-blue">
            <li class="layui-nav-item "><a href="tzgg?method=getTzgg">首页</a></li>
            <li class="layui-nav-item layui-this"><a href="index.jsp">登入注册</a></li>

        </ul>
    </div>
</div>


<div class="content1" >
    <div class="Ftable"  style="">
        <div class="Ltable" style="">
            <label style="font-size:30px;height:40px;margin-left: 230px;margin-top: 50px;color:#46b8da" id="title" >登录</label>
            <h5 class="invisible">11</h5>
            <form id="login" method="post" action="user?method=login">
                <div class="form-group">
                    <input type="text" class="_input" name="username" placeholder="用户名">
                </div>
                <div class="form-group">
                    <input type="password" class="_input" name="pwd" placeholder="密码">
                </div>
                <div class="form-group">
                    <input type="text" class="_input"  style="width: 70%"  name="yzm" placeholder="验证码"><img src="${pageContext.request.contextPath}/login/randCode.jsp" id='shuaxin' width="10%" height="40px">
                </div>
                <h5 class="invisible">11</h5>
                <input type="submit" class="btn btn-info" value="提交" style="margin-left: 220px; width: 120px;height: 50px;font-size: 18px">
                <div class="row" style="margin-top: 50px">
                    <div class="col-md-6"> <a href="Wjmm_sfyz.jsp"><label style="font-size:16px;height:40px;color:#46b8da;margin-left: 50px;">忘记密码</label></a></div>
                    <div class="col-md-6"><a onclick="qh()"><label style="font-size:16px;height:40px;color:#46b8da;margin-left: 100px;width: 150px">万事俱备,只欠东风</label></a></div>
                </div>


            </form>



            <label style="font-size:30px;height:40px;color:#46b8da;margin-left: 250px" id="zctitle" hidden="true">注册</label>
            <label id="error" hidden>
                <span style="color: red" id="errorspan"></span>
            </label>
            <form id="zc" method="post" action="${pageContext.request.contextPath}/ZcServlet" onsubmit="return validate()" hidden="true">

                <div class="form-group" >
                    <input type="text" class="_input" id="username" name="username" placeholder="请输入账号">
                </div>
                <div class="form-group">
                    <input type="password" class="_input" id="mm" name="mm" placeholder="请输入6到18位密码">
                </div>

                <div class="form-group">
                    <input type="password" class="_input" id="qrmm" name="qrmm" placeholder="请再次输入密码">
                </div>

                <div class="form-group">
                    <input type="text" class="_input" style="width: 38%" id="xm" name="xm" placeholder="请输入您的姓名">
                    <input type="text" class="zc_input" style="width: 42%" id="yx" name="yx" placeholder="请输入您的邮箱">
                </div>

                <div class="form-group" style="margin-left: 50px;" >
                    性别:
                    <label class="radio-inline" style="font-size: 18px;margin-left: 5px">
                        <input type="radio"  name="xb" id="xb" value="男"  checked="checked"> 男
                    </label>
                    <label class="radio-inline" style="font-size: 18px;">
                        <input type="radio" name="xb" id="xb" value="女"> 女
                    </label>
                    <span style="margin-left: 50px">生日：</span>
                    <input type="date" class="zc_input" style="width: 46%" name="sr" id="sr" >
                </div>
                <div class="form-group">
                    <input type="text" class="_input" style="width: 38%" id="xy" name="xy" placeholder="请输入您所在的学院">
                    <input type="text" class="zc_input" style="width: 42%" id="zy" name="zy" placeholder="请输入您所学的专业">
                </div>
                <div class="form-group">
                    <input type="text" class="_input" style="width: 38%" id="nj" name="nj" placeholder="请输入您所在的年级">
                    <select class="zc_input" style="width: 42%"  name="role" id="role">
                        <option value="4">&nbsp;您是一名：</option>
                        <option value="0">&nbsp;学生</option>
                        <option value="1">&nbsp;指导教师</option>
                        <option value="2">&nbsp;专家</option>
                        <option value="3">&nbsp;教务处管理员</option>
                    </select>
                </div>
                <input type="submit" class="btn btn-info" value="提交" style="margin-left: 250px; width: 120px;height: 50px;font-size: 18px">
                <a onclick="qh1()"><label style="font-size:16px;height:40px;color:#46b8da;margin-left: 440px;padding-left: 10px;">已注册，返回登陆</label></a>

            </form>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    function qh(){
        $("#title").hide();
        $("#login").hide();
        $("#zctitle").show();
        $("#zc").show();
    }
    function qh1(){
        $("#title").show();
        $("#login").show();
        $("#error").hide();
        $("#zctitle").hide();
        $("#zc").hide();
    }

    function realodpage(){
        $("#shuaxin").attr("src","login/randCode.jsp?"+Math.random());
    }
    function re(){
        setTimeout("realodpage()",10);
    }
    re();

</script>


</html>