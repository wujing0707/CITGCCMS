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
var dictionaryId = ${dictionary.dictionaryId};

$(function() {
	if (dictionaryId == 0)
		$("#submit").val("添加");
	else
		$("#submit").val("修改");
});

function submitForm() {
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
	
	$("#submitBtn").linkbutton("disable");
	var act = dictionaryId == 0 ? "add" : "update";
	$.post("${pageContext.request.contextPath}/maintain/dictionary/" + act
			+ "Dictionary.action", 
		{dictionaryId : dictionaryId,
		type : $("#type").val(),
		description : $("#description").val(),
		name : $("#name").val(),
		value : $("#value").val()},
		function(data) {
			$("#submitBtn").linkbutton("enable");
			if (data.result == true) {
				alert("保存字典数据成功！");
				back();
			} else {
				if (data.message != null)
					alert(data.message);
				else
					alert("保存字典数据失败！");
			}
		}, "json");
}
function back() {
	window.location.href = "${pageContext.request.contextPath}/maintain/dictionary/dictionaryList.action";
}
</script>
</head>
<body id="bodyBG">
	<div id="con" class="con">
		<div class="containTit">
			<span class="position">
				<div class="posiCon">
					字典数据管理 >>&nbsp;
					<c:if test="${dictionary.dictionaryId eq 0}">添加</c:if>
					<c:if test="${dictionary.dictionaryId > 0}">修改</c:if>
				</div>
			</span><span class="containTitext">字典数据管理</span>
			<div class="cleardiv"></div>
		</div>
		<div id="tab_zzjs_1">
			<span class="positon">
				<h3 class="h3Auto">
					<a href="javascript:void(0);" class="tabBbg"> <span>字典数据</span>
					</a>
				</h3>
			</span>
			<div class="padT23">
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table4">
					<tr>
						<th align="right"><font color="red">*</font>数据分类：</th>
						<td><input type="text" id="description"
							value="${dictionary.description}" class="easyui-validatebox"
							required="required" missingMessage="数据描述不能为空！" /></td>
					</tr> 
					<tr>
						<th align="right"><font color="red">*</font>字典类型：</th>
						<td><input type="text" id="type" value="${dictionary.type}"
							class="easyui-validatebox" required="required"
							missingMessage="字典类型不能为空！" /></td>
					</tr>
					<tr>
						<th align="right"><font color="red">*</font>数据属性：</th>
						<td><input type="text" id="name" value="${dictionary.name}"
							class="easyui-validatebox" required="required"
							missingMessage="数据属性不能为空！" /></td>
					</tr>
					<tr>
						<th align="right"><font color="red">*</font>数据属性值：</th>
						<td><input type="text" id="value" value="${dictionary.value}"
							class="easyui-validatebox" required="required"
							missingMessage="数据属性值不能为空！" /></td>
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

