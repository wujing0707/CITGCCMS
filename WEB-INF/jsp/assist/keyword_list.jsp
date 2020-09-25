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
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/locale/easyui-lang-zh_CN.js"></script>
<title>${sysBackTitle}</title>
<script type="text/javascript">
$(function(){
	$("#keywordListID").datagrid({
        height:364,
        nowrap: false,
        singleSelect: false,
        striped: true,
        collapsible: false,
        fitColumns: true,
        url: "${pageContext.request.contextPath}/assist/keyword/listKeyword.action",
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
        idField: "keywordId",
        columns:[[	
				{field:"ck", checkbox: true},                
  	          	{field:"name",title:"敏感词",width:70},	          	    	
  	          	{field:"replaceValue",title:"替换内容",width:120},
  	          	{field:"isDisabled",title:"是否启用",width:150,align:"center",
  	          		formatter: function(value) {
  	          			var str = "";
  	          			if(value == 0) {
  	          				str = "是";
  	          			}
  	          			else {
  	          				str = "否";
  	          			}
  	          			return str;
  	          		}
  	          	},      	   
  	            {field:"keywordId",title:"操作",width:60,align:"center",
  	                formatter: function(value, row) {
  	                  	var  str = "<span style='color:blue' onclick=\"javascript:window.location.href='${pageContext.request.contextPath}/assist/keyword/keywordDetails.action?keywordId=" + value + "'\">修改</span>&nbsp;&nbsp;&nbsp;&nbsp;"
                 				+ "<span style='color:blue' onclick='javascript:delKeyword(" + value + ")'>删除</span>&nbsp;&nbsp;";
          				if (row.isDisabled == 0) {
                   			str += "<span style='color:black' onclick='javascript:startOrStopKeyword(" + value + ", 1)'>禁用</span>&nbsp;&nbsp;";
                   		} else {
                   			str += "<span style='color:black' onclick='javascript:startOrStopKeyword(" + value + ", 0)'>启用</span>&nbsp;&nbsp;";
                   		}
          				return str;                		
  	                }
  	           	}                 
              ]],
              pagination: true,
              rownumbers: true,
              onLoadSuccess: function(data){
      	    	$("#keywordListID").datagrid("getPager").pagination({
      	    		total: data.total
      	    	});
      	    	if (data.total == 0) {
      	    		$("#keywordListID").datagrid("getPager").pagination({ 
      	    			displayMsg:"总计 {total} 条" 
      		    	}); 
      	    	} else {
      	    		$("#keywordListID").datagrid("getPager").pagination({ 
      	    			displayMsg:"从{from} 条到 {to} 条，总计 {total} 条"
      		    	}); 
      	    	}
 			}
          });
          
          var options = $("#keywordListID").datagrid('getPager').data("pagination").options; 
          options.beforePageText = "页码";
          $("#keywordListID").datagrid('getPager').data("pagination").options = options;
});

function query(){
	var queryParams = $('#keywordListID').datagrid('options').queryParams;
	queryParams.name = $("#nameId").val();
	$('#keywordListID').datagrid('options').queryParams = queryParams;
    $("#keywordListID").datagrid("reload");
    $("#keywordListID").datagrid("unselectAll");
}

function delKeyword(keywordId) {
	 $.messager.confirm("提示","确认删除此条信息吗？", function(r){
		if(r){
			$.post("${pageContext.request.contextPath}/assist/keyword/removeKeyword.action?" + new Date().getTime(), {keywordId: keywordId},
					function(data) {
						if (data.result == true) {
							$.messager.alert("成功", "删除成功！","info", function(r){
									query();			
						    });
						} else {
							$.messager.alert('失败','删除失败!',"error", function(r){});	
						}
				}, "json");
		} 
	 });
}

function startOrStopKeyword(keywordId, action) {
	$.messager.confirm("提示","确认" + (action == 0 ? "启用" : "禁用") + "敏感词？",function(r){
		if(r){
			$.post("${pageContext.request.contextPath}/assist/keyword/startOrStopKeyword.action?" + new Date().getTime(), 
				{keywordId: keywordId, isDisabled: action},
				function(data) {
					if (data.result)
						query();			
				}, "json");
		}
	});
}

function delAll() {
	var rows = $("#keywordListID").datagrid("getChecked");
	var rowsId = "";
	for(i = 0; i < rows.length; i++){
		rowsId += rows[i].keywordId+",";
	}
	rowsId = rowsId.substring(0, rowsId.length-1);
	if(rows.length > 0){
		$.messager.confirm("提示","确认删除所有选中的信息吗？",function(r){
			if(r){
				$.post("${pageContext.request.contextPath}/assist/keyword/removeAll.action", {ids: rowsId},
					function(data) {
						if (data.result == true) {
							$.messager.alert("成功", "删除成功！","info", function(r){
									query();			
						    });
						} else {
							$.messager.alert('失败','删除失败!',"error", function(r){});	
						}
				}, "json");
			}
		});
	}
}

function toAdd(){
	window.location.href = "${pageContext.request.contextPath}/assist/keyword/keywordDetails.action";
}

function reset() {
	$("#nameId").val("");
}
</script>
</head>
<body class="bodyBG">
    <div class="con" id="con">
  		 <div class="containTit">
  		 	<span class="position">
		    	<div class="posiCon">敏感词管理&nbsp;>>&nbsp;列表</div>
		    </span>
		    <span class="containTitext marB10">敏感词管理</span>
		   </div>
	    	<div class="indexSearchBox push" style="padding:10px;">
		      <table border="0" cellspacing="0" cellpadding="0">
		        <tr>
		          <td align="left">
		          	<label>敏感词：</label><input id="nameId" name="name" type="text">
		          </td>	    		 
	    		  <td align="left"><input type="button" value=" " class="btnSea" onmouseout="this.className='btnSea'" onmouseover="this.className='btnSea1'" onclick="query();"/></td>
	    	      <td align="left"><input type="button" value="重 置" class="btnSearch" onmouseout="this.className='btnSearch'" onmouseover="this.className='btnSearch1'" onclick="reset();"/></td>
	    	    </tr>
	    	  </table>
	    	</div>
	    	<div class="cleardiv"></div>
	        <div id="tab_zzjs_1">
	        	<span class="positon">
			    	<h3 class="h3Auto"> <a class="tabBbg" href="javascript:void(0);"> <span>敏感词列表</span> </a> </h3>
			    </span>
	        	<div class="padT23">
	            	<table id="keywordListID"></table>
	            </div>
	        </div>
    </div>  
</body>
</html>