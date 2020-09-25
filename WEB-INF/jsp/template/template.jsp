<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/themes/default/tree.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/cStyle.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#tt").tree({
		url: "${pageContext.request.contextPath}/template/freshTree.action?" + new Date().getTime(),
		onClick: function(node) {
			$(this).tree('toggle', node.target);
			var url = "";
			if (node.attributes.isDirectory) {
				url = "template/templateList.action?path=";
			} else {
				url = "template/templateDetails.action?path=";
			}
			var realPath = encodeURIComponent(encodeURIComponent(node.attributes.realPath));
			url += realPath;
			$("#treeIframe").attr("src", url);
		}
	});
});

function freshTree() {
	$("#tt").tree("reload");
}

function toSetting() {
	$("#treeIframe").attr("src", "template/toSetting.action");
}
</script>
<title>${sysBackTitle}</title>
</head>
<body class="bodyBG">
    <div class="con" id="con">
		<div class="containTit">
  		 	<span class="position">
		    	<div class="posiCon">模板管理&nbsp;>>&nbsp;列表</div>
		    </span>
			<span class="containTitext marB10">模板管理</span>
		</div>
	    <div id="tab_zzjs_1">
			<span class="positon">
				<h3 class="h3Auto"> <a class="tabBbg" href="javascript:void(0);"> <span>模板管理</span> </a> </h3>
			</span>
			<div class="padT23">
				<table width="100%" height="540px" border="0" cellspacing="0" cellpadding="0" class="table1">
					<tr height="100%">
						<td width="12%" nowrap="nowrap" valign="top" align="left" class="BGwhite">
							<div class="TreeLbarbox">
								<div class="treeLbtnBox">
									<input type="button" class="treeLbtn" id="refreshBtn" value="刷新" onclick="freshTree();"/>
									<img src="${pageContext.request.contextPath}/static/images/treeLine.gif" alt="竖线" />
									<input type="button" class="treeLbtn" id="setupBtn" value="设置" onclick="toSetting();"/>
								</div>
								<div class="TreeLbar">
									<ul id="tt"></ul>
								</div>
							</div>
						</td>
						<script type="text/javascript">   
							function setTreeIframe(iframeObj) { 
								iframeObj = document.getElementById('treeIframe') ; 
								if (document.getElementById) {    
									if (iframeObj) {   
										if (iframeObj.contentDocument && iframeObj.contentDocument.body.offsetHeight) {   
											iframeObj.height = iframeObj.contentDocument.body.offsetHeight;   
										} else if (document.frames[iframeObj.name].document && document.frames[iframeObj.name].document.body.scrollHeight) {
											iframeObj.height = document.frames[iframeObj.name].document.body.scrollHeight;   
										}   
									}   
								}   
							}   
						</script>
						<td width="85%" nowrap="nowrap" align="left" valign="top" class="BGwhite">
							<iframe id="treeIframe" name="treeIframe" src="template/toSetting.action" frameborder="0" height="100%" width="100%" scrolling="no" allowtransparency="true" onload="setTreeIframe()"  style="background-color:transparent; overflow:hidden;"></iframe>
						</td>
					</tr>
				</table>
			</div>
		</div>
    </div>
</body>
</html>