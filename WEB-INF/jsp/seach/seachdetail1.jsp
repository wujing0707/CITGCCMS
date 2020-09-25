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
            <h2><em></em>信用查询</h2>
            <ul>
                <li><a href="../html1/seach.html">社会法人信用查询</a></li>
                <li style="display:none"><a href="fqyseach.html">非企业信用查询</a></li>
                <li><a href="../html1/personalseach.html">重点人群信用查询</a></li>
                 <li><a href="../html1/creditcheck.html">信用核查</a></li>
                <li><a href="http://172.25.106.6:8080/creditVerification/tocreditVerification.action?UTYPE=P&IDCODE=137810039">我的信用核查</a></li>
            </ul>
        </div>
        
        <div class="left_other mt5"><a href="../html1/qycomplain.html">异议申诉</a></div>
        <div class="left_other mt5 bg_co2"><a href="">信用服务</a></div>
        
    </div>
    <!--left over-->
    <!--right begin-->
    <div class="right f_r">
    	<div class="tit1 right_tit"><b>社会法人信用查询</b></div>
        <div class="pad30">
            <div class="z_title">${companyName}</div>
            <div class="tab_tit"><span>基础信息</span></div>
            <table cellspacing="0" cellpadding="0" class="tablelist tablelist0" id="">
                <tbody>
                 <c:forEach items="${map}" var="entry" varStatus="v"> 
             <c:if test="${v.count%2==1}">
              <tr>
                <th width="15%"><font color="black">${entry.key}</font></th>
                <td><font color="black">${entry.value}</font></td>
              </c:if>
              <c:if test="${v.count%2==0}">
                <th width="15%"><font color="black">${entry.key}</font></th>
                <td><font color="black">${entry.value}</font></td>
              </tr>
               </c:if>
               <c:if test="${v.count%2==1&&v.last==true}">
                <th width=""></th>
                <td></td>
               </tr>
               </c:if>
              </c:forEach> 
                </tbody>
              </table>
              
            <div class="tab_tit mt50"><span>信用信息</span><em>（包含：行政审批信息、失信行为信息、荣誉表彰信息、履行约定信息、参保信息、其他信息）</em></div>
            <table class="tablelist ">
                <thead>
                </thead>
                <tbody>
                <tr>
                <th width="10%"><font color="black">序号</font></th>
                <th width="65%"><font color="black">数据分类</font></th>
                <th width="25%"><font color="black">信息量</font></th>
                </tr>
                <c:forEach items="${map1}" var="entry"  varStatus="v">
                <tr>
                <td class="tc"><font color="black">${v.count}</font></td>
                <td><font color="black">${entry.key}</font></td>
                <td><font color="black">共${entry.value}条信息</font></td>
                </tr> 
                </c:forEach>
                
                </tbody>
            </table>
            
        </div> 
        
    </div>
    <!--right over-->
</div>
<!--content over-->

<!--footer begin-->
<!--footer over-->
    
</body>
</html>
