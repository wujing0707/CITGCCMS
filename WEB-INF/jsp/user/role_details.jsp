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
<title>${sysBackTitle}</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/themes/default/easyui.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/themes/icon.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/cStyle.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/easyui.ext.js"></script>
<script type="text/javascript">
var roleId = ${role.roleId};
var authorityValue = ${role.authorityValue};

$(function(){
	$.post("${pageContext.request.contextPath}/user/authority/listAuthority.action", {},
		function(data) {
			var count = 0;
			var countChecked = 0;
			for (var i = 0; i < data.rows.length; i++) {
				if (data.rows[i].authority.length > 0) {
					$("#authDiv").append("<div>" + data.rows[i].name + "</div>");
					for (var j = 0; j < data.rows[i].authority.length; j++) {
						count++;
						var checked = "";
						if ((authorityValue & data.rows[i].authority[j].value) > 0) {
							checked = " checked";
							countChecked++;
						}
						$("#authDiv").append("<input type='checkbox' name='auth' onclick='clickAuth()' value='" + data.rows[i].authority[j].value + "'" 
								+ checked + ">&nbsp;" + data.rows[i].authority[j].name + "&nbsp;&nbsp;&nbsp;");
					}
				}
			}
			if (count == countChecked) {
				$("#allClick").prop("checked", true);
			}
		},
	"json");
	
	if (roleId == 0)
		$("#submit").val("添加");
	else
		$("#submit").val("修改");
});

function submitForm() {
	$("#name").val($.trim($("#name").val()));
	if (!$("#name").validatebox("isValid"))
		return;
	
	var authority = "";
	$("input[name=auth]").each(function() {
		if ($(this).is(":checked")) {
			if (authority != "")
				authority += ",";
			
			authority += $(this).val();
		}
	});
	
	
	$("#submit").attr("disabled","disabled");
	var act = roleId == 0 ? "add" : "update";
	$.post("${pageContext.request.contextPath}/user/role/" + act + "Role.action", 
		{roleId: roleId, name: $("#name").val(), description: $.trim($("#description").val()), authority: authority},
		function(data) {
			$("#submit").removeAttr("disabled");
			if (data.result == true) {
				alert($("#submit").val() + "角色成功！");
				back();
			} else {
				if (data.message != null)
					alert(data.message);
				else
					alert($("#submit").val() + "角色失败！");
			}
		},
	"json");
}
function back() {
	window.location.href = "${pageContext.request.contextPath}/user/role/roleList.action";
}

function clickAuth() {
	var v = 0;
	$.each($("input[name=auth]"), function(i, elem) {
		if ($(elem).is(":checked")) {
			v += 1;
		}
	});
	
	$("#allClick").prop("checked", (v == $("input[name=auth]").length ? true : false));
}

function clickAll() {
	var v = 0;
	$.each($("input[name=auth]"), function(i, elem) {
		if ($(elem).is(":checked")) {
			v++;
		}
	});
	$.each($("input[name=auth]"), function(i, elem) {
		$(elem).prop("checked", v == $("input[name=auth]").length ? false : true);
	});
}
</script>
</head>
<body class="bodyBG">
    <div id="con" class="con" >
    	<div class="containTit">
    		<span class="position">
		    	<div class="posiCon">角色管理 >>&nbsp;<c:if test="${role.roleId eq 0}">添加</c:if><c:if test="${role.roleId > 0}">修改</c:if></div>
		    </span><span class="containTitext">角色管理</span>
		    <div class="cleardiv"></div>
	  	</div>
    	<div id="tab_zzjs_1">
    		<span class="positon">
		    	<h3 class="h3Auto"><a href="javascript:void(0);" class="tabBbg"> <span>角色表单</span> </a></h3>
		    </span>
	        <div class="padT23">
	        	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table4">
	        	<tr>
	        		<th align="right"><font color="red">*</font>角色名：</th><td><input type="text" id="name" value="${role.name}" class="easyui-validatebox" required="required" missingMessage="角色名不能为空！" maxlength="23"/></td>
	        	</tr>
	        	<tr>
	        		<th align="right">描述：</th><td><textarea cols="48" rows="4" id="description" style="resize:none">${role.description}</textarea></td>
	        	</tr>
	        	<tr>
	        		<th align="right" valign="top">权限：</th>
	        		<td id="authDiv">
	        			<div><input type="checkbox" id="allClick" value="-1" onclick="clickAll();">全部选中</div>
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

