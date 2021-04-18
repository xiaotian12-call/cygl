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
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
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
            ,url:'user?method=gatAllUser'
            ,cols: [[
                {field:'id',  title: '学号'}
                ,{field:'username',  title: '用户名'}
                ,{field:'name',  title: '姓名'}
                ,{field:'sr',  title: '生日'}
                ,{field:'xy',  title: '学院'}
                ,{field:'zy',  title: '专业'}
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
                    title: '查看用户信息',
                    shadeClose: true, //点击遮罩关闭
                    content: 'gly_ckyhxx.jsp?id='+data.id,
                });
                //layer.msg('ID：'+ data.zjhm + ' 的查看操作');

            } else if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){

                    $.ajax({
                        "async":true,
                        "url":"user?method=deleteYg",
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
                    area: ['750px', '360px'],
                    title: '修改用户信息',
                    shadeClose: true, //点击遮罩关闭
                    content: 'user?method=getYhxx&id='+data.id,
                });
                //layer.alert('编辑行：<br>'+ JSON.stringify(data))
            }
        });

    });
</script>



</body>
</html>
