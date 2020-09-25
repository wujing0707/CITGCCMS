<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>" />
<title>${sysBackTitle}</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/themes/default/easyui.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/themes/icon.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/cStyle.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/easyui.ext.js"></script>
<script type="text/javascript">
var repeatName = false;
var workflowId = ${workflow.workflowId};
//审批数组
var roles = {};

$(function(){
		/* $.post("${pageContext.request.contextPath}/user/role/listAllRoles.action", {},
			function(data) {
				$("#stage").append("<div name='appLevel'><select name='level'><option value='0'>--请选择--</option></select>&nbsp;&nbsp;&nbsp;"
						+ "<input type='button' name='remove' value='删除' class='btnSearch' onmouseout=\"this.className='btnSearch'\" onmouseover=\"this.className='btnSearch1'\" onclick='removeLevel(this);'/></div>");
				
				for (var i = 0; i < data.rows.length; i++) {
					if (workflowId > 0) {
						var roleIds =  $("#roleIds").val();
						var roleIdsArr = roleIds.split(",");
					}
					
					$("select[name=level]:first").append("<option value='" + data.rows[i].roleId + "'>" + data.rows[i].name + "</option>");
				}
			}, "json"); */
		$.post("${pageContext.request.contextPath}/user/role/listApprovalRoles.action", {},
			function(data) {
				roles = data;
				var roleIds = $("#roleIds").val();
				if (roleIds != "0") {
					var roleIdsArr = roleIds.split(",");
					for (var i = 0; i < roleIdsArr.length; i++) {
						$("#stage").append("<div name='appLevel'><select name='level'><option value='0'>--请选择--</option></select>&nbsp;&nbsp;&nbsp;"
								+ "<input type='button' name='remove' value='删除' class='btnSearch' onmouseout=\"this.className='btnSearch'\" onmouseover=\"this.className='btnSearch1'\" onclick='removeLevel(this);'/></div>");
						for (var j = 0; j < roles.rows.length; j++) {
							var sel = Number(roleIdsArr[i]) == roles.rows[j].roleId ? " selected" : "";
							$("select[name=level]:last").append("<option value='" + roles.rows[j].roleId + "'" + sel + ">" + roles.rows[j].name + "</option>");
						}
					}
				}
			}, "json");
		
	
	if (workflowId == 0)
		$("#submit").val("添加");
	else
		$("#submit").val("修改");
});

function submitForm() {
	$("#name").val($.trim($("#name").val()));
	if (!$("#name").validatebox("isValid"))
		return;
	
	var roleIds = "";
	$("select[name=level]").each(function() {
		if ($(this).val() != "0") {
			if (roleIds != "")
				roleIds += ",";
			roleIds += $(this).val();
		}
	});
	
	var act = workflowId == 0 ? "add" : "update";
	$("#submit").attr("disabled","disabled");
	$.post("${pageContext.request.contextPath}/system/workflow/" + act + "Workflow.action", 
		{workflowId: workflowId,
		name: $.trim($("#name").val()),
		description: $.trim($("#description").val()),
		isCurrent:$.trim($("#isCurrent").val()),
		roleIds: roleIds},
		function(data) {
			$("#submit").removeAttr("disabled");
			if (data.result) {
				alert($("#submit").val() + "工作流成功！");
				back();
			} else {
				if (data.message != null)
					alert(data.message);
				else
					alert($("#submit").val() + "工作流失败！");
			}
		}, "json");
}

function back() {
	window.location.href = "${pageContext.request.contextPath}/system/workflow/workflowList.action";
}

function addLevel() {
	$("#stage").append("<div name='appLevel'><select name='level'><option value='0'>--请选择--</option></select>&nbsp;&nbsp;&nbsp;"
		+ "<input type='button' name='remove' value='删除' class='btnSearch' onmouseout=\"this.className='btnSearch'\" onmouseover=\"this.className='btnSearch1'\" onclick='removeLevel(this);'/></div>");
	for (var i = 0; i < roles.rows.length; i++) {
		$("select[name=level]:last").append("<option value='" + roles.rows[i].roleId + "'>" + roles.rows[i].name + "</option>");
	}
}

function removeLevel(v) {
	var index = $("input[name=remove]").index($(v));
	$("div[name=appLevel]:eq(" + index + ")").remove();
}
</script>
</head>
<body class="bodyBG">
    <div id="con" class="con" >
    	<div class="containTit">
    		<span class="position">
		    	<div class="posiCon">工作流管理 >>&nbsp;<c:if test="${workflow.workflowId eq 0}">添加</c:if><c:if test="${workflow.workflowId > 0}">修改</c:if></div>
		    </span><span class="containTitext">工作流管理</span>
		    <div class="cleardiv"></div>
	  	</div>
    	<div id="tab_zzjs_1">
    		<span class="positon">
		    	<h3 class="h3Auto"><a href="javascript:void(0);" class="tabBbg"> <span>工作流表单</span> </a></h3>
		    </span>
	        <div class="padT23">
	        	<input type="hidden" id="roleIds" value="${workflow.roleIds}"/>
	        	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table4">
	        	<tr>
	        		<th align="right"><font color="red">*</font>工作流名称：</th><td><input type="text" id="name" value="${workflow.name}" class="easyui-validatebox" required="required" missingMessage="工作流名不能为空！" maxlength="160"/></td>
	        	</tr>
	        	<tr>
	        		<th align="right">描述：</th><td colspan="3"><textarea cols="48" rows="4" id="description" style="resize:none" maxlength="160">${workflow.description}</textarea>
	        	</tr>
	        	<tr>
	        		<th align="right"><font color="red">*</font>是否为默认工作流：</th><td>
	        		<select id="isCurrent">
	        		<c:choose>
					<c:when test="${workflow.isCurrent eq 0}">
					<option value="0">默认工作流</option>
	        		<option value="1">非默认工作流</option>
					</c:when>
					<c:otherwise>
					<option value="1">非默认工作流</option>
					<option value="0">默认工作流</option>
					</c:otherwise>
					</c:choose>
	        		</select></td>
	        	</tr>
	        	<tr>
	        		<th align="right" valign="top">审批阶段：</th>
	        		<td colspan="3" id="stage">
	        			<input type="button" value="添加" class="btnSearch" onmouseout="this.className='btnSearch'" onmouseover="this.className='btnSearch1'" onclick="addLevel();"/>
	        		</td>
	        	</tr>
	        	<tr>
	        		<th colspan="2">
	        			<div style="padding:10px;">
				        	<input type="button" id="submit" value="提交" class="btnSearch" onmouseout="this.className='btnSearch'" onmouseover="this.className='btnSearch1'" onclick="submitForm();"/>&nbsp;&nbsp;
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

