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

            //密码校验
            $("#mm").keyup(function () {
                var password = $("#mm").val();
                if (password.length<1){
                    $("#error").removeAttr("hidden");
                    isTrueForm =  false;
                    $("#errorspan").text("请完整输入表单！");
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
            <label style="font-size:30px;height:40px;margin-left: 50px;margin-top: 50px;color:#46b8da" id="title" >二、修改密码</label>
            <label id="error" hidden>
                <span style="color: red" id="errorspan"></span>
            </label>
            <form id="login" method="post" action="Wjmm_xgmm" onsubmit="return validate()">
                <div class="form-group">
                    <input type="password" class="_input" name="mm" id="mm" placeholder="请输入新的密码">
                </div>
                <div class="form-group">
                    <input type="password" class="_input" name="qrmm" id="qrmm" placeholder="确认密码">
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