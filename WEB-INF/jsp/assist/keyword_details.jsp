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
</head>
<script type="text/javascript">
var repeatName = false;
var keywordId = ${keyword.keywordId};
function onSubmit() {
	if (!$("#name").validatebox("isValid")) {
		return;
	}
	
	if (keywordId == 0) {
		$("#submit").val("添加");
	} else {
		$("#submit").val("修改");
	}
	$("#submit").attr("disabled", "disabled");
	var act = keywordId == 0 ? "add" : "update";
	$.post("${pageContext.request.contextPath }/assist/keyword/" + act + "Keyword.action?" + new Date().getTime(), 
		{name: $("#name").val(), 
		replaceValue: $("#replaceValue").val(), 
		isDisabled: $("input[name='isDisabled']:checked").val(),
        keywordId : keywordId},	        	  
		function(data) {
       		$("#submit").removeAttr("disabled");
			if (data.result) {
				$.messager.alert("成功",$("#submit").val() + "成功！","info", function(r){
			    		back();
			    });
			} else {
				$.messager.alert('失败',$("#submit").val() + "失败！","error", function(r){});
			}
		}, "json");
}
function reset(){
	$("#name").val("");
	$("#replaceValue").val("");
}
 
function back() {
	window.location.href = "${pageContext.request.contextPath }/assist/keyword/keywordList.action?" +　new Date().getTime();
} 					
</script>
<body class="bodyBG">
    <div id="con" class="con" >
    	<div class="containTit">
    		<span class="position">
		    	<div class="posiCon">敏感词管理 >>&nbsp;<c:if test="${keyword.keywordId <= 0}">添加</c:if><c:if test="${keyword.keywordId > 0}">修改</c:if></div>
		    </span><span class="containTitext">敏感词管理</span>
		    <div class="cleardiv"></div>
	  	</div>
    	<div id="tab_zzjs_1"> 
    		<span class="positon">
		    	<h3 class="h3Auto"><a href="javascript:void(0);" class="tabBbg"> <span>敏感词表单</span> </a></h3>
		    </span>
	        <div class="padT23">   
	        	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table4">
		        	<tr>
		        		<th align="right"><font color="red">*</font>&nbsp;敏感词：</th><td><input class="easyui-validatebox" type="text" name="name" id="name"  onchange="isRepeatName();" data-options="required:true" value="${keyword.name}" maxlength="23"></input></td>
		        		<th align="right">&nbsp;替换内容：</th>
		        		<td>
		        		<c:if test="${keyword.keywordId <= 0}">
		        			<input class="easyui-validatebox" type="text" name="replaceValue" id="replaceValue" value="***" maxlength="23"></input>
		        		</c:if>
		        		<c:if test="${keyword.keywordId > 0}">
		        			<input class="easyui-validatebox" type="text" name="replaceValue" id="replaceValue" value="${keyword.replaceValue}" maxlength="23"></input>
		        		</c:if>	
		        		</td>
		        	</tr>
		        	<tr>
		        		<th align="right">&nbsp;是否启用：</th>
		        		<td colspan="3">
		        		<input type="radio" name="isDisabled" value="0" <c:if test="${keyword.isDisabled ne 1}">checked="checked"</c:if>></input>&nbsp;是 
		        		&nbsp;&nbsp;&nbsp;&nbsp;
		        		<input type="radio" name="isDisabled" value="1" <c:if test="${keyword.isDisabled eq 1}">checked="checked"</c:if>></input>&nbsp;否     	
		        		</td>			        		
		        	</tr>
		        	<tr>
		        		<th colspan="4">
		        			<div style="padding:10px;">
		        				<input type="button" id="submit" value="提交" class="btnSearch" onmouseout="this.className='btnSearch'" onmouseover="this.className='btnSearch1'" onclick="onSubmit();"/>&nbsp;&nbsp;
						      	<input type="button" value="重置" class="btnSearch" onmouseout="this.className='btnSearch'" onmouseover="this.className='btnSearch1'" onclick="reset();"/>&nbsp;&nbsp;
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