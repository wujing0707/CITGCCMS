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
    $("#memberList").datagrid({
        height:364,
        nowrap: false,
        striped: true,
        collapsible: false,
        fitColumns: true,
        singleSelect: true,
        url: "${pageContext.request.contextPath}/user/member/listMembers.action",
        queryParams: {"page": 1, "rows": 10},
        toolbar: [{
			text: "添加",
			iconCls: "icon-add",
			handler: function() {
				toAdd();
			}
		}/*, {
			text: "删除",
			iconCls: "icon-remove",
			handler: function() {
				var checkItems = $('#memberList').datagrid('getChecked');
				var memberIds = "";
				$.each(checkItems, function (index, item) {
					memberIds +=  item.userId + ",";
				});
				memberIds = memberIds.substring(0, memberIds.length-1) ;
				removeMember(memberIds);
			}
		}*/],
        remoteSort: false,
        loadMsg: "载入中...请等待.",
        idField: "userId",
        columns:[[
            /*{field:"ck",checkbox:true,width:20},*/
            {field:"username",title:"会员",width:70},
            {field:"realname",title:"真实姓名",width:70},
            {field:"gender",title:"性别",width:30,
            	formatter: function(value) {
            		if (value == 0)
            			return "男";
            		return "女";
            	}
            },
            {field:"idcard",title:"身份证号",width:70},
            {field:"birthdate",title:"出生日期",width:50, 
            	formatter: function(value) {
            		if (value != undefined)
            			return value.substring(0, value.indexOf(" ", 0));
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
            {field:"memberId",title:"操作",width:120,align:"center",
                formatter: function(value,row) {
                    var str = "<span style='color:blue' onclick=\"javascript:window.location.href='${pageContext.request.contextPath}/user/member/memberDetails.action?memberId=" + value + "'\">修改</span>&nbsp;&nbsp;"
                    	+ "<span style='color:blue' onclick='javascript:removeMember(" + value + ")'>删除</span>&nbsp;&nbsp;";
                    
                   	if (row.status == 0)	
                       	str += "<span style='color:blue' onclick='javascript:stopOrRestartMember(" + value + ", 2)'>冻结</span>&nbsp;&nbsp;";
                    else if (row.status == 2)	
                       	str += "<span style='color:blue' onclick='javascript:stopOrRestartMember(" + value + ", 0)'>解冻</span>&nbsp;&nbsp;";
                       	
                    str	+= "<span style='color:blue' onclick='javascript:initPassword(" + value + ")'>初始化密码</span>";
                   	return str;
                }
            }
        ]],
        pagination: true,
        rownumbers: true,
        onLoadSuccess: function(data){
	    	$("#memberList").datagrid("getPager").pagination({
	    		total: data.total
	    	});
	    	if (data.total == 0) {
	    		$("#memberList").datagrid("getPager").pagination({ 
	    			displayMsg:"总计 {total} 条" 
		    	}); 
	    	} else {
	    		$("#memberList").datagrid("getPager").pagination({ 
	    			displayMsg:"从{from} 条到 {to} 条，总计 {total} 条"
		    	}); 
	    	}
	    }
    });
    
    var options = $("#memberList").datagrid('getPager').data("pagination").options; 
    options.beforePageText = "页码";
    $("#memberList").datagrid('getPager').data("pagination").options = options;
});

function query(){
	var queryParams = $('#memberList').datagrid('options').queryParams;
	queryParams.realname = $("#realname").val();
	queryParams.status = $("#status").val();
	queryParams.groupId = $("#groupId").val();
	$('#memberList').datagrid('options').queryParams = queryParams;
    $("#memberList").datagrid("reload");
}
function toAdd() {
	window.location.href = "${pageContext.request.contextPath}/user/member/memberDetails.action";
}

function removeMember(memberId) {
	if (confirm("确认删除会员？")) {
		$.post("${pageContext.request.contextPath}/user/member/removeMember.action", {memberId: memberId},
			function(data) {
			if (data.result == true) {
				alert("删除成功！");
				query();
			} else {
				alert("删除会员失败！");
			}
		}, "json");
	}
}

function stopOrRestartMember(memberId, operation) {
	var op = (operation == 0 ? "解冻" : "冻结");
	if (confirm("确认" + op + "会员？")) {
		$.post("${pageContext.request.contextPath}/user/member/stopOrRestartMember.action", {memberId: memberId, status: operation},
			function(data) {
			if (data.result == true) {
				query();
			} else {
				alert(op + "会员失败！");
			}
		}, "json");
	}
}

function initPassword(userId) {
	if (confirm("确认初始化会员密码？")) {
		$.post("${pageContext.request.contextPath}/user/member/initPassword.action", {userId: userId},
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
	$("#realname").val("");
	$("#status").val("-1");
}
</script>
</head>
<body class="bodyBG">
    <div class="con" id="con">
  		<div class="containTit">
  			<span class="position">
		    	<div class="posiCon">会员管理&nbsp;>>&nbsp;列表</div>
		    </span>
		    <span class="containTitext marB10">会员管理</span>
		</div>
	    	<div class="indexSearchBox push" style="padding:10px;">
		      <table border="0" cellspacing="0" cellpadding="0">
		        <tr>
		          <td align="left">真实姓名：<input type="text" id="realname"/></td>
		           <td align="left"><select id="status"><option value="-1">状态</option><option value="0">正常</option><option value="2">冻结</option></select></td>
	    		  <td align="left"><input type="button" value=" " class="btnSea" onmouseout="this.className='btnSea'" onmouseover="this.className='btnSea1'" onclick="query();"/></td>
	    	      <td align="left"><input type="button" value="重 置" class="btnSearch" onmouseout="this.className='btnSearch'" onmouseover="this.className='btnSearch1'" onclick="reset();"/></td>
	    	    </tr>
	    	  </table>
	    	</div>
	    	<div class="cleardiv"></div>
	        <div id="tab_zzjs_1">
	        	<span class="positon">
			    	<h3 class="h3Auto"> <a class="tabBbg" href="javascript:void(0);"> <span>会员列表</span> </a> </h3>
			    </span>
	        	<div class="padT23">
	            	<table id="memberList"></table>
	            </div>
	        </div>
    </div>
</body>
</html>

