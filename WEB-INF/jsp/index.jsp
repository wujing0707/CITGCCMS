<%@ page language="java" contentType="text/html; charset=utf-8" import="com.wa.cms.SettingManager" pageEncoding="utf-8"%>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/height.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript">
var auth = 4194303;
//nn=${sysUser.authorityValue};
function click(a, url) {
	if ((auth & a) > 0 || a == 0) {
		$("#iframeCon").prop("src", url);
	} else {
		alert("抱歉，您没有权限访问！");
	}
}
$(function() {
	var date = new Date().toLocaleDateString();
	$("#date").html(date);
});

</script>
</head>
<body class="bodyBG">
<div class="container">
	<div id="top">
		<div class="topL"></div>
		<div class="topCR">
			<div class="topR">
				<table width="200" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<th nowrap="nowrap" align="left">${sysUser.username}, 欢迎登录本系统，本次登录时间：<span id='date'>2014-4-14</span>&nbsp;&nbsp;&nbsp;&nbsp;系统版本：<%=SettingManager.getInstance().getVersion()%></th>
						<td nowrap="nowrap" align="center"><a id="btnTopA" href="toHome.action" title="返回首页" target="iframeCon"></a></td>
						<td nowrap="nowrap" align="center"><a id="btnTopB" href="javascript:click(0,'toChangePassword.action');" title="修改密码"></a></td>
						<td nowrap="nowrap" align="center"><a id="btnTopC" href="toLogin.action" title="退出登录"></a></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript">   
	function SetiframeCon(iframeObj) { 
		iframeObj = document.getElementById('iframeCon') ; 
		if (document.getElementById) {    
			if (iframeObj){   
				if (iframeObj.contentDocument && iframeObj.contentDocument.body.offsetHeight){   
					iframeObj.height = iframeObj.contentDocument.body.offsetHeight;   
				} else if (document.frames[iframeObj.name].document && document.frames[iframeObj.name].document.body.scrollHeight){
					iframeObj.height = document.frames[iframeObj.name].document.body.scrollHeight;   
				}   
			}   
		}   
	}
	//window.setInterval("SetiframeCon()", 200);
	</script>
	<div class="leftmenu floatL" id="leftmenu"> 
        <!-- 左侧栏开始--->
		<div class="menu">
			<ul class="menuOne">
				<li>
					<a href="toHome.action" id="Icon1" class="ctrlShow1" target="iframeCon">&nbsp;</a>
				</li>
				<li>
					<a href="javascript:click(1,'channel/listChannelPag.action');" id="Icon2" class="ctrlShow1">&nbsp;</a>
				</li>
				<li>
					<a href="javascript:click(126,'content/toContents.action');" id="Icon3" class="ctrlShow1">&nbsp;</a>
				</li>
				<li>
					<a href="javascript:click(126,'content/toContentsApp.action');" id="Icon9" class="ctrlShow1">&nbsp;</a>
				</li>
				<li>
					<a href="javascript:click(126,'hotKey/toHotKey.action');" id="Icon10" class="ctrlShow1">&nbsp;</a>
				</li>
				<li><!-- <a href="javascript:void(0);" id="Icon5" class="ctrlShow1">&nbsp;</a>  -->
				  	<div class="door"></div>
				    <ul class="menuTwo" id="menuTwo5">
				  	</ul>
				  <div class="menuBox" id="menuBox5"></div>
				</li>
				<li><!-- <a href="javascript:void(0);" id="Icon6" class="ctrlShow1">&nbsp;</a> -->
				  	<div class="door"></div>
				  	<ul class="menuTwo" id="menuTwo6">
<!-- 					    <li><a href="javascript:click(2048,'assist/keyword/keywordList.action');">敏感词管理</a></li>
					    <li><a href="javascript:click(4096,'assist/tag/tagList.action');">TAG 管理</a></li> -->
					    <li><a href="javascript:click(8192,'content/toRecycleContents.action');">内容回收站</a></li>
				  	</ul>
				  <div class="menuBox" id="menuBox6"></div>
				</li>
				<li><!--<a href="javascript:void(0);" id="Icon7" class="ctrlShow1">&nbsp;</a>  -->
				  	<div class="door"></div>
				  	<ul class="menuTwo" id="menuTwo7">
					    <!--<li><a href="javascript:click(16384,'user/user/userList.action');">用户管理</a></li>
					    <li><a href="javascript:click(65536,'user/role/roleList.action');">角色管理</a></li>
					    <li><a href="javascript:click(32768,'user/group/groupList.action');">组织机构管理</a></li>
					    <li><a href="javascript:click(131072,'user/member/memberList.action');">会员管理</a></li> -->
				  	</ul>
				  	<div class="menuBox" id="menuBox7"></div>
				</li>
				<li>
					<a href="javascript:click(8192,'content/toRecycleContents.action');" id="Icon6" class="ctrlShow1">&nbsp;</a>
				</li>
				<li>
					<a href="javascript:click(8192,'idchannel/toIdChannel.action');" id="Icon4" class="ctrlShow1">&nbsp;</a>
				</li>
				<li  style="display:none"> <a href="javascript:click(2097152,'creditQuery/toIndex.action');" id="Icon8" class="ctrlShow1">&nbsp;</a>
				   		<div class="A"></div>
					<ul class="A" id="menuTwo8">
				     	<li><a href="javascript:click(262144,'system/sysLog/sysLogList.action');">日志管理</a></li>
					    <li><a href="javascript:click(1048576,'system/workflow/workflowList.action');">工作流程管理</a></li>
					    <li><a href="javascript:click(2097152,'maintain/dictionary/dictionaryList.action');">字典管理</a></li> 
				  	</ul>
				  	<div class="menuBox" id="menuBox8"></div>
				</li>
			</ul>
       	</div>
        <!--左侧栏结束---> 
    </div>
    <iframe class="contain floatL" id="iframeCon" name="iframeCon" src="toHome.action" frameborder="0" style="height:100px;autoflow:hidden;border:0px;background-color:transparent;" allowtransparency="true" onload="SetiframeCon()"></iframe>
</div>
</body>
</html>