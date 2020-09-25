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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/cStyle.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
<title>${sysBackTitle}</title>
<script type="text/javascript">
$(function() {
	$.post("${pageContext.request.contextPath}/maintain/dictionary/listDictionaryType.action?" + new Date().getTime(), {},
		function(data) {
			if (data.total > 0)	
				for (var i = 0; i < data.total; i++) {
					$("#type").append("<option value='" + data.rows[i].type + "'>" + data.rows[i].description + "</option>");
				}
		}, "json");
	
	$("#dictionaryList").datagrid({
		height : 364,
		singleSelect: true,
		nowrap : false,
		striped : true,
		collapsible : false,
		fitColumns : true,
		url : "${pageContext.request.contextPath}/maintain/dictionary/listDictionaries.action?" + new Date().getTime(),
		queryParams : {"page" : 1, "rows" : 10},
		toolbar : [{
			text : "添加",
			iconCls : "icon-add",
			handler : function() {
				toAdd();
			}
		}],
		remoteSort : false,
		loadMsg : "载入中...请等待.",
		idField : "type",
		columns : [[ 
		    {field : "description", title : "数据分类", width : 70},
		    {field : "type", title : "字典类型", width : 70},
			{field : "name", title : "数据属性", width : 70},
			{field : "value", title : "数据属性值", width : 70},
			{field : "dictionaryId", title : "操作", width : 120, align : "center", 
					formatter : function(value, row) {
					var str = "<span style='color:blue' onclick=\"javascript:window.location.href='${pageContext.request.contextPath}/maintain/dictionary/dictionaryDetails.action?dictionaryId="
							+ value
							+ "'\">修改</span>&nbsp;&nbsp;"
							+ "<span style='color:blue' onclick='javascript:removeDictionary("
							+ value
							+ ")'>删除</span>&nbsp;&nbsp;";
					return str;
				}
			}
		]],
		pagination : true,
		rownumbers : true,
		onLoadSuccess : function(data) {
			$("#dictionaryList").datagrid("getPager").pagination({
				total : data.total
			});
			if (data.total == 0) {
				$("#dictionaryList").datagrid("getPager").pagination({
					displayMsg : "总计 {total} 条"
				});
			} else {
				$("#dictionaryList").datagrid("getPager").pagination({
					displayMsg : "从{from} 条到 {to} 条，总计 {total} 条"
				});
			}
		}
	});

	var options = $("#dictionaryList").datagrid('getPager').data("pagination").options;
	options.beforePageText = "页码";
	$("#dictionaryList").datagrid('getPager').data("pagination").options = options;
});

function query() {
	var queryParams = $('#dictionaryList').datagrid('options').queryParams;
	queryParams.type = $("#type").val();
	$('#dictionaryList').datagrid('options').queryParams = queryParams;
	$("#dictionaryList").datagrid("reload");
}
function toAdd() {
	window.location.href = "${pageContext.request.contextPath}/maintain/dictionary/dictionaryDetails.action";
}

function removeDictionary(dictionaryId) {
	if (confirm("确认删除数据字典？")) {
		$.post("${pageContext.request.contextPath}/maintain/dictionary/removeDictionary.action",
			{dictionaryId : dictionaryId},
			function(data) {
				if (data.result == true) {
					alert("删除成功！");
					query();
				} else {
					if (data.message != null)
						alert(data.message);
					else
						alert("删除失败！");
				}
			}, "json");
	}
}

function reset() {
	$("#type").val("");
}
</script>
</head>
<body id="bodyBG">
	<div class="con" id="con">
		<div class="containTit">
			<span class="position">
		    	<div class="posiCon">字典数据管理&nbsp;>>&nbsp;列表</div>
		    </span>
		    <span class="containTitext marB10">用户管理</span>
		 </div>
	    	<div class="indexSearchBox push" style="padding:10px;">
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td align="left">
							<select id="type">
								<option value="">所有数据分类</option>
							</select>
						</td>
						<td align="left"><input type="button" 
							class="btnSea" onmouseout="this.className='btnSea'"
							onmouseover="this.className='btnSea1'" onclick="query();" /></td>
						<td align="left"><input type="button" value="重 置" class="btnSearch" onmouseout="this.className='btnSearch'" onmouseover="this.className='btnSearch1'" onclick="reset();"/></td>
					</tr>
				</table>
			</div>
			<div class="cleardiv"></div>
			<div id="tab_zzjs_1">
				<span class="positon">
			    	<h3 class="h3Auto"> <a class="tabBbg" href="javascript:void(0);"> <span>字典数据列表</span> </a> </h3>
			    </span>
	        	<div class="padT23">
					<table id="dictionaryList"></table>
				</div>
			</div>
	</div>
</body>
</html>

