<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>诚信园区</title>
<link type="text/css" href="<%=basePath %>html1/css/common.css" rel="stylesheet" />
<script>
function show(str){
	if(str!=""){
		var id=document.getElementById(str+"_0").value;
		window.location.href="<%=basePath %>html1/content"+id+"_1.html"; 
	}
}
</script>
</head>
<!--header over-->
<body>
<!--header begin-->
<div class="wrap header">
	<div class="logo"><a href="index.html"><img src="<%=basePath %>html1/images/logo.png" /></a></div>
    <div class="nav">
        <ul>
            <li><a href="../html1/index.html">首页</a></li>
        <c:if test="${not empty listChannel}">
        <c:forEach items="${listChannel}" var="channel" varStatus="vs">  
        <c:if test="${(channel.channelId!=1)&&(channel.channel.channelId==1)}">
        <li><a href="javascript:void(0)" onclick='show("${channel.channelId}")'>${channel.name}</a></li>
         <c:forEach items="${channel.channels}" var="cc"  varStatus="v">
       		<c:if test="${not empty cc}">
       		<input type="hidden" id="${channel.channelId}_${v.index}" value="${cc.channelId}">
        	</c:if>
         </c:forEach>
        </c:if>
        </c:forEach>
        </c:if>
        </ul>
    </div>
</div>
<!--content begin-->
<div class="wrap mt5">
    <!--left begin-->
    <div class="leftbox f_l">
        <div class="left_menu">
            <h2><em></em>信用查询</h2>
            <ul>
                <li><a href="../html1/seach.html">社会法人信用查询</a></li>
                <li style="display:none"><a href="fqyseach.html">非企业信用查询</a></li>
                <li><a href="../html1/personalseach.html">重点人群信用查询</a></li>
            </ul>
        </div>
        
        <div class="left_other mt5"><a href="qycomplain.html">异议申诉</a></div>
        <div class="left_other mt5 bg_co2"><a href="#" target="_blank">信用服务</a></div>
        
    </div>
    <!--left over-->
    <!--right begin-->
    <div class="right f_r">
    	<div class="tit1 right_tit"><b>重点人群信用详细</b></div>
        <div class="pad30">
            <table class="tablelist ">
                <tbody>
                <tr>
                <th width="15%">姓名</th>
                <td>${name}</td>
                </tr>
                <tr>
                <th>身份证号码</th>
                <td>${sfzh}</td>
                </tr> 
                <tr>
                <th>职业证号</th>
                <td>${zyzh}</td>
                </tr>
                </tbody>
            </table>
        </div> 
    </div>
    <!--right over-->
</div>
<!--content over-->

<!--footer begin-->
<div class="wrap mt5">
	<div class="pad10  nylink">
        <h1>友情链接</h1>
        <ul class="pad10">
            <li><a href="#" target="_blank">中国苏州</a></li>
            <li><a href="#" target="_blank">中国苏州</a></li>
            <li><a href="#" target="_blank">中国苏州</a></li>
            <li><a href="#" target="_blank">中国苏州</a></li>
        </ul>
    </div>
</div>

<div class="wrap mt5 foot">
	<div class="pad10">
    	<span>主办单位：********** </span><span>承办单位：**********</span><span>技术支持：江苏中集科技有限公司</span>
    </div> 
</div>
<!--footer over-->
    
</body>
</html>
