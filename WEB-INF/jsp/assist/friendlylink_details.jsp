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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/cStyle.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/locale/easyui-lang-zh_CN.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/ajaxfileupload.js"></script> --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/ueditor/ueditor.all.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/ueditor/ue.image.upload.js"></script>
<title>${sysBackTitle}</title>
<style type="text/css">
.myfont{font-size: 12px;}
</style>
</head>
<script type="text/javascript">
$(function(){
	image.init("pictureImage1_ed", "pictureImage1_img");
    image.show("pictureImage1");
});
var friendlylinkId = ${friendlylink.friendlylinkId};

function onSubmit() {
	if($.trim($("#type").val()) == "-1") {
		alert("请选择网站类别！");		
		return;
	}
	
	var flag = true;
	$.each($("input[type='text']"), function(i, elem) {
		$(elem).val($.trim($(elem).val()));
		if (!$(elem).validatebox("isValid")) {
			flag = false;
			return;
		}
	});
	if (!flag)
		return;
	
	if (friendlylinkId == 0) {
		$("#submit").val("添加");
	} else {
		$("#submit").val("修改");
	}
	$("#submit").attr("disabled", "disabled");
	var act = friendlylinkId == 0 ? "add" : "update";
	$.post("${pageContext.request.contextPath }/assist/friendlylink/" + act + "Friendlylink.action?" + new Date().getTime(), 
		{siteName: $("#siteName").val(), 
  		domain: $("#domain").val(), 
  		type: $("#type").val(),
        priority: $.trim($("#priority").val()),
        logo: $("#pictureImage1_img").attr("src"), 
        friendlylinkId: friendlylinkId},	        	  
		function(data) {
     		$("#submit").removeAttr("disabled");
			if (data.result) {
				alert($("#submit").val() + "成功！");
				back();
			} else {
				alert($("#submit").val() + "失败！");
			}
		}, "json");
}
 
function back() {
	window.location.href = "${pageContext.request.contextPath }/assist/friendlylink/friendlylinkList.action?" + new Date().getTime();
} 

</script>
<body class="bodyBG">
    <div id="con" class="con" >
    	<div class="containTit">
    		<span class="position">
		    	<div class="posiCon">链接管理 >>&nbsp;<c:if test="${friendlylink.friendlylinkId <= 0}">添加</c:if><c:if test="${user.userId > 0}">修改</c:if></div>
		    </span><span class="containTitext">链接管理</span>
		    <div class="cleardiv"></div>
	  	</div>
    	<div id="tab_zzjs_1"> 
    		<span class="positon">
		    	<h3 class="h3Auto"><a href="javascript:void(0);" class="tabBbg"> <span>链接表单</span> </a></h3>
		    </span>
	        <div class="padT23">   
	        	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table4">
		        	<tr>
		        		<th align="right"><font color="red">*</font>&nbsp;网站名称：</th><td><input class="easyui-validatebox" type="text" name="siteName" id="siteName" required="required" missingMessage="网站名称不能为空！" value="${friendlylink.siteName}" maxlength="23"></input></td>
		        		<th align="right"><font color="red">*</font>&nbsp;域名：</th><td><input class="easyui-validatebox" type="text" name="domain" id="domain" required="required" missingMessage="域名不能为空！" value="${friendlylink.domain}" maxlength="245"></input>
		        		<input type="hidden" value="${friendlylink.friendlylinkId}" id="friendlylinkId" name="friendlylinkId"></input>
		        		</td>
		        	</tr>
		        	<tr>
		        		<th align="right"><font color="red">*</font>&nbsp;网站类别：</th>
		        		<td>
			        		<select id="type" name="type" style="width:135px">
			        		<option value="-1">--请选择--</option>
			        		<c:forEach items="${typeList}" var="typeList">
		          				<option value="${typeList.friendlylinkTypeId}" 
		          					<c:if test="${typeList.friendlylinkTypeId eq typeId}"> selected="selected"</c:if>>
		          					${typeList.name}
		          				</option>
		          			</c:forEach>
			        		</select>
		        		</td>
		        		<th align="right">&nbsp;顺序：</th>
		        		<td> <input class="easyui-numberbox" type="text" name="priority" id="priority" value="${friendlylink.priority}" maxlength="4"></input>注：只能输入数字</td>
		        	</tr> 	        	
		        	<tr>
		        		<td align="right">LOGO图片上传：</td>
		        		<td colspan="3">        			        				
		        			<div class="std_photo">                                 
							    <img id="pictureImage1_img" src="${friendlylink.logo}" width="100px" height="100px" />
                                <script id="pictureImage1_ed"></script>
                                <input type="button" id="pictureImage1" value="上传图片" />				                
							</div>
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