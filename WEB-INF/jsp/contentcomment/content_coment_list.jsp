<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${sysBackTitle}</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/ueditor/themes/default/css/ueditor.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/cStyle.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/ztree/zTreeStyle/zTreeStyle.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/ueditor/ueditor.all.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/ueditor/ue.image.upload.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/ztree/jquery.ztree.core-3.5.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/ztree/jquery.ztree.excheck-3.5.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/json2.js"></script>
<script type="text/javascript">
$(function(){
	$('#win').window({
        title: '评论内容',
        width: 500,
        height: 300,
        modal:true,
        collapsible: false,
        minimizable: false,
        maximizable: false
    });
	$('#win').window("close");
	initDataGrid();
});
function initDataGrid(){
	$('#dataGrid').datagrid({
		title: '内容评论列表',
        height: 400,
        rownumbers: true,
        singleSelect: false,
        checkOnSelect: false,
        url: "${pageContext.request.contextPath}/contentcomment/findAll.action",
        queryParams: {},
        pagination: true,
        toolbar: [{
        	iconCls: 'icon-cancel',
	        text: '隐藏选中',
	        handler: function(){ hiddenByIds(); }
        },{
            iconCls: 'icon-ok',
            text: '显示选中',
            handler: function(){ showByIds(); }
        }],
        columns: [[
            {field: 'ck', checkbox: true},
            {field: 'contentCommentId', title:'ID'},
            {field: 'contentComment_1',title:'评论内容', width: 500, formatter: function(value, rowData, index){
            	var comment = rowData.contentComment_1.length > 40 ? rowData.contentComment_1.substr(0, 40)+"..." : rowData.contentComment_1;
            	return "<a href='javascript: findById(\""+rowData.contentCommentId+"\");'>"+comment+"</a>";
            }},
            {field: 'createTime',title:'评论时间'},
            {field: 'username',title:'评论用户名'},
            {field: 'ip',title:'IP地址'},
            {field: 'isDisplay',title:'是否显示', align: 'center', formatter: function(value, rowData, index){
            	return rowData.isDisplay == 0 ? "是" : "否";
            }},
            {field: 'edit',title:'操作', width: 300, align: 'center',
                formatter: function(value, rowData, index){
                	var html = "";
                    if(rowData.isDisplay == 0)
                        html += "<a href='javascript: hiddenByIds(\""+rowData.contentCommentId+"\");' style='margin: 5px; color: blue;'>隐藏评论</a>";
                    else if(rowData.isDisplay == 1)
                        html += "<a href='javascript: showByIds(\""+rowData.contentCommentId+"\");' style='margin: 5px; color: blue;'>显示评论</a>";
                    return html; 
                }
            }
        ]]
    });
}

function findById(id){
	$.post("${pageContext.request.contextPath}/contentcomment/findById.action",{id: id},function(data){
		$("#win_p").html(data.contentComment_1);
		$("#win").window("open");
	},"json");
}

function hiddenByIds(id){
	var rows = $("#dataGrid").datagrid("getChecked");
    var rowsId = "";
    for(i = 0; i < rows.length; i++){
        rowsId += rows[i].contentCommentId+",";
    }
    rowsId = rowsId.substring(0, rowsId.length-1);
    if(rows.length > 0){
        $.messager.confirm("提示", "您确认要隐藏这"+rows.length+"条内容吗？", function(r){
            if(r){
                $.post("${pageContext.request.contextPath}/contentcomment/hiddenByIds.action", {ids: rowsId},
                        function(data){
                            if(data.result){
                                slide(data.message)
                                query();
                            }else{
                                alert(data.message);
                            }
                        }, "json");
            }
        });
    }else if(id != "" && id != undefined){
    	$.messager.confirm("提示", "您确认要隐藏该条内容吗？", function(r){
            if(r){
                $.post("${pageContext.request.contextPath}/contentcomment/hiddenByIds.action", {ids: id},
                        function(data){
                            if(data.result){
                                slide(data.message)
                                query();
                            }else{
                                alert(data.message);
                            }
                        }, "json");
            }
        });
    }
}

function showByIds(id){
	var rows = $("#dataGrid").datagrid("getChecked");
    var rowsId = "";
    for(i = 0; i < rows.length; i++){
        rowsId += rows[i].contentCommentId+",";
    }
    rowsId = rowsId.substring(0, rowsId.length-1);
    if(rows.length > 0){
        $.messager.confirm("提示", "您确认要显示这"+rows.length+"条内容吗？", function(r){
            if(r){
                $.post("${pageContext.request.contextPath}/contentcomment/showByIds.action", {ids: rowsId},
                        function(data){
                            if(data.result){
                                slide(data.message)
                                query();
                            }else{
                                alert(data.message);
                            }
                        }, "json");
            }
        });
    }else if(id != "" && id != undefined){
        $.messager.confirm("提示", "您确认要显示该条内容吗？", function(r){
            if(r){
                $.post("${pageContext.request.contextPath}/contentcomment/showByIds.action", {ids: id},
                        function(data){
                            if(data.result){
                                slide(data.message)
                                query();
                            }else{
                                alert(data.message);
                            }
                        }, "json");
            }
        });
    }
}

function query(){
    var queryParams = $('#dataGrid').datagrid('options').queryParams;
    
    queryParams.comment = $("#comment").val();
    queryParams.ip = $("#ip").val();
    queryParams.isDisplay = $("#isDisplay").combobox("getValue");
    queryParams.beginTime = $("#beginTime").datetimebox("getValue");
    queryParams.endTime = $("#endTime").datetimebox("getValue");
    
    if(queryParams.beginTime != "" && queryParams.endTime != ""){
	    var bt = new Date(Date.parse(queryParams.beginTime.replace(/-/g, "/")));
	    var et = new Date(Date.parse(queryParams.endTime.replace(/-/g, "/")));
	    if(bt > et){
	    	alert("开始时间不能大于结束时间");
	    	return;
	    }
    }
    $('#dataGrid').datagrid('options').queryParams = queryParams;
    $("#dataGrid").datagrid("reload");
}

function reset() {
    $("#comment").val("");
    $("#ip").val("");
    $("#isDisplay").combobox("setValue", "");
    $("#beginTime").datetimebox('setValue', "");
    $("#endTime").datetimebox('setValue', "");
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
</script>
</head>
<body>
<div class="con" id="con">
    <div class="containTit">
    <span class="position">
        <div class="posiCon">评论管理&nbsp;>>&nbsp;列表</div>
    </span>
    <span class="containTitext marB10">评论管理</span>
    </div>
    <div class="indexSearchBox push" style="padding:10px 0;">
             评论内容：
        <input class="easyui-validatebox" type="text" id="comment" size="15px;"
            data-options="required:false" />&nbsp;
      IP地址：
        <input class="easyui-validatebox" type="text" id="ip" size="15px;"
            data-options="required:false" />&nbsp;
            状态：
        <select id="isDisplay" class="easyui-combobox" data-options="editable:false,panelHeight:'auto',width:80">
            <option value="">全部状态</option>
            <option value="0">显示</option>
            <option value="1">隐藏</option>
        </select>
            开始时间：
        <input class="easyui-datetimebox" type="text" id="beginTime" size="15px;"
            data-options="required:false,editable: false, width: 150" />&nbsp;
            结束时间：
        <input class="easyui-datetimebox" type="text" id="endTime" size="15px;"
            data-options="required:false,editable: false, width: 150" />&nbsp;
            
        <input type="button" 
                    class="btnSea" onmouseout="this.className='btnSea'"
                    onmouseover="this.className='btnSea1'" onclick="query();" style="vertical-align: bottom;"/>&nbsp;
        <input type="button" value="重 置" class="btnSearch" onmouseout="this.className='btnSearch'" onmouseover="this.className='btnSearch1'" onclick="reset();" style="vertical-align: bottom;"/>
    </div>
    
    <div id="tab_zzjs_1">
        <span class="positon">
            <h3 class="h3Auto"> <a class="tabBbg" href="javascript:void(0);"> <span>评论管理</span> </a> </h3>
        </span>
        <div class="padT23">
			<table id="dataGrid"></table>
        </div>
    </div>
</div>
<div id="win">
    <p id="win_p" style="padding: 25px;"></p>
</div>
</body>
</html>