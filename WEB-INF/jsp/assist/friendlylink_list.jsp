<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
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
    $('#linkListID').datagrid({
        height:364,
        nowrap: false,
        singleSelect: true,
        striped: true,
        collapsible: false,
        fitColumns: true,
        url:'${pageContext.request.contextPath }/assist/friendlylink/listFriendlylink.action',
        toolbar : [ {
			text : "添加",
			iconCls : "icon-add",
			handler : function() {
				toAdd();
			}
		}],
        sortOrder: 'desc',
        remoteSort: false,
        loadMsg:'载入中...请等待.',
        idField:'ecgId',
        columns:[[
            {field:'siteName', title:'网站名称', width:120},
            {field:'domain', title:'域名', width:180},
            {field:'priority', title:'顺序', width:50},	 
            {field:"friendlylinkId", title:"操作", width:120, align:"center",
                formatter: function(value, row) {
                    var str = "<a style='color:blue' href=\"javascript: window.location.href='${pageContext.request.contextPath}/assist/friendlylink/friendlylinkDetails.action?friendlylinkId=" + value + "'\">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;"
                    	+ "<a style='color:blue' href='javascript: delModel(" + value + ")'>删除</a>&nbsp;&nbsp;";
                    return str;
                }
            }             
        ]],
        pagination: true,
        rownumbers: true,
        onLoadSuccess: function(data){
	    	$("#linkListID").datagrid("getPager").pagination({
	    		total: data.total
	    	});
	    	if (data.total == 0) {
	    		$("#linkListID").datagrid("getPager").pagination({ 
	    			displayMsg:"总计 {total} 条" 
		    	}); 
	    	} else {
	    		$("#linkListID").datagrid("getPager").pagination({ 
	    			displayMsg:"从{from} 条到 {to} 条，总计 {total} 条"
		    	}); 
	    	}
	    }
    });
    
    var options = $("#linkListID").datagrid('getPager').data("pagination").options; 
    options.beforePageText = "页码";
    $("#linkListID").datagrid('getPager').data("pagination").options = options;
});
	
function query(){
		var queryParams = $('#linkListID').datagrid('options').queryParams;
		queryParams.siteName = $("#siteName").val();
		$('#linkListID').datagrid('options').queryParams = queryParams;
	    $("#linkListID").datagrid("reload");
}

function toAdd() {
		window.location.href = "${pageContext.request.contextPath}/assist/friendlylink/friendlylinkDetails.action";
}
	
function delModel(friendlylinkId) {
		if (confirm("确认删除吗？")) {
			$.post("${pageContext.request.contextPath}/assist/friendlylink/removeFriendlylink.action", {friendlylinkId: friendlylinkId},
				function(data) {
				if (data.result == true) {
					alert("删除成功！");
					query();
				} else {
					alert("删除失败！");
				}
			}, "json");
		}
}

function reset() {
	$("#siteName").val("");
}
</script>
</head>
<body class="bodyBG">
    <div class="con" id="con">
  		 <div class="containTit">
	  		 	<span class="position">
			    	<div class="posiCon">链接管理&nbsp;>>&nbsp;列表</div>
			    </span>
			    <span class="containTitext marB10">链接管理</span>
		</div>
	    	<div class="indexSearchBox push" style="padding:10px;">
		      <table border="0" cellspacing="0" cellpadding="0">
		        <tr>
		          <td align="left"><label>网站名称：</label><input type="text" id="siteName"/></td>
	    		  <td align="left"><input type="button" value=" " class="btnSea" onmouseout="this.className='btnSea'" onmouseover="this.className='btnSea1'" onclick="query();"/></td>
	    	      <td align="left"><input type="button" value="重 置" class="btnSearch" onmouseout="this.className='btnSearch'" onmouseover="this.className='btnSearch1'" onclick="reset();"/></td>
	    	    </tr>
	    	  </table>
	    	</div>
	    	<div class="cleardiv"></div>
	        <div id="tab_zzjs_1">
	        	<span class="positon">
			    	<h3 class="h3Auto"> <a class="tabBbg" href="javascript:void(0);"> <span>链接管理</span> </a> </h3>
			    </span>
	        	<div class="padT23">
	            <table id="linkListID"></table>
	            </div>
	        </div>
    </div>
</body>
</html>