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
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
var userId = ${user.userId};

$(function(){
	$.post("${pageContext.request.contextPath}/user/role/listAllRoles.action", {},
		function(data) {
			if(data.rows.length > 0) {
				for(var i = 0; i < data.rows.length; i++) {
					if (!isInRoleList(data.rows[i].roleId))
						$("#roleAll").append("<option value='" + data.rows[i].roleId + "'>" + data.rows[i].name + "</option>");
					else
						$("#roleResult").append("<option value='" + data.rows[i].roleId + "'>" + data.rows[i].name + "</option>");
				}
			}
		}, "json");
	
	if ($("#pId").val() != "" && $("#pId").val() != "0")
		$('#groupId').combotree('setValue', $("#pId").val());
	
	if (userId == 0)
		$("#submit").val("添加");
	else
		$("#submit").val("修改");
});

function submitForm() {
	var val = $("#groupId").combotree("getValue");
	if (val == "" || val == "0")
		return;
	
	var flag = true;
	$.each($("input[type='text']"), function(i, elem) {
		$(elem).val($.trim($(elem).val()));
		if ($(elem).attr("validType") && !$(elem).validatebox("isValid")) {
			flag = false;
			return;
		}
	});
	if (!flag)
		return;
	
	var roleIds = "";
	$("#roleResult option").each(function() {
		if (roleIds != "")
			roleIds += ",";
		roleIds += $(this).val();
	});
	
	$("#submit").attr("disabled", "disabled");
	var act = userId == 0 ? "add" : "update";
	$.post("${pageContext.request.contextPath}/user/user/" + act + "User.action", 
		{userId: userId, groupId: $("#groupId").combotree("getValue"), username: $.trim($("#username").val()), email: $.trim($("#email").val()),
		password: $.trim($("#password").val()), realname: $.trim($("#realname").val()), gender: $("input[name='gender']:checked").val(), birthdate: $('#birthdate').datebox('getValue'),
		phone: $.trim($("#phone").val()), address: $.trim($("#address").val()), qq: $.trim($("#qq").val()), intro: $.trim($("#intro").val()),
		roleIds: roleIds},
		function(data) {
			$("#submit").removeAttr("disabled");
			if (data.result == true) {
				alert($("#submit").val() + "用户成功！");
				back();
			} else {
				if (data.message != null)
					alert(data.message);
				else
					alert($("#submit").val() + "用户失败！");
			}
		}, "json");
}
function back() {
	window.location.href = "${pageContext.request.contextPath}/user/user/userList.action";
}

function lmove(){
	if ($("#roleResult option:selected").length > 0) {
		$("#roleResult option:selected").each(function () {
			if($(this).val() != "") {
		        $(this).appendTo($("#roleAll"));
		        $(this).attr('selected',false);
	        }
	    });
	}
}

function rmove(){
	if ($("#roleAll option:selected").length > 0) {
		$("#roleAll option:selected").each(function () {
			if ($(this).val() != "") {
				$(this).appendTo($("#roleResult"));
	        	$(this).attr('selected',false);
			}
	    });
	}
}

function isInRoleList(roleId) {
	var roleIds = $("#roleIds").val().split(",");
	if (roleIds.length > 0)
		for (var i = 0; i < roleIds.length; i++) {
			if (Number(roleIds[i]) == roleId)
				return true;
		}
	
	return false;
}
</script>
</head>
<body class="bodyBG">
    <div id="con" class="con" >
    	<input type="hidden" id="pId" value="${user.sysGroup.groupId}"/>
    	<div class="containTit">
    		<span class="position">
		    	<div class="posiCon">用户管理 >>&nbsp;<c:if test="${user.userId eq 0}">添加</c:if><c:if test="${user.userId > 0}">修改</c:if></div>
		    </span><span class="containTitext">用户管理</span>
		    <div class="cleardiv"></div>
	  	</div>
    	<div id="tab_zzjs_1">
    		<span class="positon">
		    	<h3 class="h3Auto"><a href="javascript:void(0);" class="tabBbg"> <span>用户表单</span> </a></h3>
		    </span>
	        <div class="padT23">
	        	<input type="hidden" id="roleIds" value="${user.roleIds}"/>
	        	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table4">
	        	<tr>
	        		<th align="right" nowrap="nowrap"><font color="red">*</font>&nbsp;组织机构：</th><td colspan="3"><input id="groupId" class="easyui-combotree" url="${pageContext.request.contextPath}/user/group/listAllGroups.action" style="width:200px;" required="required" missingMessage="组织机构不能为空！"></td>
	        	</tr>
	        	<tr>
	        		<th align="right"><font color="red">*</font>&nbsp;用户名：</th><td><input type="text" id="username" value="${user.username}" class="easyui-validatebox" validType="username" required="required" missingMessage="用户名不能为空！" maxlength="23"/></td>
	        		<th align="right">电子邮箱：</th><td><input type="text" id="email" value="${user.email}" class="easyui-validatebox" validType="email" invalidMessage="无效邮箱" maxlength="90"/></td>
	        	</tr>
	        	<tr>
	        		<th align="right">真实姓名：</th><td><input type="text" id="realname" value="${user.realname}" maxlength="23"/></td>
	        		<th align="right">性别：</th><td><input type="radio" name="gender" value="0" <c:if test="${user.gender ne 1}">checked="checked"</c:if>/>男
	        		  <input type="radio" name="gender" value="1" <c:if test="${user.gender eq 1}">checked="checked"</c:if>/>女</td>
	        	</tr>
	        	<tr>
	        		<th align="right">出生日期：</th><td><input type="text" id="birthdate" class="easyui-datebox" value="${user.birthdate}"/></td>
	        		<th align="right">手机：</th><td><input type="text" id="phone" value="${user.phone}" class="easyui-validatebox" validType="mobile" maxlength="11"/></td>
	        	</tr>
	        	<tr>
	        		<th align="right">地址：</th><td><input type="text" id="address" value="${user.address}" maxlength="75"/></td>
	        		<th align="right">QQ：</th><td><input type="text" id="qq" value="${user.qq}" class="easyui-validatebox" validType="qq" maxlength="20"/></td>
	        	</tr>
	        	<tr>
	        		<th align="right">备注：</th><td colspan="3"><textarea cols="48" rows="4" id="intro" style="resize:none" maxlength="75">${user.intro}</textarea></td>
	        	</tr>
	        	<tr>
	        		<th align="right">角色：</th>
	        		<td colspan="3">
	        			<table border="0" cellspacing="0">
	        			<tr>
	        				<td>
			        			<select name="roleAll" size="10" id="roleAll" multiple="multiple" style="width:120px;height:120px;">
									<optgroup label="--请先选择角色--" style="color: red"/>
								</select>
							</td>
							<td>
								<div style="padding:5px;"><a class="easyui-linkbutton" iconCls="icon-add" onclick="rmove();"></a></div>
								<div style="padding:5px;"><a class="easyui-linkbutton" iconCls="icon-remove" onclick="lmove();"></a></div>
							</td>
							<td>
								<select name="roleResult" size="10" id="roleResult" multiple="multiple" style="width:120px;height:120px;">
									<optgroup label="--已选角色--" style="color: red"/>
								</select>
							</td>
						</tr>
						</table>
					</td>
	        	</tr>
	        	<tr>
	        		<th colspan="4">
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

