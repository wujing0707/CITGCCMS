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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/ueditor/themes/default/css/ueditor.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/cStyle.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/ueditor/ueditor.all.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/ueditor/ue.image.upload.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/json2.js"></script>
<title>${sysBackTitle}</title>
</head>
<script type="text/javascript">
var tagId = ${tag.tagId};

$(function() {
	if (tagId == 0) {
		$("#submit").val("添加");
	} else {
		$("#submit").val("修改");
	}
});
function onSubmit() {
	$("#name").val($.trim($("#name").val()));
	if (!$("#name").validatebox("isValid")) {
		return;
	}

	$("#submit").attr("disabled", "disabled");
	var act = tagId == 0 ? "add" : "update";
	$.post("${pageContext.request.contextPath }/assist/tag/" + act + "Tag.action?" + new Date().getTime(), 
		{tagId: tagId,
		name: $.trim($("#name").val()), 
		isDisabled: Number($("input[name='isDisabled']:checked").val())},	        	  
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
 
function back() {
	window.location.href = "${pageContext.request.contextPath }/assist/tag/tagList.action?" + new Date().getTime();
}
</script>
<body class="bodyBG">
    <div id="con" class="con" >
    	<div class="containTit">
    		<span class="position">
		    	<div class="posiCon">TAG管理 >>&nbsp;<c:if test="${tag.tagId <= 0}">添加</c:if><c:if test="${tag.tagId > 0}">修改</c:if></div>
		    </span><span class="containTitext">TAG管理</span>
		    <div class="cleardiv"></div>
	  	</div>
    	<div id="tab_zzjs_1"> 
    		<span class="positon">
		    	<h3 class="h3Auto"><a href="javascript:void(0);" class="tabBbg"> <span>TAG表单</span> </a></h3>
		    </span>
	        <div class="padT23">   
	        	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table4">
		        	<tr>
		        		<th align="right"><font color="red">*</font>&nbsp;TAG：</th>
		        		<td colspan="3"><input class="easyui-validatebox" type="text" name="name" id="name"  
		        		data-options="required:true" value="${tag.name}" maxlength="23">
		        		</input></td>
		        	</tr> 
		        	<tr>
		        		<th align="right">&nbsp;是否启用：</th>
		        		<td colspan="3">
		        		<input type="radio" name="isDisabled" value="0" <c:if test="${tag.isDisabled ne 1}">checked="checked"</c:if>></input>&nbsp;是 
		        		&nbsp;&nbsp;&nbsp;&nbsp;
		        		<input type="radio" name="isDisabled" value="1" <c:if test="${tag.isDisabled eq 1}">checked="checked"</c:if>></input>&nbsp;否     	
		        		</td>			        		
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