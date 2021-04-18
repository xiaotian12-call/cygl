<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>人力资源系统登录</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="./js/jquery-1.11.3.min.js"></script>
    <script src="./js/echarts.js"></script>
    <script type="text/javascript" src="login/refresh.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js" type="text/javascript"></script>
    <style type="text/css">
        .content{
            border: 1px solid #f0f4f9;
            box-shadow: 0 5px 15px rgb(125 136 156 / 15%);
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
            //确认邮箱
            $("#email").keyup(function () {
                var yxhm = $("#email").val();
                if (yxhm.length<1){
                    $("#error").removeAttr("hidden");
                    isTrueForm =  false;
                    $("#errorspan").text("请完整输入表单！")
                }else {
                    $("#error").attr("hidden","");
                    isTrueForm = true;
                }
            });
            $("#username").keyup(function () {
                var yxhm = $("#username").val();
                if (yxhm.length<1){
                    $("#error").removeAttr("hidden");
                    isTrueForm =  false;
                    $("#errorspan").text("请完整输入表单！")
                }else {
                    $("#error").attr("hidden","");
                    isTrueForm = true;
                }
            });
            $("#xm").keyup(function () {
                var yxhm = $("#xm").val();
                if (yxhm.length<1){
                    $("#error").removeAttr("hidden");
                    isTrueForm =  false;
                    $("#errorspan").text("请完整输入表单！")
                }else {
                    $("#error").attr("hidden","");
                    isTrueForm = true;
                }
            });
            $("#yzm").keyup(function () {
                var yxhm = $("#yzm").val();
                if (yxhm.length<1){
                    $("#error").removeAttr("hidden");
                    isTrueForm =  false;
                    $("#errorspan").text("请完整输入表单！")
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

<div class="content1" >
    <div class="Ftable"  >
        <div class="Ltable" >
            <label style="font-size:30px;height:40px;margin-left: 50px;margin-top: 50px;color:#46b8da" id="title" >一、身份验证</label>
            <label id="error" hidden>
                <span style="color: red" id="errorspan"></span>
            </label>
            <h5 class="invisible">11</h5>
            <form id="login" method="post" action="WjmmServlet" onsubmit="return validate()">
                <div class="form-group">
                    <input type="text" class="_input" name="username" id="username" placeholder="用户名">
                </div>
                <div class="form-group">
                    <input type="text" class="_input" name="xm" id="xm" placeholder="姓名">
                </div>
                <div class="form-group">
                    <input type="text" class="_input" name="email" id="email" placeholder="邮箱">
                </div>
                <div class="form-group">
                    <input type="text" class="_input"  style="width: 70%"  name="yzm" placeholder="验证码"><img src="${pageContext.request.contextPath}/login/randCode.jsp" id='shuaxin' width="10%" height="40px">
                </div>
                <h5 class="invisible">11</h5>
                <input type="submit" class="btn btn-info" value="提交" style="margin-left: 220px; width: 120px;height: 50px;font-size: 18px">
            </form>




        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    function realodpage(){
        $("#shuaxin").attr("src","login/randCode.jsp?"+Math.random());
    }
    function re(){
        setTimeout("realodpage()",10);
    }
    re();

</script>

</html>