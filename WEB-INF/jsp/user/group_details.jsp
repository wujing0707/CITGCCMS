<%@ page language="java" import="java.util.*,com.wa.cms.Constant" pageEncoding="UTF-8"%>
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
<script type="text/javascript">
var groupId = ${group.groupId};

$(function(){
	if ($("#pId").val() != "" && $("#pId").val() != "0")
		$("#parentId").combotree("setValue", $("#pId").val());
	
<%-- 	$.post("${pageContext.request.contextPath}/maintain/dictionary/listDictionary.action", {type: "<%=Constant.DIC_TYPE_GROUP_TYPE%>"},
		function(data) {
			for (var i = 0; i < data.rows.length; i++) {
				var sel = (data.rows[i].value == ${group.type} ? " selected" : "");
				$("#type").append("<option value='" + data.rows[i].value + "'" + sel + ">" + data.rows[i].name + "</option>");
			}
		}, "json"); --%>
});

function submitForm() {
	$("#name").val($.trim($("#name").val()));
	if (!$("#name").validatebox("isValid"))
		return;
	
	$("#submit").attr("disabled","disabled");
	var act = groupId == 0 ? "add" : "update";
	$.post("${pageContext.request.contextPath}/user/group/" + act + "Group.action", 
		{groupId: groupId, 
		name: $("#name").val(), 
		description: $.trim($("#description").val()), 
		/* type: $("#type").val(),  */
		parentId: $("#parentId").combotree("getValue")},
		function(data) {
			$("#submit").removeAttr("disabled");
			if (data.result == true) {
				alert($("#submit").val() + "组织机构成功！");
				back();
			} else {
				if (data.message != null)
					alert(data.message);
				else
					alert($("#submit").val() + "组织机构失败！");
			}
		},
	"json");
}
function back() {
	window.location.href = "${pageContext.request.contextPath}/user/group/groupList.action";
}
function clearParent() {
	$("#parentId").combotree("setValue", "");
}
</script>
</head>
<body class="bodyBG">
    <div id="con" class="con" >
    	<input type="hidden" id="pId" value="${group.sysGroup.groupId}">
    	<div class="containTit">
    		<span class="position">
		    	<div class="posiCon">组织机构管理 >>&nbsp;<c:if test="${group.groupId eq 0}">添加</c:if><c:if test="${group.groupId > 0}">修改</c:if></div>
		    </span><span class="containTitext">组织机构管理</span>
		    <div class="cleardiv"></div>
	  	</div>
    	<div id="tab_zzjs_1"> 
    		<span class="positon">
		    	<h3 class="h3Auto"><a href="javascript:void(0);" class="tabBbg"> <span>组织机构表单</span> </a></h3>
		    </span>
	        <div class="padT23">
	        	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table4">
	        	<tr>
	        		<th align="right"><font color="red">*</font>组织机构名：</th><td><input type="text" id="name" value="${group.name}" class="easyui-validatebox" required="required" missingMessage="组织机构名不能为空！" maxlength="23"/></td>
	        	</tr>
	        	<tr>
	        		<th align="right">描述：</th><td><textarea cols="48" rows="4" id="description" style="resize:none" maxlength="75">${group.description}</textarea></td>
	        	</tr>
	        	<!-- <tr>
	        		<th align="right">类型：</th><td><select id="type"><option value="-1">--请选择--</option></select></td>
	        	</tr> -->
	        	<tr>
	        		<th align="right">上级组织机构：</th><td colspan="3">
	        		  <input id="parentId" class="easyui-combotree" url="${pageContext.request.contextPath}/user/group/listAllGroups.action" style="width:200px;">&nbsp;&nbsp;
	        		  <input type="button" value="清空" class="btnSearch" onmouseout="this.className='btnSearch'" onmouseover="this.className='btnSearch1'" onclick="clearParent();"/>
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

