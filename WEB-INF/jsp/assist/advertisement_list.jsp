<%@ page language="java" import="java.util.*,com.wa.cms.Constant" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%> --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- <base href="<%=basePath%>" /> --%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/cStyle.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
<title>${sysBackTitle}</title>
<script type="text/javascript">
$(function(){
	$.post("${pageContext.request.contextPath}/maintain/dictionary/listDictionary.action", {type: "<%=Constant.DIC_TYPE_ADV_POSITION%>"},
		function(data) {
			for (var i = 0; i < data.rows.length; i++) {
				$("#position").append("<option value='" + data.rows[i].value + "'>" + data.rows[i].name + "</option>");
			}
		},
	"json");
	
	$("#advertisementListID").datagrid({
        height:364,
        nowrap: false,
        singleSelect: false,
        striped: true,
        collapsible: false,
        fitColumns: true,
        url: "${pageContext.request.contextPath}/assist/advertisement/listAdvertisement.action",
        toolbar : [ {
			text : "添加",
			iconCls : "icon-add",
			handler : function() {
				toAdd();
			}
		}, {
			text : "删除",
			iconCls : "icon-remove",
			handler : function() {
				delAll();
			}
		}],
        queryParams: {"page": 1, "rows": 10},      
		remoteSort: false,
        loadMsg: "载入中...请等待.",
        idField: "advertisementId",
        columns:[[	
				{field:"ck", checkbox: true},                
  	          	{field:"siteName",title:"名称",width:70},	          	
  	          	{field:"description",title:"描述",width:120},
  	          	{field:"domain",title:"域名",width:100},
  	         	{field:"positionDesc",title:"位置",width:50},
  	            {field:"advertisementId",title:"操作",width:60,align:"center",
  	                formatter: function(value,row) {
  	                  	var  str = "<span style='color:blue' onclick=\"javascript:window.location.href='${pageContext.request.contextPath}/assist/advertisement/advertisementDetails.action?advertisementId=" + value + "'\">修改</span>&nbsp;&nbsp;&nbsp;&nbsp;"
                 				+ "<span style='color:blue' onclick='javascript:delAdvertisement(" + value + ")'>删除</span>&nbsp;&nbsp;";
						return str;                 		
  	                }
  	           	}                 
              ]],
              pagination: true,
              rownumbers: true,
              onLoadSuccess: function(data){
      	    	$("#advertisementListID").datagrid("getPager").pagination({
      	    		total: data.total
      	    	});
      	    	if (data.total == 0) {
      	    		$("#advertisementListID").datagrid("getPager").pagination({ 
      	    			displayMsg:"总计 {total} 条" 
      		    	}); 
      	    	} else {
      	    		$("#advertisementListID").datagrid("getPager").pagination({ 
      	    			displayMsg:"从{from} 条到 {to} 条，总计 {total} 条"
      		    	}); 
      	    	}
 			}
          });
          
          var options = $("#advertisementListID").datagrid('getPager').data("pagination").options; 
          options.beforePageText = "页码";
          $("#advertisementListID").datagrid('getPager').data("pagination").options = options;
});

function query(){
	var queryParams = $('#advertisementListID').datagrid('options').queryParams;
	queryParams.siteName = $("#siteNameId").val();
	queryParams.position = $("#position").val();
	$('#advertisementListID').datagrid('options').queryParams = queryParams;
    $("#advertisementListID").datagrid("reload");
}

function delAdvertisement(advertisementId) {
	if (confirm("确认删除此条信息吗？")) {
		$.post("${pageContext.request.contextPath}/assist/advertisement/removeAdvertisement.action", {advertisementId: advertisementId},
			function(data) {
				if (data.result == true) {
					alert("删除成功！");
					query();			
				} else {
					alert("删除失败！");			
				}
			}, 
		"json");
	}
}

function delAll() {
	var rows = $("#advertisementListID").datagrid("getChecked");
	var rowsId = "";
	for(i = 0; i < rows.length; i++){
		rowsId += rows[i].advertisementId+",";
	}
	rowsId = rowsId.substring(0, rowsId.length-1);
	if(rows.length > 0){
		if (confirm("确认删除所有选中的信息吗？")) {
			$.post("${pageContext.request.contextPath}/assist/advertisement/removeAll.action", {ids: rowsId},
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
	else {
		alert("请选择删除项！");	
	}
}

function toAdd(){
	window.location.href = "${pageContext.request.contextPath}/assist/advertisement/advertisementDetails.action";
}

function reset() {
	$("#siteNameId").val("");
	$("#position").val("");
}
</script>
</head>
<body class="bodyBG">
    <div class="con" id="con">
		<div class="containTit">
			<span class="position">
				<div class="posiCon">广告管理&nbsp;>>&nbsp;列表</div>
			</span>
			<span class="containTitext marB10">广告管理</span>
		</div>
		<div class="indexSearchBox push" style="padding:10px 0;">
			名称：<input id="siteNameId" name="siteName" type="text">&nbsp;
			位置：<select id="position"><option value="">--请选择--</option></select>&nbsp;
			<input type="button" value=" " class="btnSea" onmouseout="this.className='btnSea'" onmouseover="this.className='btnSea1'" onclick="query();" style="vertical-align: bottom;"/>&nbsp;
			<input type="button" value="重 置" class="btnSearch" onmouseout="this.className='btnSearch'" onmouseover="this.className='btnSearch1'" onclick="reset();" style="vertical-align: bottom;"/>
		</div>
		<div id="tab_zzjs_1">
			<span class="positon">
				<h3 class="h3Auto"> <a class="tabBbg" href="javascript:void(0);"> <span>广告列表</span> </a> </h3>
			</span>
			<div class="padT23">
				<table id="advertisementListID"></table>
			</div>
		</div>
    </div>
</body>
</html>