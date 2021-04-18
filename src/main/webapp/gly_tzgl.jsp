<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2021/4/10
  Time: 16:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script src="./js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="layui/css/layui.css"  media="all">
    <script src="layui/layui.js" charset="utf-8"></script>

</head>
<body>
<div class="layui-btn-group demoTable">



    <div class="layui-form-item" style="margin-top: 10px;margin-bottom: -10px">

        <button id="addYg" class="layui-btn" style="display: none"> 立即申请项目 </button>

    </div>
</div>

<table class="layui-table" id="test" lay-filter="demo"></table>

<script type="text/html" id="barDemo">
    <%--    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>--%>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script>

    layui.use('layer', function () {
        var layer = layui.layer;
        $('#addYg').on('click', function () {
            layer.open({
                type: 2,
                area: ['750px', '560px'],
                title: '申请项目',
                shadeClose: true, //点击遮罩关闭
                content: 'xs_sqxm.jsp',
            });

        });

    });

</script>


<script>

    layui.use('table', function(){
        var table = layui.table;


        table.render({
            elem: '#test'
            ,url:'tzgg?method=getData'
            ,cols: [[
                {field:'id',  title: '通知编号'}
                ,{field:'head',  title: '通知标题'}
                ,{field:'content',  title: '通知内容'}
                ,{field:'pubdate',  title: '发布时间'}
                ,{field:'right', title: '操作',width:200, toolbar:"#barDemo"}

            ]]
            ,page: true
            ,limit:10
        });

        //监听工具条
        table.on('tool(demo)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                layer.open({
                    type: 2,
                    area: ['500px', '250px'],
                    title: '查看通知信息',
                    shadeClose: true, //点击遮罩关闭
                    content: 'gly_ckyhxx.jsp?id='+data.id,
                });
                //layer.msg('ID：'+ data.zjhm + ' 的查看操作');

            } else if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){

                    $.ajax({
                        "async":true,
                        "url":"qxgl?method=deletePerm",
                        "data":{"id":data.id},
                        "type":"POST",
                        "dataType":"json",
                        "success":function(data){
                            var f = data.f;
                            if(f){
                                alert("删除成功");
                            }else{
                                alert("删除失败");
                            }
                        }
                    });
                    obj.del();
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){
                layer.open({
                    type: 2,
                    area: ['400px', '430px'],
                    title: '修改通知信息',
                    shadeClose: true, //点击遮罩关闭
                    content: 'qxgl?method=getPermxx&id='+data.id,
                });
                //layer.alert('编辑行：<br>'+ JSON.stringify(data))
            }
        });

    });
</script>



</body>
</html>
