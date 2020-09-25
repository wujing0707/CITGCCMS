<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
function seachContent(cid){
 	var title=document.getElementById("title").value;;
 	if(title==""){
 		return;
 	}else{
 		window.location.href="<%=basePath %>content/listContentByChannelId.action?channelid="+cid+"&title="+title;   
 	}
 }
</script>
</head>
<!--header over-->
<body>
<!--header begin-->
<div class="wrap header">
	<div class="logo"><a href="../html1/index.html"><img src="<%=basePath %>html1/images/logo.png" /></a></div>
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
            <h2><em></em>${channelName}</h2>
            <ul>
            <c:if test="${not empty channelList}">
            <c:forEach items="${channelList}" var="channel" varStatus="vs">
            <li><a href="<%=basePath %>html1/content${channel.channelId}_1.html">${channel.name}</a></li>  
            </c:forEach>
            </c:if>
            </ul>
        </div>
        
        <div class="left_other mt5"><a href="../html1/qycomplain.html">异议申诉</a></div>
        <div class="left_other mt5 bg_co2"><a href="#" target="_blank">信用服务</a></div>
        
    </div>
    <!--left over-->
    <!--right begin-->
    <div class="right f_r">
    	<div class="tit1 right_tit"><b>${soncName}</b>&emsp;&nbsp;&nbsp;&nbsp;<input type="text" id="title" name="title"/>&emsp;&nbsp;<input type="button" value="搜索" onClick="seachContent('${channelid}')"/><span>当前位置： <a href="">${channelName}</a> >  ${soncName} </span></div>
        <div class="pad10">
            <ul class="list inlist">
            <c:if test="${not empty contentList}">
            <c:forEach items="${contentList}" var="content" varStatus="vs">
                <li><a href="<%=basePath %>html1/condetail${content.contentId}.html">${content.title}</a><span>${fn:substring(content.releaseTime,0,10)}</span></li>
            </c:forEach>
            </c:if>
            </ul>
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
