<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/cStyle.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/easyui.ext.js"></script>
<script type="text/javascript">
var templateGroupId = ${templateGroup.templateGroupId};
$(function() {
	$("#curPath").combotree("setValue", "${templateGroup.curPath}");
});

function submitForm() {
	var curPath = $("#curPath").combotree("getValue");
	if (curPath == "" || curPath == "0") {
		alert("默认方案不能为空！");
		return;
	}
	
	$("#submit").attr("disabled", "disabled");
	$.post("${pageContext.request.contextPath}/template/settingTemplateGroup.action?" + new Date().getTime(),
		{templateGroupId : templateGroupId,
		curPath : curPath},
		function(data) {
			$("#submit").removeAttr("disabled");
			if (data.result == true) {
				alert("保存成功！");
			} else {
				if (data.message != null)
					alert(data.message);
				else
					alert("保存失败！");
			}
		}, "json");
}
</script>
</head>
<body id="bodyBG">
	<div id="con" class="con">
		<div id="tab_zzjs_1">
			<div class="padT23" style="height:300px;">
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table4">
					<tr>
						<th align="right"><font color="red">*</font>默认方案：</th>
						<td>
							<input id="curPath" class="easyui-combotree" url="${pageContext.request.contextPath}/template/listDefaultTemp.action" style="width:200px;" required="required" missingMessage="默认方案不能为空！">
						</td>
					</tr>
					<tr>
						<th colspan="2">
							<div style="padding: 10px;">
								<input type="button" value="提交" id="submit" class="btnSearch"
									onmouseout="this.className='btnSearch'"
									onmouseover="this.className='btnSearch1'"
									onclick="submitForm();" />&nbsp;&nbsp; <input type="button"
									value="重置" class="btnSearch"
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

