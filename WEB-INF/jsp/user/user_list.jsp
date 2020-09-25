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
	$.post("${pageContext.request.contextPath}/user/group/listGroups.action", {},
			function(data) {
				for (var i = 0; i < data.rows.length; i++) {
					$("#groupId").append("<option value='" + data.rows[i].groupId + "'>" + data.rows[i].name + "</option>");
				}
			},
	"json");
	
    $("#userList").datagrid({
        height:364,
        nowrap: false,
        striped: true,
        collapsible: false,
        fitColumns: true,
        singleSelect: true,
        url: "${pageContext.request.contextPath}/user/user/listUsers.action",
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
        idField: "userId",
        columns:[[
            {field:"username",title:"用户名",width:100},
            {field:"realname",title:"真实姓名",width:100},
            {field:"sysGroup",title:"组织机构",width:70, 
            	formatter: function(value) {
            		if (value != undefined)
            			return value.name;
            		return "";
            	}
            },
            {field:"email",title:"邮箱",width:120},
            {field:"phone",title:"手机",width:80},
            {field:"statusDesc",title:"状态",width:50,
            	formatter: function(value) {
            		if (value == "冻结")
            			return "<font color='red'>" + value + '</font>';
            		return value;
            	}
            },
            {field:"userId",title:"操作",width:100,align:"center",
                formatter: function(value,row) {
                    var str = "<span style='color:blue' onclick=\"javascript:window.location.href='${pageContext.request.contextPath}/user/user/userDetails.action?userId=" + value + "'\">修改</span>&nbsp;&nbsp;"
                    	+ "<span style='color:blue' onclick='javascript:removeUser(" + value + ")'>删除</span>&nbsp;&nbsp;";
                    	
                    if (row.status == 0)	
                    	str += "<span style='color:blue' onclick='javascript:stopOrRestartUser(" + value + ", 2)'>冻结</span>&nbsp;&nbsp;";
                    else if (row.status == 2)	
                    	str += "<span style='color:blue' onclick='javascript:stopOrRestartUser(" + value + ", 0)'>解冻</span>&nbsp;&nbsp;";
                    	
                    str	+= "<span style='color:blue' onclick='javascript:initPassword(" + value + ")'>初始化密码</span>";
                    
                    return str;
                }
            }
        ]],
        pagination: true,
        rownumbers: true,
        onLoadSuccess: function(data){
	    	$("#userList").datagrid("getPager").pagination({
	    		total: data.total
	    	});
	    	if (data.total == 0) {
	    		$("#userList").datagrid("getPager").pagination({ 
	    			displayMsg:"总计 {total} 条" 
		    	}); 
	    	} else {
	    		$("#userList").datagrid("getPager").pagination({ 
	    			displayMsg:"从{from} 条到 {to} 条，总计 {total} 条"
		    	}); 
	    	}
	    }
    });
    
    var options = $("#userList").datagrid('getPager').data("pagination").options; 
    options.beforePageText = "页码";
    $("#userList").datagrid('getPager').data("pagination").options = options;
});

function query(){
	var queryParams = $('#userList').datagrid('options').queryParams;
	queryParams.username = $("#username").val();
	queryParams.status = $("#status").val();
	queryParams.groupId = $("#groupId").val();
	$('#userList').datagrid('options').queryParams = queryParams;
    $("#userList").datagrid("reload");
}
function toAdd() {
	window.location.href = "${pageContext.request.contextPath}/user/user/userDetails.action";
}

function removeUser(userId) {
	if (confirm("确认删除用户？")) {
		$.post("${pageContext.request.contextPath}/user/user/removeUser.action", {userId: userId},
			function(data) {
			if (data.result == true) {
				query();
			} else {
				alert("删除用户失败！");
			}
		}, "json");
	}
}

function stopOrRestartUser(userId, operation) {
	var op = (operation == 0 ? "解冻" : "冻结");
	if (confirm("确认" + op + "用户？")) {
		$.post("${pageContext.request.contextPath}/user/user/stopOrRestartUser.action", {userId: userId, status: operation},
			function(data) {
			if (data.result == true) {
				query();
			} else {
				alert(op + "用户失败！");
			}
		}, "json");
	}
}

function initPassword(userId) {
	if (confirm("确认初始化用户密码？")) {
		$.post("${pageContext.request.contextPath}/user/user/initPassword.action", {userId: userId},
			function(data) {
			if (data.result == true) {
				alert("删除成功！");
				query();
			} else {
				alert("初始化密码失败！");
			}
		}, "json");
	}
}
function reset() {
	$("#username").val("");
	$("#status").val("-1");
	$("#groupId").val("-1");
}
</script>
</head>
<body class="bodyBG">
    <div class="con" id="con">
  		 <div class="containTit">
  		 	<span class="position">
		    	<div class="posiCon">用户管理&nbsp;>>&nbsp;列表</div>
		    </span>
		    <span class="containTitext marB10">用户管理</span>
		  </div>
	    	<div class="indexSearchBox push" style="padding:10px;">
		      <table border="0" cellspacing="0" cellpadding="0">
		        <tr>
		          <td align="left">用户名：<input type="text" id="username"/></td>
	    		  <td align="left"><select id="status"><option value="-1">状态</option><option value="0">正常</option><option value="2">冻结</option></select></td>
	    		  <td align="left"><select id="groupId"><option value="-1">用户组</option></select></td>
	    		  <td align="left"><input type="button" value=" " class="btnSea" onmouseout="this.className='btnSea'" onmouseover="this.className='btnSea1'" onclick="query();"/></td>
	    	      <td align="left"><input type="button" value="重 置" class="btnSearch" onmouseout="this.className='btnSearch'" onmouseover="this.className='btnSearch1'" onclick="reset();"/></td>
	    	    </tr>
	    	  </table>
	    	</div>
	    	<div class="cleardiv"></div>
	        <div id="tab_zzjs_1">
	        	<span class="positon">
			    	<h3 class="h3Auto"> <a class="tabBbg" href="javascript:void(0);"> <span>用户列表</span> </a> </h3>
			    </span>
	        	<div class="padT23">
	            	<table id="userList"></table>
	            </div>
	        </div>
    </div>
</body>
</html>

