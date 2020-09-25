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
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/Conheight.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
<title>${sysBackTitle}</title>
<script type="text/javascript">
$(function() {
	$.post("${pageContext.request.contextPath}/maintain/dictionary/listDictionary.action", {type: "<%=Constant.DIC_TYPE_SYS_LOG_CATEGORY%>"},
		function(data) {
			for (var i = 0; i < data.rows.length; i++) {
				$("#category").append("<option value='" + data.rows[i].value + "'>" + data.rows[i].name + "</option>");
			}
		},
	"json");
	
    $("#logList").datagrid({
        height:364,
        nowrap: false,
        singleSelect: true,
        striped: true,
        collapsible: false,
        fitColumns: true,
        url: "${pageContext.request.contextPath}/system/sysLog/listSysLogs.action",
        //queryParams: {"page": 1, "rows": 20},
        remoteSort: false,
        loadMsg: "载入中...请等待.",
        idField: "sysLogId",
        columns:[[
			{field:"categoryDes",title:"日志类型",width:40},
            {field:"sysUser",title:"用户",width:40,
            	formatter: function(value) {
            		if (value != undefined)
            			return value.username;
                    return "";
                }
            },
            {field:"logDatetime",title:"时间",width:60},
            {field:"ip",title:"IP",width:50},
            {field:"url",title:"URL",width:150},
            {field:"title",title:"标题",width:40},
            {field:"content",title:"参数",width:150},
            {field:"sysLogId",title:"操作",width:50,align:"center",
                formatter: function(value,row) {
                    var str = "<span style='color:blue' onclick='javascript:removeSysLog(" + value + ")'>删除</span>&nbsp;&nbsp;";
                    return str;
                }
            }
        ]],
        pagination: true,
        rownumbers: true,
        onLoadSuccess: function(data){
	    	$("#logList").datagrid("getPager").pagination({
	    		total: data.total
	    	});
	    	if (data.total == 0) {
	    		$("#logList").datagrid("getPager").pagination({ 
	    			displayMsg:"总计 {total} 条" 
		    	}); 
	    	} else {
	    		$("#logList").datagrid("getPager").pagination({ 
	    			displayMsg:"从{from} 条到 {to} 条，总计 {total} 条"
		    	}); 
	    	}
	    }
    });
    
    var options = $("#logList").datagrid('getPager').data("pagination").options; 
    options.beforePageText = "页码";
    $("#logList").datagrid('getPager').data("pagination").options = options;
});

function query(){
	var queryParams = $('#logList').datagrid('options').queryParams;
	queryParams.category = $("#category").val();
	queryParams.username = $("#username").val();
	queryParams.title = $("#title").val();
	queryParams.ip = $("#ip").val();
	$('#logList').datagrid('options').queryParams = queryParams;
    $("#logList").datagrid("reload");
}
function removeSysLog(sysLogId) {
	if (confirm("确认删除日志？")) {
		$.post("${pageContext.request.contextPath}/system/sysLog/removeSysLog.action", {sysLogId: sysLogId},
			function(data) {
			if (data.result == true) {
				alert("删除成功！");
				query();
			} else {
				if (data.message != null)
					alert(data.message);
				else
					alert("删除日志失败！");
			}
		}, "json");
	}
}
function reset() {
	$("#category").val("-1");
	$("#username").val("");
	$("#title").val("");
	$("#ip").val("");
}
</script>
</head>
<body class="bodyBG">
    <div class="con padB35" id="con">
  		<div class="containTit">
  			<span class="position">
		    	<div class="posiCon">系统日志管理&nbsp;>>&nbsp;列表</div>
		    </span>
		     <span class="containTitext marB10">系统日志管理</span>
		 </div>
  			<div class="indexSearchBox push" style="padding:10px;">
		      <table border="0" cellspacing="0" cellpadding="0">
		        <tr>
		          <td align="left"><select id="category"><option value="-1">日志类型</option></select></td>
		          <td align="left">用户：<input type="text" id="username"/></td>
		          <td align="left">标题：<input type="text" id="title"/></td>
		          <td align="left">IP：<input type="text" id="ip"/></td>
	    		  <td align="left"><input type="button" value=" " class="btnSea" onmouseout="this.className='btnSea'" onmouseover="this.className='btnSea1'" onclick="query();"/></td>
	    	      <td align="left"><input type="button" value="重 置" class="btnSearch" onmouseout="this.className='btnSearch'" onmouseover="this.className='btnSearch1'" onclick="reset();"/></td>
	    	    </tr>
	    	  </table>
	    	</div>
	    	<div class="cleardiv"></div>
	        <div id="tab_zzjs_1">
	        	<span class="positon">
			    	<h3 class="h3Auto"> <a class="tabBbg" href="javascript:void(0);"> <span>系统日志列表</span> </a> </h3>
			    </span>
	        	<div class="padT23">
	            	<table id="logList"></table>
	            </div>
	        </div>
	    
    </div>
</body>
</html>

