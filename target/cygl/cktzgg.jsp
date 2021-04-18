<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2021/4/17
  Time: 17:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <script src="./layui/layui.js" charset="utf-8"></script>
    <style>
        .content{
            border: 1px solid #f0f4f9;
            box-shadow: 0 5px 15px rgb(125 136 156 / 15%);
        }
    </style>
</head>
<body>
    <div class="content" style="width: 1200px;height: auto; margin-left: 10%">
        <div class="gd-container content" style="height: 60px;">
            <div class="gd-main">
                <div class="gd-nav" style="margin-top: 15px">
            <span style="font-size: 20px;margin-top: 20px;margin-left: 20px">
                <a href="tzgg?method=getTzgg" style="color: #8798ff; font-size: 20px;">首页</a>&nbsp;>>&nbsp;
                <a href="tzgg?method=tz" style="color: #8798ff; font-size: 20px;">通知公告</a>
                >>详情
            </span>
                </div>
                <div class="gd-content">

                </div>
            </div>
        </div>
        <h1 align="center" style="align-self: center">${tzgg.head}</h1>
        <table width="30%" style="margin-left: 30%">
            <tr  width="30%">
                <td align="left">
                    时间：${tzgg.create_time}
                </td>
                <td align="right">
                    来源：${tzgg.publisher}
                </td>
            </tr>
        </table>

        <hr style="width: 90%">

        <div style="margin-left: 60px;margin-right: 60px;padding-bottom: 30px">
            ${tzgg.content}
        </div>
    </div>
</body>
</html>
