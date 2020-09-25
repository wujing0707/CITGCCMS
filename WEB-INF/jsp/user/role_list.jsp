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
<%-- <base href="<%=basePath%>" /> --%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/themes/default/easyui.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/themes/icon.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/cStyle.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
<script type="text/javascript">
$(function() {
    $("#roleList").datagrid({
        height:364,
        nowrap: false,
        singleSelect: true,
        striped: true,
        collapsible: false,
        fitColumns: true,
        url: "${pageContext.request.contextPath}/user/role/listRoles.action",
        queryParams: {"page": 1, "rows": 10},
        toolbar : [ {
			text : "添加",
			iconCls : "icon-add",
			handler : function() {
				toAdd();
			}
		}],
        remoteSort: false,
        loadMsg: "载入中...请等待.",
        idField: "roleId",
        columns:[[
            {field:"name",title:"角色名",width:200},
            {field:"description",title:"描述",width:200},
            {field:"roleId",title:"操作",width:200,align:"center",
                formatter: function(value,row) {
                    var str = "<span style='color:blue' onclick=\"javascript:window.location.href='${pageContext.request.contextPath}/user/role/roleDetails.action?roleId=" + value + "'\">修改</span>&nbsp;&nbsp;"
                    	+ "<span style='color:blue' onclick='javascript:removeRole(" + value + ")'>删除</span>&nbsp;&nbsp;";
                    return str;
                }
            }
        ]],
        pagination: true,
        rownumbers: true,
        onLoadSuccess: function(data){
	    	$("#roleList").datagrid("getPager").pagination({
	    		total: data.total
	    	});
	    	if (data.total == 0) {
	    		$("#roleList").datagrid("getPager").pagination({ 
	    			displayMsg:"总计 {total} 条" 
		    	}); 
	    	} else {
	    		$("#roleList").datagrid("getPager").pagination({ 
	    			displayMsg:"从{from} 条到 {to} 条，总计 {total} 条"
		    	}); 
	    	}
	    }
    });
    
    var options = $("#roleList").datagrid('getPager').data("pagination").options; 
    options.beforePageText = "页码";
    $("#roleList").datagrid('getPager').data("pagination").options = options;
});

function query(){
    $("#roleList").datagrid("reload");
}
function toAdd() {
	window.location.href = "${pageContext.request.contextPath}/user/role/roleDetails.action";
}

function removeRole(roleId) {
	if (confirm("确认删除角色？")) {
		$.post("${pageContext.request.contextPath}/user/role/removeRole.action", {roleId: roleId},
			function(data) {
			if (data.result == true) {
				alert("删除成功！");
				query();
			} else {
				if (data.message != null)
					alert(data.message);
				else
					alert("删除角色失败！");
			}
		}, "json");
	}
}
</script>
<title>${sysBackTitle}</title>
</head>
<body class="bodyBG">
    <div class="con" id="con">
		<div class="containTit">
  			<span class="position">
		    	<div class="posiCon">角色管理&nbsp;>>&nbsp;列表</div>
		    </span>
		    <span class="containTitext marB10">角色管理</span>
		</div>
		<div id="tab_zzjs_1">
				<span class="positon">
	    	<h3 class="h3Auto"> <a class="tabBbg" href="javascript:void(0);"> <span>角色列表</span> </a> </h3>
	    </span>
       	<div class="padT23">
           	 <table id="roleList"></table>
           </div>
        </div>
    </div>
</body>
</html>

