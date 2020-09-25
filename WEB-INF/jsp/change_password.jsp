<%@ page language="java" import="java.util.*,com.wa.cms.Constant"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/cStyle.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/easyui.ext.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
var userId = ${sessionScope.userId};

function checkPassword() {
	if ($("#password").val().length<6 || $("#password").val().length>16) {
		$("#error2").html("密码长度在6-16位之间 !");
		$("#password").val('');
		return false;
	} else {
		$("#error2").html("");
		return true;
	}
}

function check() {
	if ($("#password").val() != $("#newpwd").val()) {
		$("#error3").html("两次密码输入不一致 !");
		$("#newpwd").val('');
		return false;
	} else {
		$("#error3").html("");
		return true;
	}
}

function checkCo() {
	if ($("#oldpwd").val() == $("#password").val()&&$("#oldpwd").val()!="") {
		$.messager.alert("操作提示", "修改密码与当前密码一致，请重新修改!","warning");
		$("#password").val('');
		return false;
	} else {
		$("#error4").html("");
		return true;
	}
}

function onSubmit() {
	if ($("#password").val().length<6 || $("#password").val().length>16) {
		$("#error2").html("密码长度在6-16位之间 !");
		return ;
	} 
	if ($("#password").val() != $("#newpwd").val()) {
		$("#error3").html("两次密码输入不一致 !");
		alert($("#password").val()+":"+$("#newpwd").val());
		return;
	}
	if ($("#oldpwd").val() == $("#password").val()&&$("#oldpwd").val()!="") {
		$.messager.alert("操作提示", "修改密码与当前密码一致，请重新修改!","warning");
		return;
	} 
	$("#submit").attr("disabled", "disabled");
	$.post("${pageContext.request.contextPath }/changePassword.action", {
		userId : userId,
		password : $("#password").val(),
		oldpwd : $("#oldpwd").val()
	},function(data) {
		$("#submit").removeAttr("disabled");
		if (data.result == true) {
			$("#error1").html("");
			$.messager.alert("操作提示", "修改密码成功！","warning",function(){
			window.location.href="toHome.action";
			});
		} else {
			$("#error1").html("原始密码错误 !");
		}
	}, "json");
}
</script>
</head>
<body class="bodyBG">
	<div id="con" class="con">
		<div class="containTit">
			<span class="position">
				<div class="posiCon">修改密码</div>
			</span><span class="containTitext">密码管理</span>
			<div class="cleardiv"></div>
		</div>
		<div id="tab_zzjs_1">
			<span class="positon">
				<h3 class="h3Auto">
					<a href="javascript:void(0);" class="tabBbg"> <span>修改密码</span>
					</a>
				</h3>
			</span>
			<div class="padT23">
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					class="table4">
					<tr>
						<th align="right"><font color="red">*</font>当前密码：</th>
						<td><input type="password" id="oldpwd" name="oldpwd" size="30"
							value="${user.oldpwd}"  />
							<span
							id="error1" class="prompt1" style="color: red;"></span>
							</td>

					</tr>
					<tr>
						<th align="right"><font color="red">*</font>新密码：</th>
						<td><input type="password" id="password" name="password" size="30" /> 
						<span id="error2" class="prompt1" style="color: red;"></span></td>
					
					<tr>
						<th align="right"><font color="red">*</font>确认密码：</th>
						<td width="800"><input type="password" id="newpwd" name="newpwd" size="30"/> 
						<span id="error3" class="prompt1" style="color: red;"></span></td>
					</tr>

					<tr>
						<th colspan="2">
							<div style="padding: 10px;">
								<input type="button" value="修改" class="btnSearch"
									onmouseout="this.className='btnSearch'"
									onmouseover="this.className='btnSearch1'" onclick="onSubmit();" />&nbsp;&nbsp;
								<input type="button" value="重置" class="btnSearch"
									onmouseout="this.className='btnSearch'"
									onmouseover="this.className='btnSearch1'"
									onclick="window.location.reload();" />&nbsp;&nbsp;
							</div>
						</th>
					</tr>

				</table>
			</div>
		</div>
	</div>
</body>
</html>

