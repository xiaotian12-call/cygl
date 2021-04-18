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
<link rel="stylesheet" href="css/ystep.css">
<style>
    td{
        min-width: 100px;
    }
</style>
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
    String name=request.getParameter("item_num");

    ItemDao dao = new ItemDao();
    List<Item> jiben=dao.getXsItem3(name);
    List<ItemInfo> xsItemInfo = dao.getXsItemInfo(name);
    int i=jiben.size();
    String item_status = jiben.get(0).getItem_status();
    String[] s = jiben.get(0).getItem_contract().split("_");

    String status ="";
    String step ="";

    switch (Integer.parseInt(item_status)){
        case 1:
            status = "申请中";
            step ="1";
            break;
        case 2:
            status = "立项评审";
            step ="2";
            break;
        case 3:
            status = "已立项";
            step ="3";
            break;
        case 4:
            status = "立项失败";
            step ="3";
            break;
        case 5:
            status = "中期检查";
            step ="4";
            break;
        case 6:
            status = "带结题";
            step ="5";
            break;
        case 7:
            step ="6";
            status = "结题评审";
            break;
        case 8:
            step ="6";
            status = "结题成功";
            break;
        case 9:
            step ="6";
            status = "结题失败";
            break;
    }

    String item_level = xsItemInfo.get(0).getItem_level();

    String level="";

    switch (Integer.parseInt(item_level)){
        case 1:
            level = "无";
            break;
        case 2:
            level = "校级";
            break;
        case 3:
            level = "省级";
            break;
        case 4:
            level = "国家级";
    }

    String item_type = xsItemInfo.get(0).getItem_type();

    String type="";

    switch (Integer.parseInt(item_type)){
        case 1:
            type = "创新训练";
            break;
        case 2:
            type = "创业训练";
            break;
        case 3:
            type = "创业实践";
    }
%>
<!-- 菜单及分页容器-->
<div class="stepCont stepCont1">
    <!-- 菜单导航显示-->
    <div class='ystep-container ystep-lg ystep-blue'></div>
    <!-- 分页容器-->
    <div class="pageCont" style="display: none">
        <div id="page1" class="stepPage">
            <h1>项目申请</h1>
        </div>
        <div id="page2" class="stepPage">
            <h1>指导教师审核</h1>
        </div>
        <div id="page3" class="stepPage">
            <h1>专家评审</h1>
        </div>
        <div id="page4" class="stepPage">
            <h1>中期检查</h1>
        </div>
        <div id="page5" class="stepPage">
            <h1>结题验收</h1>
        </div>
        <div id="page6" class="stepPage">
            <h1>结题审核</h1>
        </div>
    </div>
</div>

<div class="layui-form">
    <table class="layui-table" style="padding-left: 5px;padding-right: 5px">
        <tbody>
        <tr>
            <td >项目名称</td>
            <td colspan="3">
                <%=jiben.get(0).getItem_name()%>
            </td>
        </tr>

        <tr >
            <td >项目编号</td>
            <td ><%=jiben.get(0).getItem_num() %></td>

            <td >项目负责人</td>
            <td ><%=jiben.get(0).getLeader_name()%></td>

        </tr>
        <tr >
            <td>指导教师</td>
            <td ><%=jiben.get(0).getTutor_name()%></td>

            <td>项目状态</td>
            <td ><%=status %></td>
        </tr>
        <tr>
            <td>项目级别</td>
            <td ><%=level%></td>

            <td>项目类型</td>
            <td ><%=type%></td>

        </tr>

        <tr >
            <td>校拨经费</td>
            <td ><%=xsItemInfo.get(0).getCollege_funds()%></td>

            <td>财政经费</td>
            <td ><%=xsItemInfo.get(0).getGovern_funds()%></td>
        </tr>

        <tr>
            <td >项目合同书</td>
            <td colspan="3">
                <a href="<%="DownLoadServlet?filename="+jiben.get(0).getItem_contract()%>"><%=s[1]%></a>
            </td>
        </tr>

        <tr>
            <td >项目简介</td>
            <td colspan="3">
                <textarea style="width: 100%;height: 100%" class="layui-textarea" name="summary"><%=xsItemInfo.get(0).getSummary()%></textarea>
            </td>
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
<script>
    /**
     * Created by changwang.song on 2017/12/26.
     */
    function extend(obj1,obj2){
        for(var attr in obj2){
            obj1[attr] =  obj2[attr];
        }
    }
    function SetStep(arg){
        this.body=document.body;
        this.opt = {
            show:false,
            content:'.stepCont',
            pageCont:'.pageCont',
            imgWidth:20,
            stepContainerMar:20,
            nextBtn:'.nextBtn',
            prevBtn:'.prevBtn',
            steps:['项目申请','指导教师审核','专家评审','中期检查','结题验收','结题审核'],
            //pageClass:'',//分页的类或则id
            stepCounts:6,//总共的步骤数
            curStep:<%=step%>,//当前显示第几页
            animating:false,
            showBtn:true,//是否生成上一步下一步操作按钮
            clickAble:true,//是否可以通过点击进度条的节点操作进度
            onLoad: function(){

            }
        }
        this.init(arg)
    }
    //初始化 生成页面的进度条和按钮
    SetStep.prototype.init=function(arg){
        var _that=this;
        extend(this.opt,arg);
        this.opt.stepCounts=this.opt.steps.length;
        this.content=$(this.opt.content);
        this.pageCont=this.content.find(this.opt.pageCont)
        var w_con=$(this.content).width();
        var w_li=(w_con-this.opt.stepContainerMar*2)/this.opt.stepCounts/2;
        var stepContainer=this.content.find('.ystep-container');
        this.stepContainer=stepContainer;
        var stepsHtml=$("<ul class='ystep-container-steps'></ul>");
        var stepDisc = "<li class='ystep-step ystep-step-undone'></li>";
        var stepP=$("<div class='ystep-progress'>"+
            "<p class='ystep-progress-bar'><span class='ystep-progress-highlight' style='width:0%'></span></p>"+
            "</div>");
        var stepButtonHtml =$( "<div class='step-button'><button type='button' class='btn btn-default prevBtn' id='prevBtn' class='prevBtn'>上一步</button>"+
            "<button type='button' class='btn btn-default nextBtn' id='nextBtn' class='nextBtn'>下一步</button></div>");
        stepP.css('width',w_li*2*(this.opt.stepCounts-1));
        stepP.find('.ystep-progress-bar').css('width',w_li*2*(this.opt.stepCounts-1))
        for(var i=0;i<this.opt.stepCounts;i++){
            if(i==0){
                var _s=$(stepDisc).text(this.opt.steps[i]).addClass('')
            }else{
                var _s=$(stepDisc).text(this.opt.steps[i])
            }
            stepsHtml.append(_s);
        }
        stepsHtml.find('li').css('width','110px').css('marginRight',w_li*2-110)
        stepContainer.append(stepsHtml).append(stepP);

        stepContainer.css('left',(w_con-stepP.width()-this.opt.imgWidth-10-this.opt.stepContainerMar*2)/2)
        this.content.css('overflow','hidden')
        this.setProgress(this.stepContainer,this.opt.curStep,this.opt.stepCounts)
        //判断参数 是否显示按钮 并绑定点击事件
        if(this.opt.showBtn){
            this.content.append(stepButtonHtml)
            this.prevBtn=this.content.find(this.opt.prevBtn)
            this.nextBtn=this.content.find(this.opt.nextBtn)
            this.prevBtn.on('click',function(){
                // if($(this).hasClass('handleAble')){
                if($(_that).attr('disabled')||_that.opt.animating){
                    return false;
                }else{
                    _that.opt.animating=true;
                    _that.opt.curStep--;
                    _that.setProgress(_that.stepContainer,_that.opt.curStep,_that.opt.stepCounts)
                }
            })
            this.nextBtn.on('click',function(){
                // if($(this).hasClass('handleAble')){
                if($(_that).attr('disabled')||_that.opt.animating){
                    return false;
                }else{
                    _that.opt.animating=true;
                    _that.opt.curStep++;
                    _that.setProgress(_that.stepContainer,_that.opt.curStep,_that.opt.stepCounts)
                }
            })
        }
        //判断时候可点击进度条 并绑定点击事件
        if(this.opt.clickAble){
            stepsHtml.find('li').on('click',function(){
                _that.opt.curStep=$(this).index()+1;
                _that.setProgress(_that.stepContainer,_that.opt.curStep,_that.opt.stepCounts)
            })
        }
        $(window).resize(function(){
            var w_con=$(_that.content).width();
            var w_li=w_con/_that.opt.stepCounts/2;
            stepP.css('width',w_li*2*(_that.opt.stepCounts-1));
            stepP.find('.ystep-progress-bar').css('width',w_li*2*(_that.opt.stepCounts-1))
            stepsHtml.find('li').css('width','40px').css('marginRight',w_li*2-40)
            stepContainer.css('left',(w_con-stepP.width()-_that.opt.imgWidth-10-_that.opt.stepContainerMar*2)/2)
        })
    }
    //设置进度条
    SetStep.prototype.setProgress=function(n,curIndex,stepsLen){
        var _that=this;
        //获取当前容器下所有的步骤
        var $steps = $(n).find("li");
        var $progress =$(n).find(".ystep-progress-highlight");
        //判断当前步骤是否在范围内
        if(1<=curIndex && curIndex<=$steps.length){
            //更新进度
            var scale = "%";
            scale = Math.round((curIndex-1)*100/($steps.length-1))+scale;
            $progress.animate({
                width: scale
            },{
                speed: 1000,
                done: function() {
                    //移动节点
                    $steps.each(function(j,m){
                        var _$m = $(m);
                        var _j = j+1;
                        if(_j < curIndex){
                            _$m.attr("class","ystep-step-done");
                        }else if(_j === curIndex){
                            _$m.attr("class","ystep-step-active");
                        }else if(_j > curIndex){
                            _$m.attr("class","ystep-step-undone");
                        }
                    })
                    if(_that.opt.showBtn){
                        if(curIndex==1){
                            _that.prevBtn.attr('disabled','true')
                            _that.nextBtn.removeAttr('disabled')
                        }else if(curIndex==stepsLen){
                            _that.prevBtn.removeAttr('disabled')
                            _that.nextBtn.attr('disabled','true')
                        }else if(1<curIndex<stepsLen){
                            _that.prevBtn.removeAttr('disabled')
                            _that.nextBtn.removeAttr('disabled')
                        }
                    }
                    _that.checkPage(_that.pageCont,_that.opt.curStep,_that.opt.stepCounts)
                    _that.opt.animating=false;
                }
            });
        }else{
            return false;
        }
    }
    //改变 分页显示
    SetStep.prototype.checkPage=function(pageCont,curStep,steps){
        for(var i = 1; i <= steps; i++){
            if(i === curStep){
                pageCont.find('#page'+i).css("display","block");
            }else{
                pageCont.find('#page'+i).css("display","none");
            }
        }
    }
</script>
<script>
    var step1=new SetStep({
        content:'.stepCont1',
        showBtn:false,
    })
    var step2=new SetStep({
        content:'.stepCont2',
        clickAble:false
    })
    var step3=new SetStep({
        content:'.stepCont3'
    })
</script>
</html>
