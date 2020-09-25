<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
var auth = ${sysUser.authorityValue};
auth = 4194303;
var toolbar = new Array();

if((auth & 4) > 0){
	if(toolbar.length > 0)
		toolbar.push('-');
	toolbar.push({
        iconCls: 'icon-remove',
        text: '还原',
        handler: function(){updateByIds();}
    });
}
if((auth & 4) > 0){
	if(toolbar.length > 0)
		toolbar.push('-');
 	toolbar.push({
        iconCls: 'icon-remove',
        text: '删除',
        handler: function(){deleteByIds();}
    }); 
}
$(function() {
	$('#contentList').datagrid({
		height: 320,
		idField:'contentId',
		rownumbers: true,
   		selectOnCheck: true,
    	checkOnSelect: true,
		url: "${pageContext.request.contextPath}/content/recycleContents.action",
		queryParams: {},
		pagination: true,
		toolbar: toolbar,
		columns: [[
            {field: 'ck', checkbox: true},
            {field: 'contentId', title:'编号'},   // , hidden: true
            {field: 'title', title:'标题',width:410,formatter : function(value) {return "<span title='"+value+"'>"+value+"</span>";}},
            {field: 'channelNameString', title:'所属栏目',width:150}, 
     //      {field: 'contentTypeName',title:'类型',width: 80},
     //       {field: 'creatorName',title:'内容上报人员',width: 100},
            {field: 'releaseTime',title:'删除时间',width: 130},
            {field: 'status',title:'状态',width: 130,hidden:true},
            {field: 'edit',title:'操作',width: 100, 
                formatter: function(value, rowData, index){                  
                    var a = "<a href='javascript: updateById(\""+rowData.contentId+"\");' style='margin: 5px; color: blue;'>还原</a><a href='javascript: perdeleteById(\""+rowData.contentId+"\");' style='margin: 5px; color: blue;'>永久删除</a>"; 
                    return a; 
                }
            }
		]]
	});

});


/**
 * 还原信息
 */
function updateById(id1){
    $.messager.confirm("提示", "您确认要还原此条内容吗？", function(r){
        if(r){
        	$.post("${pageContext.request.contextPath}/content/updateById.action", {id1: id1},
                    function(data){
                        if(data.result){
                            slide(data.message);
                        }else{
                        	slide(data.message);
                        } 
                        $('#contentList').datagrid('load');
                        clean();
                    }, "json");
        }
    });
}
/**
 * 批量还原信息
 */
function updateByIds(){
	var rows = $("#contentList").datagrid("getSelections");
	var rowsId = "";
	for(i = 0; i < rows.length; i++){
		rowsId += rows[i].contentId+",";
	}
	rowsId = rowsId.substring(0, rowsId.length-1);
	if(rows.length > 0){
	    $.messager.confirm("提示", "您确认要还原这"+rows.length+"条内容吗？", function(r){
	        if(r){
	            $.post("${pageContext.request.contextPath}/content/updateByIds.action", {id2: rowsId},
	                    function(data){
	                        if(data.result){
	                            slide(data.message);
	                         //  back();
	                        }else{
	                        	slide(data.message);
	                        }
	                        clean();
                            $('#contentList').datagrid('reload');
	                    }, "json");
	        }
	    });
	}else{
		$.messager.alert('选择','请先选择要还原的内容!','info');
	}
}
function clean(){
	var rows = $("#contentList").datagrid("getSelections");
	rows.length=0;
}

function deleteByIds(){
	var rows = $("#contentList").datagrid("getSelections");
	var rowsId = "";
	for(i = 0; i < rows.length; i++){
		rowsId += rows[i].contentId+",";
	}
	rowsId = rowsId.substring(0, rowsId.length-1);
	if(rows.length > 0){
	    $.messager.confirm("提示", "您确认要删除这"+rows.length+"条内容吗？", function(r){
	        if(r){
	            $.post("${pageContext.request.contextPath}/content/deleteAll.action", {ids: rowsId},
	                    function(data){
	                        if(data.result){
	                            slide(data.message)
	                            rows.length=0;
	                            $('#contentList').datagrid('reload');
	                        }else{
	                        	slide(data.message);
	                        } 
	                    }, "json");
	        }
	    });
	}else{
		$.messager.alert('选择','请先选择要删除的内容!','info');
	}
}
function perdeleteById(id1){
    $.messager.confirm("提示", "您确认永久删除此条内容吗？", function(r){
        if(r){
        	$.post("${pageContext.request.contextPath}/content/perdeleteById.action", {id1: id1},
                    function(data){
                        if(data.result){
                            slide(data.message);
                        }else{
                        	slide(data.message);
                        } 
                        $('#contentList').datagrid('reload');
                        clean();
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
function reset(){
	$("#title").val("");
	$('.easyui-combotree').combotree("clear");
	$('.easyui-datetimebox').datetimebox("clear");
	
}
function back() {
	window.setTimeout("window.location= '${pageContext.request.contextPath}/content/toRecycleContents.action'",500);
}
/**
 * 根据查询条件，查询响应信息
 */
function query(){
	var startTime2 = $('#start2').datetimebox('getValue');
    var endTime2 = $('#end2').datetimebox('getValue');
	    if(startTime2 && endTime2){
			//var d1 = $.fn.datebox.defaults.parser(startTime2);
			//var d2 = $.fn.datebox.defaults.parser(endTime2);
				if(startTime2>endTime2){
					$.messager.alert('警告','结束时间要大于开始时间','warning');
					return;
			}
		}
    var queryParams = $('#contentList').datagrid('options').queryParams;
    queryParams.channelid = $('#parentId').combotree('getValue');
    queryParams.title = $("#title").val();
    queryParams.startTime = startTime2;
    queryParams.endTime = endTime2;
    

    $('#contentList').datagrid('options').queryParams = queryParams;
    $("#contentList").datagrid("load");
    $("#contentList").datagrid("uncheckAll");
}


var varify;//用于查询验证,验证开始时间是否小于结束时间
function query2(pid){
if(varify){
startTime2 = $('#start2').datetimebox('getValue');
endTime2 = $('#end2').datetimebox('getValue');
}else{
$.messager.alert('警告','结束时间要大于开始时间','warning');
}

}
$.fn.datebox.defaults.formatter = function(date){//对于时间格式的转换

var y = date.getFullYear();
var m = fullnum(date.getMonth()+1);
var d = fullnum(date.getDate());
return y+'-'+m+'-'+d;
};
function fullnum(obj){//对于月小于10格式的转换,因为Timestamp转换必须是2013-01-04这种格式
if(Number(obj) < 10){
return '0' + obj;
}else{
return obj;
} }

$.extend($.fn.validatebox.defaults.rules, {//验证开始时间小于结束时间
md: {
validator: function(value, param){
startTime2 = $(param[0]).datetimebox('getValue');
if(!startTime2)
	return true;
var d1 = $.fn.datebox.defaults.parser(startTime2);
var d2 = $.fn.datebox.defaults.parser(value);
varify=d2>d1;
return varify;

},
message: '结束时间要大于开始时间！'
}
}) 
</script>
<title>内容回收站-列表</title>
</head>
<body class="bodyBG">
    <div class="con" id="con">
         <div class="containTit">
            <span class="position">
                <div class="posiCon">维护管理&nbsp;>>&nbsp;列表</div>
            </span>
            <span class="containTitext marB10">维护管理</span>
            </div>
            <div class="indexSearchBox push" style="padding:10px 0;">
             标题：<input class="easyui-validatebox" type="text" id="title" size="15px;" />&nbsp;
                                   所属栏目：<input class="easyui-combotree"	id="parentId"  data-options=" url: ' ${pageContext.request.contextPath}/channel/listChannels.action' " >
                                       删除时间：<input class="easyui-datetimebox" style="width: 140px" id="start2" value="${startTime}" editable="false">
<span class="newfont06">至</span>
<input class="easyui-datetimebox" style="width: 140px" id="end2" value="${endTime}"  editable="false"> 
             <input type="button" class="btnSea" onmouseout="this.className='btnSea'"
							onmouseover="this.className='btnSea1'" onclick="query();" style="vertical-align: bottom;"/>&nbsp;
			 <input type="button" value="重 置" class="btnSearch" onmouseout="this.className='btnSearch'" onmouseover="this.className='btnSearch1'" onclick="reset();" style="vertical-align: bottom;"/>
            </div>
            <div id="tab_zzjs_1">
                <span class="positon">
                    <h3 class="h3Auto"> <a class="tabBbg" href="javascript:void(0);"> <span>维护管理</span> </a> </h3>
                </span>
                <div class="padT23">
                    <table id="contentList"></table>
                </div>
            </div>
    </div>
    
    
</body>
</html>