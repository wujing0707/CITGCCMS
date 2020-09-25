<%@ page language="java" import="java.util.*,com.wa.cms.Constant" pageEncoding="UTF-8"%>
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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/themes/default/easyui.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/themes/icon.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/cStyle.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
<title>${sysBackTitle}</title>
<script type="text/javascript">
$(function() {
	$("#groupList").treegrid({
		height: 450,
		nowrap: false,
		singleSelect: true,
		rownumbers: true,
		animate:true,
		url: "${pageContext.request.contextPath}/user/group/listAllGroups.action",
		toolbar : [ {
			text : "添加",
			iconCls : "icon-add",
			handler : function() {
				toAdd();
			}
		}],
		loadMsg: "载入中...请等待.",
        idField: "id",
        treeField:"text",
        frozenColumns:[[
            {field:'text',title:'组织机构名',width:250}
		]],
        columns:[[
            {field:"typeDes",title:"类型",width:150},
            {field:"description",title:"描述",width:350},
            {field:"id",title:"操作",width:240,align:"center",
                formatter: function(value,row) {
                    var str = "<span style='color:blue' onclick=\"javascript:window.location.href='${pageContext.request.contextPath}/user/group/groupDetails.action?groupId=" + value + "'\">修改</span>&nbsp;&nbsp;"
                    	+ "<span style='color:blue' onclick='javascript:removeGroup(" + value + ")'>删除</span>&nbsp;&nbsp;";
                    return str;
                }
            }
        ]],
        rownumbers: true
	});
});	
function toAdd() {
	window.location.href = "${pageContext.request.contextPath}/user/group/groupDetails.action";
}

function removeGroup(groupId) {
	if (confirm("确认删除组织机构？")) {
		$.post("${pageContext.request.contextPath}/user/group/removeGroup.action", {groupId: groupId},
			function(data) {
				if (data.result == true) {
					alert("删除成功！");
					$("#groupList").treegrid("reload");
				} else {
					if (data.message != null)
						alert(data.message);
					else
						alert("删除组织结构失败！");
				}
			}, "json");
	}
}
function reset() {
	$("#type").val("-2");
}
</script>
</head>
<body class="bodyBG">
    <div class="con" id="con">
  		<div class="containTit">
  			<span class="position">
		    	<div class="posiCon">组织机构管理&nbsp;>>&nbsp;列表</div>
		    </span>
		    <span class="containTitext marB10">组织机构管理</span>
		</div>
		<div id="tab_zzjs_1">
			<span class="positon">
				<h3 class="h3Auto"> <a class="tabBbg" href="javascript:void(0);"> <span>组织机构列表</span> </a> </h3>
			</span>
			<div class="padT23">
			   	<table id="groupList"></table>
			</div>
		</div>
    </div>
</body>
</html>

