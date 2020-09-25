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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/themes/default/easyui.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/themes/icon.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/cStyle.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
<title>${sysBackTitle}</title>
<script type="text/javascript">
$(function() {
    $("#workflowList").datagrid({
        height:364,
        nowrap: false,
        singleSelect: true,
        striped: true,
        collapsible: false,
        fitColumns: true,
        url: "${pageContext.request.contextPath}/system/workflow/listWorkflows.action?" + new Date().getTime(),
        queryParams: {"page": 1, "rows": 10},
        toolbar : [ {
			text : "添加",
			iconCls : "icon-add",
			handler : function() {
				toAdd();
			}
		}],
        remoteSort: false,
        loadMsg: "载入中..`请等待.",
        idField: "workflowId",
        columns:[[
            {field:"name",title:"工作流名称",width:70},
            {field:"description",title:"描述",width:70},
            {field:"finalAppRole",title:"终审角色",width:70},
            {field:"isCurrent",title:"是否为默认工作流",width:100,align:"center",
    			formatter: function(value,rowData){
            		var str;
            		if(rowData.isCurrent == 1)
            			str = "非默认 ";
            		if(rowData.isCurrent == 0)
            			str = "<span style='color:red'>默认</span>";
            		return str;
            	}
            },
            {field:"edit",title:"操作",width:120,align:"center",
                formatter: function(value,rowData) {
                    var html = "<span style='color:blue' onclick=\"javascript:window.location.href='${pageContext.request.contextPath}/system/workflow/workflowDetails.action?workflowId=" + rowData.workflowId + "'\">修改</span>&nbsp;&nbsp;"
                    	+ "<span style='color:blue' onclick='javascript:removeWorkflow(" + rowData.workflowId + ")'>删除</span>&nbsp;&nbsp;";
                    	if(rowData.isCurrent == 1)
                    		html += "<a href='javascript: setById(\""+rowData.workflowId+"\");' style='color:blue;'>设置为默认工作流</a>";
                    	if(rowData.isCurrent == 0)
                        	html += "<a href='javascript: updateById(\""+rowData.workflowId+"\");' style='color:blue;'>取消其默认工作流</a>";
                    return html;
                }
            }
        ]],
        pagination: true,
        rownumbers: true,
        onLoadSuccess: function(data){
	    	$("#workflowList").datagrid("getPager").pagination({
	    		total: data.total
	    	});
	    	if (data.total == 0) {
	    		$("#workflowList").datagrid("getPager").pagination({ 
	    			displayMsg:"总计 {total} 条" 
		    	}); 
	    	} else {
	    		$("#workflowList").datagrid("getPager").pagination({ 
	    			displayMsg:"从{from} 条到 {to} 条，总计 {total} 条"
		    	}); 
	    	}
	    }
    });
    
    var options = $("#workflowList").datagrid('getPager').data("pagination").options; 
    options.beforePageText = "页码";
    $("#workflowList").datagrid('getPager').data("pagination").options = options;
});

function toAdd() {
	window.location.href = "${pageContext.request.contextPath}/system/workflow/workflowDetails.action?" + new Date().getTime();
}

function removeWorkflow(workflowId) {
	if (confirm("确认删除工作流？"))
		$.post("${pageContext.request.contextPath}/system/workflow/removeWorkflow.action",
			{workflowId: workflowId},
			function(data) {
				if (data.result) {
					alert("删除成功！");
					back();
				} else {
					if (data.message != null)
						alert(data.message);
					else
						alert("删除工作流失败！");
				}
			}, "json");
}

/**
 * 设置为默认工作流 
 */
function setById(id) {
    if (confirm("您确认要设置为默认工作流？"))
       	$.post("${pageContext.request.contextPath}/system/workflow/setCurrent.action?" + new Date().getTime(),
       		{id: id},
            function(data) {
                if (data.result) {
                   back();
                } else {
                   alert(data.message);
                }
           }, "json");
}
/**
 * 取消默认工作流 
 */
function updateById(ids){
	if (confirm("您确认要取消默认工作流？"))
       	$.post("${pageContext.request.contextPath}/system/workflow/updateCurrent.action?" + new Date().getTime(),
       		{ids: ids},
			function(data) {
				if (data.result) {
				   back();
				} else {
				   alert(data.message);
				}
			}, "json");
}

function back() {
	window.location.reload();
}
</script>
</head>
<body class="bodyBG">
    <div class="con" id="con">
  		<div class="containTit">
  			<span class="position">
  				<div class="posiCon">工作流管理&nbsp;>>&nbsp;列表</div>
		    </span>
		    <span class="containTitext marB10">工作流管理</span>
		</div>
    	<div class="cleardiv"></div>
        <div id="tab_zzjs_1">
        	<span class="positon">
		    	<h3 class="h3Auto"> <a class="tabBbg" href="javascript:void(0);"> <span>工作流列表</span> </a> </h3>
		    </span>
        	<div class="padT23">
            	<table id="workflowList"></table>
            </div>
        </div>
    </div>
</body>
</html>

