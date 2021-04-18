<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2020/12/7
  Time: 12:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ page import="com.me.dao.*"
         import="com.me.domain.*"
         import="java.util.ArrayList"
         import ="java.util.List"%>
<%@ page import="com.me.dao.*" %>
<%@ page import="com.me.domain.*" %>
<html>
<head>
    <title>基本信息</title>
</head>
<link rel="stylesheet" href="layui/css/layui.css">
<script src="layui/layui.js"></script>
<script src="js/jquery-1.11.3.min.js"></script>
<body>

<%
    Object message = request.getAttribute("message");
    if(message!=null && !"".equals(message)){

%>
<script type="text/javascript">
    alert("<%=request.getAttribute("message")%>");
</script>
<%} %>

<%
    String name=request.getParameter("id");

    Userdao dao = new Userdao();
    List<User> jiben=dao.getUser(name);
    int i=jiben.size();

    String sex = jiben.get(0).getSex();
    String xb = "";
    if (sex.equals("1")){
        xb = "男";
    }else {
        xb = "女";
    }

%>

<div >
    <table class="layui-table" style="padding-left: 5px;padding-right: 5px">
        <tbody>
        <tr>
            <td>学号</td>
            <td >
                <%=jiben.get(0).getId()%>
            </td>
            <td>姓名</td>
            <td >
                <%=jiben.get(0).getName()%>
            </td>
        </tr>

        <tr >
            <td >用户名</td>
            <td ><%=jiben.get(0).getUsername() %></td>

            <td >性别</td>
            <td ><%=xb%></td>

        </tr>
        <tr >
            <td>年级</td>
            <td ><%=jiben.get(0).getNj()%></td>

            <td>专业</td>
            <td ><%=jiben.get(0).getZy()%></td>
        </tr>
        <tr>
            <td>学院</td>
            <td ><%=jiben.get(0).getXy()%></td>

            <td>生日</td>
            <td ><%=jiben.get(0).getSr()%></td>

        </tr>

    </table>
</div>

</body>
<script>
    function overFn(obj){
        $(obj).css("background","#DBEAF9");
    }
    function outFn(obj){
        $(obj).css("background","#fff");
    }

    function clickFn(obj){
        $("#qymc").val($(obj).html());
        $("#showDiv").css("display","none");
    }
    function searchWord(){
        //let qymc = document.getElementById("qymc").value;
        var qymc = $("#qymc").val();
        //alert(name)
        var content = "";
        $.post(
            "${pageContext.request.contextPath}/jbxx?method=searchName",
            {"word":qymc},
            function(data){
                if(data.length>0){
                    //alert(data[0].value)
                    for(var i=0;i<data.length;i++){
                        //alert(data[i])
                        content+="<div style='padding:5px;cursor:pointer' onclick='clickFn(this)' onmouseover='overFn(this)' onmouseout='outFn(this)'>"+data[i]+"</div>";
                    }
                    $("#showDiv").html(content);
                    $("#showDiv").css("display","block");
                }

            },
            "json"
        );

    }
</script>
</html>
