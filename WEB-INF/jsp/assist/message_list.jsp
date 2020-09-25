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
$(function(){
	$("#messageListID").datagrid({
        height:364,
        nowrap: false,
        singleSelect: true,
        striped: true,
        collapsible: false,
        fitColumns: true,
        url: "${pageContext.request.contextPath}/assist/message/listMessage.action",
        queryParams: {"page": 1, "rows": 10},      
		remoteSort: false,
        loadMsg: "载入中...请等待.",
        idField: "messageId",
        columns:[[	
				{field:"title",title:"标题",width:100},
  	          	{field:"message",title:"标题留言",width:100},	          	
  	          	{field:"replyVal",title:"回复",width:100},    	
  	          	{field:"createTime",title:"留言时间",width:70},
  	          	{field:"replyDate",title:"回复时间",width:70},      	   
  	            {field:"messageId",title:"操作",width:60,align:"center",
  	                formatter: function(value,row) {
  	                  	var str = "";
  	                  str = "<span style='color:blue' onclick=\"javascript:window.location.href='${pageContext.request.contextPath}/assist/message/replyDetails.action?messageId=" + value + "'\">回复</span>&nbsp;&nbsp;&nbsp;&nbsp;"
	                  	if (row.replyVal == null)	{
	                  		str	= str + "<span style='color:blue' onclick='javascript:delMessage(" + value + ")'>删除</span>&nbsp;&nbsp;";
						}
  	                	return str;
  	                }
  	           	}                 
              ]],
              pagination: true,
              rownumbers: true,
              onLoadSuccess: function(data){
      	    	$("#messageListID").datagrid("getPager").pagination({
      	    		total: data.total
      	    	});
      	    	if (data.total == 0) {
      	    		$("#messageListID").datagrid("getPager").pagination({ 
      	    			displayMsg:"总计 {total} 条" 
      		    	}); 
      	    	} else {
      	    		$("#messageListID").datagrid("getPager").pagination({ 
      	    			displayMsg:"从{from} 条到 {to} 条，总计 {total} 条"
      		    	}); 
      	    	}
 			}
          });
          
          var options = $("#messageListID").datagrid('getPager').data("pagination").options; 
          options.beforePageText = "页码";
          $("#messageListID").datagrid('getPager').data("pagination").options = options;
});

function query(){
	var queryParams = $('#messageListID').datagrid('options').queryParams;
	queryParams.replyVal = $("#replyVal").val();
	$('#messageListID').datagrid('options').queryParams = queryParams;
    $("#messageListID").datagrid("reload");
}

function delMessage(messageId) {
	if (confirm("确认删除此条信息吗？")) {
		$.post("${pageContext.request.contextPath}/assist/message/removeMessage.action", {messageId: messageId},
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
	$("#replyVal").val("-1");
}
</script>
</head>
<body class="bodyBG">
    <div class="con" id="con">
  		 <div class="containTit">
  		 	<span class="position">
		    	<div class="posiCon">留言管理&nbsp;>>&nbsp;列表</div>
		    </span>
		    <span class="containTitext marB10">留言管理</span>
		  </div>
	    	<div class="indexSearchBox push" style="padding:10px;">
		      <table border="0" cellspacing="0" cellpadding="0">
		        <tr>
		          <td align="left">
		            <select id="replyVal"><option value="-1" selected="selected">全部状态</option><option value="0">已回复</option><option value="1">未回复</option></select>
		          </td>	    		 
	    		  <td align="left"><input type="button" value=" " class="btnSea" onmouseout="this.className='btnSea'" onmouseover="this.className='btnSea1'" onclick="query();"/></td>
	    	      <td align="left"><input type="button" value="重 置" class="btnSearch" onmouseout="this.className='btnSearch'" onmouseover="this.className='btnSearch1'" onclick="reset();"/></td>
	    	    </tr>
	    	  </table>
	    	</div>
	    	<div class="cleardiv"></div>
	        <div id="tab_zzjs_1">
	       	 	<span class="positon">
			    	<h3 class="h3Auto"> <a class="tabBbg" href="javascript:void(0);"> <span>留言列表</span> </a> </h3>
			    </span>
	        	<div class="padT23">
	           <table id="messageListID"></table>
	            </div>
	        </div>
    </div>
</body>
</html>