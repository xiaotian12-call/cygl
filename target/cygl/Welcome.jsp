<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Insert title here</title>
    <link href="layui/css/layui.css" rel="stylesheet">

    <script src="./js/jquery-1.11.3.min.js"></script>

    <script src="./js/echarts.min.js"></script>

    <script src="./js/bootstrap.min.js"></script>
    <style type="text/css">

        .father{
            margin-top:10px;
            margin-left:10px;
            margin-right:10px;
            background-color: rgba(255, 255, 255, .15);
            box-shadow: 0 5px 15px rgb(125 136 156 / 15%);
            border: 1px solid #f0f4f7;
            border-radius: 3%;
        }
    </style>
</head>
<body>
<div style="float:left;width:48%;height:500px;" class="father">
    <div id="zzt" style="width:80%;height: 400px;margin-top: 10px">
    </div>
</div>




<div style="float:right;width:48%;height:500px;" class="father">
    <div id ="bzt" style="width:80%;height: 400px;margin-top: 10px" >
    </div>

    <form method="post" action="WelcomeServlet" class="form-inline" style="margin-left: 30px">
        <select class="layui-input"  style="width:20%" name="Year" >
            <c:forEach items="${list}" var="item">
                <option>${item.year}</option>
            </c:forEach>
        </select>
        <input type="submit" class="layui-btn" value="搜索" style="margin-left: 160px;margin-top: -60px">
    </form>

</div>

<div style="float:left;width:96%;height:500px;" class="father">
    <div id="jdb" style="width:80%;height: 400px;margin-top: 10px">
    </div>
</div>


<script type="text/javascript">
    $(function() {

        var jdb = echarts.init(document.getElementById('jdb'));
        optionjdb = {
            title: {
                text: '本届参赛项目进度',
                left: 'center'
            },
            xAxis: {
                type: 'category',
                data: ['项目申请','指导教师审核','专家评审','中期检查','结题验收','结题审核','立项失败','结题失败']
            },
            yAxis: {
                type: 'value'
            },
            series: [{
                data: [2, 5, 5, 9, 2, 1,13,0],
                type: 'bar'
            }]
        };

        jdb.setOption(optionjdb)









            // 	window.location.href='${pageContext.request.contextPath}/WelcomeServlet';
            var myChart = echarts.init(document.getElementById('zzt'));
            var arr = new Array();
            var index = 0;
            <c:forEach items="${list}" var="item">
            arr[index++] = ${item.count};
            </c:forEach>
            // 指定图表的配置项和数据
            var option = {
                title: {
                    text: '历届参赛项目数量统计',
                    left: 'center'
                },
                tooltip: {
                    show: true
                },

                xAxis : [
                    {
                        type : 'category',
                        axisLabel:{
                            interval:0,//横轴信息全部显示  
                            rotate:40,//-30度角倾斜显示  
                        },
                        data : [
                            <c:forEach items="${list}" var="item">
                            ["${item.year}"],
                            </c:forEach>
                        ]
                    }
                ],
                yAxis : [
                    {
                        type : 'value'
                    }
                ],
                series : [
                    {
                        name:'参赛团对数',
                        type:'line',
                        data: arr

                    }
                ]
            };


        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
        //饼状图
        var myChart = echarts.init(document.getElementById('bzt'));
        var arr = new Array();
        var index = 0;
        <c:forEach items="${listtb}" var="item">
        arr[index++] = ${item.count};
        </c:forEach>
        var option = {
            title: {
                text: '${Yeartb}年参赛队伍学院分布',
                left: 'center'
            },
            tooltip: {
                trigger: 'item',
                formatter: '{b} : {c}%'
            },

            series: [
                {
                    name: '访问来源',
                    type: 'pie',
                    radius: '50%',
                    avoidLabelOverlap: false,
                    label: {
                        show: true,
                        position: 'outside'
                    },
                    emphasis: {
                        label: {
                            show: true,
                            fontSize: '30',
                            fontWeight: 'bold'
                        }
                    },
                    labelLine: {
                        show: true
                    },
                    data: [
                        <c:forEach items="${listtb}" var="item">
                        {value: '${item.count}', name: '${item.xy}'},
                        </c:forEach>
                    ]
                }
            ]
        };
        myChart.setOption(option);
    });


</script>
</body>


</html>