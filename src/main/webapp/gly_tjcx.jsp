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
<form class="layui-form" action="#" method="post" onsubmit="return tableReload()">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">项目名称</label>
            <div class="layui-input-inline">
                <input type="text" id="item_name" lay-verify="required|phone" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">项目负责人</label>
            <div class="layui-input-inline">
                <input type="text" id="leader_name" lay-verify="required|phone" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">指导教师</label>
            <div class="layui-input-inline">
                <input type="text" id="tutor_name" lay-verify="required|phone" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item" >
        <div class="layui-inline">
            <label class="layui-form-label">项目级别</label>
            <div class="layui-input-inline">
                <select class="layui-input" id="item_level">
                    <option value="0">请选择</option>
                    <option value="1">无</option>
                    <option value="2">校级</option>
                    <option value="3">省级</option>
                    <option value="4">国家级</option>
                </select>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">项目类型</label>
            <div class="layui-input-inline">
                <select class="layui-input" id="item_type">
                    <option value="0">请选择</option>
                    <option value="1">创新训练</option>
                    <option value="2">创业训练</option>
                    <option value="3">创业实践</option>
                </select>
            </div>
        </div>

        <div class="layui-inline" style="margin-left: 50px">
            <input type="submit" class="layui-btn" value="查询" id="cx"/>
        </div>
    </div>
</form>

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
            ,url:'tjcx?method=getAllItem'
            ,cols: [[
                {field:'item_num',  title: '项目编号'}
                ,{field:'item_name',  title: '项目名称'}
                ,{field:'leader_name',  title: '负责人'}
                ,{field:'leader_num',  title: '负责人学号'}
                ,{field:'tutor_name',  title: '指导教师'}
                ,{field:'item_date',  title: '申报时间'}
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
                    area: ['1000px', '530px'],
                    title: '查看项目信息',
                    shadeClose: true, //点击遮罩关闭
                    content: 'xs_ckxmxx.jsp?item_num='+data.item_num,
                });
                //layer.msg('ID：'+ data.zjhm + ' 的查看操作');

            } else if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){

                    $.ajax({
                        "async":true,
                        "url":"item?method=deleteXm",
                        "data":{"num":data.item_num},
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
                    area: ['800px', '630px'],
                    title: '编辑项目信息',
                    shadeClose: true, //点击遮罩关闭
                    content: 'item?method=getXmxx2&num='+data.item_num,
                });
                //layer.alert('编辑行：<br>'+ JSON.stringify(data))
            }
        });

    });
</script>

<script>
    function tableReload(){
        var item_name = $("#item_name").val()
        var leader_name = $("#leader_name").val()
        var tutor_name = $("#tutor_name").val()
        var item_level = $("#item_level").val()
        var item_type = $("#item_type").val()

        layui.use('table', function(){
            var table = layui.table;


            table.render({
                elem: '#test'
                ,url:'tjcx?method=seachItem&item_name='+item_name+"&leader_name="+leader_name+"&tutor_name="+tutor_name+"&item_level="+item_level+"&item_type="+item_type
                ,cols: [[
                    {field:'item_num',  title: '项目编号'}
                    ,{field:'item_name',  title: '项目名称'}
                    ,{field:'leader_name',  title: '负责人'}
                    ,{field:'leader_num',  title: '负责人学号'}
                    ,{field:'tutor_name',  title: '指导教师'}
                    ,{field:'item_date',  title: '申报时间'}
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
                        area: ['1000px', '530px'],
                        title: '查看项目信息',
                        shadeClose: true, //点击遮罩关闭
                        content: 'xs_ckxmxx.jsp?item_num='+data.item_num,
                    });
                    //layer.msg('ID：'+ data.zjhm + ' 的查看操作');

                } else if(obj.event === 'del'){
                    layer.confirm('真的删除行么', function(index){

                        $.ajax({
                            "async":true,
                            "url":"item?method=deleteXm",
                            "data":{"num":data.item_num},
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
                        area: ['800px', '630px'],
                        title: '编辑项目信息',
                        shadeClose: true, //点击遮罩关闭
                        content: 'item?method=getXmxx2&num='+data.item_num,
                    });
                    //layer.alert('编辑行：<br>'+ JSON.stringify(data))
                }
            });

        });
        return false;
    }
</script>

</body>
</html>
