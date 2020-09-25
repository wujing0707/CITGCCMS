<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${sysBackTitle}</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.4.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.4.3/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/cStyle.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
<script>

var auth = 4194303;
var toolbar = new Array();
if((auth & 4) > 0){
	if(toolbar.length > 0)
		toolbar.push('-');
 	toolbar.push({
        iconCls: 'icon-remove',
        text: '审核',
        handler: function(){appByIds();}
    }); 
}
if((auth & 4) > 0){
	if(toolbar.length > 0)
		toolbar.push('-');
 	toolbar.push({
        iconCls: 'icon-add',
        text: '发布',
        handler: function(){FBByIds();}
    }); 
}
function appByIds(){
	var rows = $("#contentList").datagrid("getSelections");
	var rowsId = "";
	for(i = 0; i < rows.length; i++){
		if(rows[i].audit != 0){
			$.messager.alert('提示','已审核内容不可再审核!','info');
			return;
		}
		rowsId += rows[i].contentId+",";
	}
	rowsId = rowsId.substring(0, rowsId.length-1);
	if(rows.length > 0){
	    $.messager.confirm("提示", "您确认要审核这"+rows.length+"条内容吗？", function(r){
	        if(r){
	            $.post("${pageContext.request.contextPath}/content/appByIds.action", {ids: rowsId},
	                    function(data){
	                        if(data.result){
	                            slide(data.message)
	                            $('#contentList').datagrid('reload');
	                            $('#contentList').datagrid('clearSelections');
	                            rows.length=0;
	                        }else{
	                        	slide(data.message);
	                        }clean();
	                    }, "json");
	        }
	    });
	}else{
		$.messager.alert('选择','请先选择要审核的内容!','info');
	}
}
function FBByIds(){
	var rows = $("#contentList").datagrid("getSelections");
	var rowsId = "";
	for(i = 0; i < rows.length; i++){
		if(rows[i].audit == 0){
			$.messager.alert('提示','请审核后再进行内容发布!','info');
			return;
		}else if(rows[i].audit == 2){
			$.messager.alert('提示','已发布内容不可再发布!','info');
			return;
		}
		rowsId += rows[i].contentId+",";
	}
	rowsId = rowsId.substring(0, rowsId.length-1);
	if(rows.length > 0){
	    $.messager.confirm("提示", "您确认要发布这"+rows.length+"条内容吗？", function(r){
	        if(r){
	            $.post("${pageContext.request.contextPath}/content/FBByIds.action", {ids: rowsId},
	                    function(data){
	                        if(data.result){
	                            slide(data.message)
	                            $('#contentList').datagrid('reload');
	                            $('#contentList').datagrid('clearSelections');
	                            rows.length=0;
	                        }else{
	                        	slide(data.message);
	                        }clean();
	                    }, "json");
	        }
	    });
	}else{
		$.messager.alert('选择','请先选择要发布的内容!','info');
	}
}
$(function() {
	$('#orderProperty').next(".combo").hide(); 
	$('#isAsc').next(".combo").hide(); 
	$('#contentList').datagrid({
		height: 350,
		rownumbers: true,
		singleSelect: false,
		idField:'contentId',
		striped: true,
		url: "${pageContext.request.contextPath}/content/listContentsApp.action",
		queryParams: {},
   		selectOnCheck: true,
    	checkOnSelect: true,
		pagination: true,
		toolbar: toolbar,
		columns: [[
            {field: 'ck', checkbox: true,width:$(this).width() * 0.05,hidden:false},
            {field: 'contentId', title:'编号',width:$(this).width() * 0.1},   // , 
            {field: 'channelNameString', title:'所属栏目',width:$(this).width() * 0.1}, 
            {field: 'title', title:'标题',width:$(this).width() * 0.15,
                formatter: function(value, rowData, index){
                	var a = "<a href='javascript: queryOfPreview(\""+rowData.contentId+"\");' style='padding: 5px;'>"+rowData.title+"</a>";
                    return a;
                }
            },
            {field: 'releaseTime',title:'编辑时间', width:$(this).width() * 0.18},
            {field: 'createTime',title:'创建时间', width:$(this).width() * 0.18,hidden:true},
            {field: 'audit',title:'状态', width:$(this).width() * 0.1, 
            	formatter: function(value, rowData, index){
            		var html="";
                	if (rowData.audit=='1')
                   	{
                		html += "待发布";
	                }
                    if (rowData.audit=='0')
                    {
                   	   html += "待审核";
                    }
                    if (rowData.audit=='2')
                    {
                    	html += "已发布";
                    }
                	return html; 
            }},
            {field: 'edit',title:'操作', width:$(this).width() * 0.21,
                formatter: function(value, rowData, index){
                	var html="";
                	if (rowData.audit=='1')
                   	{
                		html += "<a href='javascript: fb(\""+rowData.contentId+"\");' style='margin: 5px; color: blue;'>发布</a>";
	                }
                    if (rowData.audit=='0')
                    {
                	   var path = "${pageContext.request.contextPath}/content/queryByIdforAudit.action?id="+rowData.contentId;
                   	   html += "<a href='" +path+ "' style='margin: 5px; color: blue;'>审核</a>";
                    }
                    if (rowData.audit=='2')
                    {
                    	html += "<a href='javascript: cx(\""+rowData.contentId+"\");' style='margin: 5px; color: blue;'>撤回</a>";
                    }
                	return html;   
                }
            }
		]]
	});
	
	
	$("#status").combobox({
		width: 120,
        editable: false,
        panelHeight: "auto",
        url: "${pageContext.request.contextPath}/content/queryStatusList.action",
        valueField: "id",
        textField: "text"
	});
	
});

/**
 * 审核
 */
function audit(id){
	$.post("audit.action", {id: id},
            function(data){
                if(data.result){
                    slide(data.message);
                }else{
                	slide(data.message);
                }
               $('#contentList').datagrid('reload');
            }, "json");
}

function clean(){
	var rows = $("#contentList").datagrid("getSelections");
	rows.length=0;
}



/**
 * 撤销
 */
function cx(id){
	$.messager.confirm("提示", "您确认要撤回这条内容吗？", function(r){
	if(r){
		$.post("cx.action", {id: id},
	            function(data){
	                if(data.result){
	                    slide(data.message);
	                }else{
	                	slide(data.message);
	                }
	               $('#contentList').datagrid('reload');
	            }, "json");
        }
	});
}

/**
 * 发布
 */
function fb(id){
	$.messager.confirm("提示", "您确认要发布这条内容吗？", function(r){
	if(r){
		$.post("fb.action", {id: id},
	            function(data){
	                if(data.result){
	                    slide(data.message);
	                }else{
	                	slide(data.message);
	                }
	               $('#contentList').datagrid('reload');
	            }, "json");
    }
	});
}

/**
 * 右下角信息提示框
 */
function slide(msg){
    $.messager.show({
        title: "提示",
        msg: msg,
        timeout: 3000,
        showType: "slide"
    });
}


/**
 * 根据查询条件，查询响应信息
 */
function query(){
    var queryParams = $('#contentList').datagrid('options').queryParams;
    queryParams.title=$("#title").val();
    queryParams.audit = $("#audit").combobox('getValue'); 
    queryParams.channelid = $('#parentId').combotree('getValue');
    $('#contentList').datagrid('options').queryParams = queryParams;
    $("#contentList").datagrid("load");
    $("#contentList").datagrid("uncheckAll");
}

function queryOfPreview(contentId, category){
    window.open("${pageContext.request.contextPath}/content/queryOfPreview.action?contentId="+contentId,
            'newwindow','height=900,width=1000,top='+(window.screen.availHeight-30-900)/2+
            ',left='+(window.screen.availWidth-10-1000)/2+
            ',toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no');
}


function reset() {
	$('.easyui-combotree').combotree("clear");
	$('.easyui-combobox').combobox("clear");
	$("#title").val("");
}


</script>
<title>发布审核-列表</title>
</head>
<body class="bodyBG">
    <div class="con" id="con">
            <div class="containTit">
            <span class="position">
                <div class="posiCon">发布审核&nbsp;>>&nbsp;列表</div>
            </span>
            <span class="containTitext marB10">发布审核</span>
            </div>
            <div class="indexSearchBox push" style="padding:10px 0;">
            栏目名称：<input class="easyui-combotree"	id="parentId"  data-options=" url: ' ${pageContext.request.contextPath}/channel/listChannels.action' " >
               <input type="hidden" id="creatorId" value="${userId }" />
			<span>审核状态：
			       <select id="audit" class="easyui-combobox" data-options="editable:false,panelHeight:'auto',width:90">
			       		<option value="" selected="selected">--请选择--</option>
			       		<option value="0">待审核</option>
			       		<option  value="1">待发布</option>
			       		<option value="2">已发布</option>
			        </select>&nbsp;</span>
			    <input type="button" 
							class="btnSea" onmouseout="this.className='btnSea'"
							onmouseover="this.className='btnSea1'" onclick="query();" style="vertical-align: bottom;"/>&nbsp;
				<input type="button" value="重 置" class="btnSearch" onmouseout="this.className='btnSearch'" onmouseover="this.className='btnSearch1'" onclick="reset();" style="vertical-align: bottom;"/>
		    </div>
		    
            <div id="tab_zzjs_1">
                <span class="positon">
                    <h3 class="h3Auto"> <a class="tabBbg" href="javascript:void(0);"> <span>发布审核</span> </a> </h3>
                </span>
                <div class="padT23">
                    <table id="contentList"></table>
                </div>
            </div>
    </div>
</body>
</html>