<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
<title>${sysBackTitle}</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/cStyle.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/index.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/login.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript">
if(top.location != self.location){
    top.location = self.location;
}
function login() {
	if (!checkUsername())
		return;
	
	if (!checkPassword())
		return;
	
	$.post("${pageContext.request.contextPath}/login.action", {username: $("#username").val(), password: $("#password").val(), srand: $("#srand").val()},
		function(data) {
			if (data.result == true) {
				window.location.href = "${pageContext.request.contextPath}/toIndex.action";
			} else {
				$("#row").css("display", "block");
				$("#error").html(data.message);
			}
		},
	"json");
}
function checkUsername() {
	var username = $("#username").val();
	if ($.trim(username) == "") {
		$("#error").html("用户名不能为空!");
		return false;
	} else {
		$("#error").html("");
		return true;
	}
}
function checkPassword() {
	var password = $("#password").val();
	if ($.trim(password) == "") {
		$("#error").html("密码不能为空!");
		return false;
	} else {
		$("#error").html("");
		return true;
	}
}
</script>
</head>
<body class="logBG">
	<div class="logBox">
		<div id="error" class="prompt1" style="color:red;"></div>
		<table width="210" border="0" cellspacing="0" cellpadding="0">
			<tr>
			  <td align="left" nowrap="nowrap" width="210"><div class="logInput1Box">
			      <input type="text" id="username" value="" class="logInput logInput1" onblur="checkUsername();"/>
			  </div></td>
			</tr>
			<tr>
			  <td align="left" nowrap="nowrap" class="logTline"><!--间隔，勿删--></td>
			</tr>
			<tr>
			  <td align="left" nowrap="nowrap"><div class="logInput2Box">
			      <input type="password" id="password" value="" class="logInput logInput2" maxlength="50" onblur="checkPassword();"/>
			      <!--a href="找回密码1.html" title="忘记密码" id="logForget"></a--></div></td>
			</tr>
			<tr>
			  <td align="left" nowrap="nowrap" class="logTline"></td>
			</tr>
			<tr>
			  <td align="left" nowrap="nowrap"><div class="logInput3Box">
			      <input type="text" value="" id="srand" class="logInput logInput3" maxlength="5" />
			      <img src="secCode.action" id="imgYzm" width="90" height="28" onclick="this.src='secCode.action?d='+new Date()" style="padding-top:3px;"/></div>
			  </td>
			</tr>
		</table>
		<a id="btnLogin" href="javascript:login();"></a>
		<div class="logLB" id="LogBGlb"></div>
	</div>
</body>
</html>