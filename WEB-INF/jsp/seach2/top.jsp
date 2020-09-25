<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
<title>诚信园区</title>
<link type="text/css" href="<%=basePath %>html2/css/common.css" rel="stylesheet" />
<script type="text/javascript" src="<%=basePath%>js/jquery-1.7.2.js"></script>
<script type="text/javascript">

function show(str){
		var id=document.getElementById(str+"_0").value;
		window.location.href='<%=basePath %>html2/content'+id+"_1.html"; 
}
function goto(staus,name,index,size){
	if(staus=='up'&&index!=1){
		window.location.href=name+"_"+(index-1)+".html"; 
	}else if(staus=='first'){
		window.location.href=name+"_"+"1.html"; 
	}else if(staus=='down'){
		if(index!=size){
			window.location.href=name+"_"+(index+1)+".html"; 
		}
	}else if(staus=='last'){
		window.location.href=name+"_"+size+".html"; 
	}
}
function seachContent(){
 	var title=document.getElementById("title").value;
 	if (title == '' || title == '请输入关键字') {
  	   alert('请输入关键字');
  	   return;
  	}else{
  		title = encodeURIComponent(title);
 		window.location.href="../content/listContentByTitle.action?title="+title;   
 	}
 }
 
$(function () {
    $.ajax({
        type: "post",//使用post方法访问后台
        dataType: "json",//返回json格式的数据
        url: "${pageContext.request.contextPath}/content/findHOTKeyword.action",//要访问的后台地址
        data:{},//要发送的数据
        complete :function(){$("#load").hide();},//AJAX请求完成时隐藏loading提示
        success: function(msg){//msg为返回的数据，在这里做数据绑定
        	var b='关键字:&nbsp;';
        	$.each(msg.rows, function(i, n){
        	var a = '<a href="javascript:void(0)" onclick="byHotKwSeachContent(\''+msg.rows[i]+'\')">'+msg.rows[i]+'</a>&nbsp;&nbsp;';
        	b+=a;
           });
           $("#hotkw").html(b);
        }
    })
    }); 
	function byHotKwSeachContent(str) {
		var title = encodeURIComponent(str);
		window.location.href = "<%=basePath%>content/listContentByTitle.action?title="
				+ title;
	}
	 function queryOfPreview(contentId, category){
		  window.location.href="${pageContext.request.contextPath}/content/queryOfPreview.action?contentId="+contentId;
	 }
</script>
</head>

<body>
<!--header begin-->
<div class="header">
	<div class="wrap">
    	<div class="logo f_l"><img src="<%=basePath %>html2/images/logo.png" /></div>
    </div>
</div>
<!--header over-->

<!--nav begin-->
<div class="nav">
    <ul class="wrap tabs">
        <li><a href="../html2/index.html">首页</a></li>
        <c:if test="${not empty listChannel}">
        <c:forEach items="${listChannel}" var="channel" varStatus="vs">  
        <c:if test="${(channel.channelId!=1)&&(channel.channel.channelId==1)}">
        <li><a href="javascript:void(0)" onclick='show("${channel.channelId}")'>${channel.name}</a></li>
         <c:forEach items="${channel.channels}" var="cc"  varStatus="v">
       		<c:if test="${not empty cc&&cc.status==0}">
       		<input type="hidden" id="${channel.channelId}_${v.index}" value="${cc.channelId}">
        	</c:if>
         </c:forEach>
        </c:if>
        </c:forEach>
        </c:if>
        <li><a href="http://gzjd.sipac.gov.cn/Web/BBS/MainList.aspx" target="_blank">在线交流</a></li>
    </ul>
</div>
<!--nav over-->
<!--content begin-->
<div class="cloud">
    <!--notice begin-->
    <div class="wrap">
    	<div class="notice f_l"> 
            <div class="notice_tit f_l f_b">${channel.name}</div>
            <div class="f_l notice_list"  id="mq" onmouseover=iScrollAmount=0 style="overflow:hidden; width:500px; height:30px;color:#000" onmouseout=iScrollAmount=1 >
                <ul>
                    <c:if test="${not empty sonChannelList_7}">
        			<c:forEach items="${sonChannelList_7}" var="info" varStatus="vs">  
                    <li><a href="javascript:queryOfPreview('${info.contentId}')">${info.title}</a></li>
        			</c:forEach>
        			</c:if>
                </ul>
            </div>
        </div>
        <div class="search f_r">
            <form id="searchform">
            	
                <fieldset>
                <table>
                 	<tr>
				      <td width="70%">
				      	 <input type="text" onfocus="if(this.value =='请输入关键字') {this.value=''; }" onblur="if(this.value==''){this.value='请输入关键字';}" class="text_input" style="width:200px" value="请输入关键字" name="title" id="title">
				         <input type="button" onclick="seachContent()" name="button"> 
				      </td>
				   	</tr>
				   	<tr>
				   		 <td id="hotkw"></td>
				   	</tr>
				  </table> 
                </fieldset>
            </form>
        </div>
    </div>
    <script type="text/javascript" src="<%=basePath %>html2/js/muqruujs.js"></script>
    <!--notice over-->