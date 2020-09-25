<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<base href="<%=basePath%>" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/cStyle.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/locale/easyui-lang-zh_CN.js"></script>
<title>${sysBackTitle}</title>
<style type="text/css">
.myfont{font-size: 12px;}
</style>
</head>
<script type="text/javascript">
var messageId = ${messageModel.messageId};
function onSubmit() {	
	$("#submit").val("添加");
	$("#submit").attr("disabled","disabled");
	var act = "add";
	$.post("${pageContext.request.contextPath }/assist/message/" + act + "Reply.action?" + new Date().getTime(), 
		{messageText: $.trim($("#messageText").val()), 
		reply: $.trim($("#reply").val()),
		messageId: $("#messageId").val()},	
		function(data) {
			$("#submit").removeAttr("disabled");
  			if (data.result == true) {	
				alert($("#submit").val()+"成功！");
				back();				
			} else {
  				alert($("#submit").val()+"失败！");
  			}
		},
	"json");
}

function back() {
	window.location.href = "${pageContext.request.contextPath}/assist/message/messageList.action";
}
    </script>
<body class="bodyBG">
    <div id="con" class="con" >
    	<div class="containTit">
    		<span class="position">
		    	<div class="posiCon">留言管理 >>&nbsp;<c:if test="${messageModel.messageId > 0}">回复</c:if></div>
		    </span><span class="containTitext">留言管理</span>
		    <div class="cleardiv"></div>
	  	</div>
    	<div id="tab_zzjs_1"> 
    		<span class="positon">
		    	<h3 class="h3Auto"><a href="javascript:void(0);" class="tabBbg"> <span>留言表单</span> </a></h3>
		    </span>
	        <div class="padT23"> 
	        	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table4">
	        		<tr>
		        		<th align="right">&nbsp;标题：</th>
		        		<td colspan="3">
			        		<textarea readonly="readonly" cols="48" rows="4" name="message" id="messageText">${messageModel.title}</textarea>
		        		</td>
		        	</tr>
		        	<tr>
		        		<th align="right">&nbsp;标题留言：</th>
		        		<td colspan="3">
			        		<textarea readonly="readonly" cols="48" rows="4" name="message" id="messageText">${messageModel.message}</textarea>
			        		<input type="hidden" value="${messageModel.messageId}" id="messageId" name="messageId"></input>
		        		</td>
		        	</tr>
		        	
		        	<tr>
		        		<th align="right">&nbsp;回复内容：</th>
		        		<td colspan="3"><textarea  cols="48" rows="4" name="reply" id="reply" maxlength="160"><c:if test="${!empty reply}">${reply}</c:if></textarea></td>        		
		        	</tr> 
		        	<tr>
		        		<th colspan="4">
		        			<div style="padding:10px;">
		        				<input type="button" id="submit" value="提交" class="btnSearch" onmouseout="this.className='btnSearch'" onmouseover="this.className='btnSearch1'" onclick="onSubmit();"/>&nbsp;&nbsp;
						      	<input type="button" value="重置" class="btnSearch" onmouseout="this.className='btnSearch'" onmouseover="this.className='btnSearch1'" onclick="window.location.reload();"/>&nbsp;&nbsp;
						      	<input type="button" value="返回" class="btnSearch" onmouseout="this.className='btnSearch'" onmouseover="this.className='btnSearch1'" onclick="back();"/>					    
				        	</div>
					    </th>
		        	</tr>       		     	
	        	</table>	              
    		</div>
    	</div>
    </div> 
</body>
</html>