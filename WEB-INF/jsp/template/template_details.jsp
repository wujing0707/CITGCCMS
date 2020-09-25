<%@ page language="java" import="java.util.*,java.io.File" pageEncoding="UTF-8"%>
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
var path = decodeURIComponent(decodeURIComponent("${template.path}"));

$(function() {
	$("#path").html(path.substr(path.indexOf("<%=File.separator.equals("\\") ? "\\\\" : "/"%>t<%=File.separator.equals("\\") ? "\\\\" : "/"%>"), path.length));
});

function submitForm() {
	$("#submit").attr("disabled", "disabled");
	$.post("${pageContext.request.contextPath}/template/updateTemplate.action?" + new Date().getTime(), 
		{path : path,
		content : $("#content").val()}, 
		function(data) {
			$("#submit").removeAttr("disabled");
			if (data.result == true) {
				alert("修改文件成功！");
				back();
			} else {
				if (data.message != null)
					alert(data.message);
				else
					alert("修改文件失败！");
			}
		}, "json");
}

function back() {
	var dir = path.substr(0, path.lastIndexOf("<%=File.separator.equals("\\") ? "\\\\" : "/"%>"));
	window.location.href = "${pageContext.request.contextPath}/template/templateList.action?path=" + encodeURIComponent(encodeURIComponent(dir));
}
</script>
</head>
<body id="bodyBG">
	<div id="con" class="con">
		<div id="tab_zzjs_1">
			<div class="padT23">
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					class="table4">
					<tr>
						<th align="right">文件名：</th>
						<td><span id="path"></span></td>
					</tr>
					<tr>
						<th align="right">文本：</th>
						<td><textarea cols="123" rows="24" id="content" style="resize:none">${template.content}</textarea></td>
					<tr>
						<th colspan="2">
							<div style="padding: 10px;">
								<input type="button" value="修改" id="submit" class="btnSearch"
									onmouseout="this.className='btnSearch'"
									onmouseover="this.className='btnSearch1'"
									onclick="submitForm();" />&nbsp;&nbsp; <input type="button"
									value="重置" class="btnSearch"
									onmouseout="this.className='btnSearch'"
									onmouseover="this.className='btnSearch1'"
									onclick="window.location.reload();" />&nbsp;&nbsp; <input
									type="button" value="返回" class="btnSearch"
									onmouseout="this.className='btnSearch'"
									onmouseover="this.className='btnSearch1'" onclick="back();" />
							</div>
						</th>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>

