<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${sysBackTitle}</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/cStyle.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/locale/easyui-lang-zh_CN.js"></script>
<script>
//var auth = ${sysUser.authorityValue};
var auth = 4194303;
var toolbar = new Array();
// 添加内容权限
if((auth & 2) > 0){
	toolbar.push({
        iconCls: 'icon-add',
        text: '添加',
        handler: function(){
        	var rows = $("#hotKeyList").datagrid("getRows");
        	if(rows.length > 3){
        		$.messager.alert('提示','最多只能添加四个关键字！','warning');
        		return;
        	}
        	window.location.href = "${pageContext.request.contextPath}/hotKey/addHotKey.action";
        }
    });
}
$(function() {
	$('#hotKeyList').datagrid({
		height: 350,
		rownumbers: true,
   		selectOnCheck: true,
    	checkOnSelect: true,
		url: "${pageContext.request.contextPath}/hotKey/listHotKey.action",
		queryParams: {},
		pagination: false,//取消分页
		toolbar: toolbar,
		columns: [[
            {field: 'DESCRIPTION', title:'关键字',width:'100'}, 
            {field: 'edit',title:'操作', width:'100',
                formatter: function(value, rowData, index){
                	var html ="";
                   	html += "<a href='javascript: queryById(\""+rowData.ID+"\");' style='margin: 5px; color: blue;'>修改</a>&nbsp;&nbsp;&nbsp;&nbsp;";
                   	html += "<a href='javascript: deleteById(\""+rowData.ID+"\");' style='margin: 5px; color: blue;'>删除</a>";
                    return html; 
                }
            }
		]]
	});
});

/**
 * 根据ID查询详细信息，转到详细页面
 */
function queryById(id){
	window.location.href = "${pageContext.request.contextPath}/hotKey/queryById.action?id="+id;
}

/**
 * 删除单条信息
 */
function deleteById(id){
    $.messager.confirm("提示", "您确认要删除吗？", function(r){
        if(r){
        	$.post("${pageContext.request.contextPath}/hotKey/deleteById.action", {id: id},
                    function(data){
                        if(data.result){
                            slide(data.message);
                        $('#hotKeyList').datagrid('reload');
                        }else{
                        	slide(data.message);
                        $('#hotKeyList').datagrid('reload');
                        }
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

</script>
<title>前台首页管理-列表</title>
</head>
<body class="bodyBG">
    <div class="con" id="con">
            <div class="containTit">
            <span class="position">
                <div class="posiCon">关键字管理&nbsp;>>&nbsp;列表</div>
            </span>
            <span class="containTitext marB10">关键字管理</span>
            </div>
            <div id="tab_zzjs_1">
                <span class="positon">
                    <h3 class="h3Auto"> <a class="tabBbg" href="javascript:void(0);"> <span>关键字管理</span> </a> </h3>
                </span>
                <div class="padT23">
                    <table id="hotKeyList"></table>
                </div>
            </div>
    </div>
</body>
</html>