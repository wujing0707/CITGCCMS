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
var memberId = ${member.memberId};

$(function(){
	$("#birthdate").datebox({
		required: false,
		editable: true
	});
	
	if (memberId > 0) {
		$("#username").attr("readonly", true);
		$("#birthdate").datebox('setValue','${member.birthdate}');
	}
	
	if (memberId == 0)
		$("#submit").val("添加");
	else
		$("#submit").val("修改");
});

function submitForm() {
	var flag = true;
	if (!$("#realname").validatebox("isValid"))
		flag = false;
	if (!$("#idcard").validatebox("isValid"))
		flag = false;
	
	$.each($(".easyui-validatebox"), function(i, elem) {
		$(elem).val($.trim($(elem).val()));
		if ($(elem).attr("validType") && !$(elem).validatebox("isValid")) {
			flag = false;
			return;
		}
	});
	if (!flag)
		return;
	
	$("#submit").attr("disabled","disabled");
	var act = memberId == 0 ? "add" : "update";
	$.post("${pageContext.request.contextPath}/user/member/" + act　+"Member.action", 
		{memberId: memberId, username: $.trim($("#username").val()), email: $.trim($("#email").val()),
		password: $.trim($("#password").val()), realname: $.trim($("#realname").val()), idcard: $.trim($("#idcard").val()), 
		gender: $("input[name='gender']:checked").val(), birthdate: $('#birthdate').datebox('getValue'),
		phone: $.trim($("#phone").val()), address: $.trim($("#address").val()), qq: $.trim($("#qq").val()), intro: $.trim($("#intro").val())},
		function(data) {
			$("#submit").removeAttr("disabled");
			if (data.result == true) {
				alert($("#submit").val() + "会员成功！");
				back();
			} else {
				if (data.message != null)
					alert(data.message);
				else
					alert($("#submit").val() + "会员失败！");
			}
		}, "json");
}
function back() {
	window.location.href = "${pageContext.request.contextPath}/user/member/memberList.action";
}
</script>
</head>
<body class="bodyBG">
    <div id="con" class="con" >
    	<div class="containTit">
    		<span class="position">
		    	<div class="posiCon">会员管理 >>&nbsp;<c:if test="${member.memberId eq 0}">添加</c:if><c:if test="${member.memberId > 0}">修改</c:if></div>
		    </span><span class="containTitext">会员管理</span>
		    <div class="cleardiv"></div>
	  	</div>
    	<div id="tab_zzjs_1">
    		<span class="positon">
		    	<h3 class="h3Auto"><a href="javascript:void(0);" class="tabBbg"> <span>会员表单</span> </a></h3>
		    </span>
	        <div class="padT23">
	        	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table4">
	        	<tr>
	        		<th align="right"><font color="red">*</font>&nbsp;会员名：</th><td colspan="3"><input type="text" id="username" value="${member.username}" class="easyui-validatebox" validType="username" required="required" missingMessage="会员名不能为空！" maxlength="23"/></td>
	        	</tr>
	        	<tr>
	        		<th align="right"><font color="red">*</font>&nbsp;真实姓名：</th><td><input type="text" id="realname" value="${member.realname}" class="easyui-validatebox" maxlength="23" required="required" missingMessage="真实姓名不能为空！"/></td>
	        		<th align="right"><font color="red">*</font>&nbsp;身份证号：</th><td><input type="text" id="idcard" value="${member.idcard}" class="easyui-validatebox" required="required" validType="idcard" maxlength="18"/></td>
	        	</tr>
	        	<tr>
	        		<th align="right">出生日期：</th><td><input type="text" id="birthdate" class="easyui-datebox" missingMessage="出生日期不能为空！"/></td>
	        		<th align="right">性别：</th><td><input type="radio" name="gender" value="0" <c:if test="${member.gender ne 1}">checked="checked"</c:if>/>男
	        		  <input type="radio" name="gender" value="1" <c:if test="${member.gender eq 1}">checked="checked"</c:if>/>女</td>
	        	</tr>
	        	<tr>
	        		<th align="right">地址：</th><td><input type="text" id="address" value="${member.address}" maxlength="75"/></td>
	        		<th align="right">手机：</th><td><input type="text" id="phone" value="${member.phone}" class="easyui-validatebox" validType="mobile" maxlength="11"/></td>
	        	</tr>
	        	<tr>
	        		<th align="right">电子邮箱：</th><td><input type="text" id="email" value="${member.email}" class="easyui-validatebox" validType="email" invalidMessage="无效邮箱" maxlength="90"/></td>
	        		<th align="right">QQ：</th><td><input type="text" id="qq" value="${member.qq}" class="easyui-validatebox" validType="qq" maxlength="20"/></td>
	        	</tr>
	        	<tr>
	        		<th align="right">备注：</th><td colspan="3"><textarea cols="48" rows="4" id="intro" style="resize:none" maxlength="75">${member.intro}</textarea></td>
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

