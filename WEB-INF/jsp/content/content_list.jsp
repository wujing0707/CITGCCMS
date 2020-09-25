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
//var auth = ${sysUser.authorityValue};

var auth = 4194303;
var toolbar = new Array();
// 添加内容权限
if((auth & 2) > 0){
	toolbar.push({
        iconCls: 'icon-add',
        text: '添加',
        handler: function(){window.location.href = "${pageContext.request.contextPath}/content/toAddContent.action?category=1"}
    });
	/*toolbar.push({
        iconCls: 'icon-add',
        text: '添加图片集',
        handler: function(){window.location.href = "${pageContext.request.contextPath}/content/toAddContent.action?category=2"}
    });*/
}
//删除权限
if((auth & 4) > 0){
	if(toolbar.length > 0)
		toolbar.push('-');
 	toolbar.push({
        iconCls: 'icon-remove',
        text: '删除',
        handler: function(){deleteByIds();}
    }); 
}
/**if((auth & 64) > 0){
	toolbar.push({
        iconCls: 'icon-ok',
        text: '发布',
        handler: function(){releaseContents();}
    });
}*/
$(function() {
	$('#orderProperty').next(".combo").hide(); 
	$('#isAsc').next(".combo").hide(); 
	$('#contentList').datagrid({
		height: 350,
		rownumbers: true,
		singleSelect: false,
		idField:'contentId',
		striped: true,
		//checkOnSelect: false,
		url: "${pageContext.request.contextPath}/content/listContents.action",
		queryParams: {},
   		selectOnCheck: true,
    	checkOnSelect: true,
		pagination: true,
		toolbar: toolbar/* [{
	        iconCls: 'icon-add',
	        text: '添加普通内容',
	        handler: function(){window.location.href = "${pageContext.request.contextPath}/content/toAddContent.action?category=1"}
	    },{
	        iconCls: 'icon-add',
	        text: '添加图片集',
	        handler: function(){window.location.href = "${pageContext.request.contextPath}/content/toAddContent.action?category=2"}
	    },'-',{
            iconCls: 'icon-delete',
            text: '删除选中行',
            handler: function(){deleteByIds();}
        }] */,
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
        //    {field: 'contentTypeName',title:'类型', width: 35},
         //   {field: 'creatorName',title:'内容上报人员',hidden: true},
            {field: 'releaseTime',title:'编辑时间', width:$(this).width() * 0.18},
            {field: 'createTime',title:'创建时间', width:$(this).width() * 0.18,hidden:true},
            {field: 'statusDesc',title:'状态', width:$(this).width() * 0.1,hidden:true},
            {field: 'audit',title:'审核状态', width:$(this).width() * 0.1,formatter: function(value, rowData, index){
            	var html ="";
            	if (rowData.audit=='3')
                {
                    html += "审核不通过";
               	}
            	else if (rowData.audit=='1' || rowData.audit=='2')
                {
                    html += "审核通过";
               	}
            	else
            	{
            		html += "未审核";
            	}
            	return html;
            	
            }},
            {field: 'edit',title:'操作', width:$(this).width() * 0.21,
                formatter: function(value, rowData, index){
                	var html ="";
                	if (rowData.audit!='0')
                    {
	                	if((auth & 8) > 0)  // 是否有修改权限
	                	    var path = "${pageContext.request.contextPath}/content/queryById.action?id="+rowData.contentId;
	                    	html += "<a href='" +path+ "' style='margin: 5px; color: blue;'>修改</a>";
	                    if((auth & 4) > 0)  // 当前用户是否有删除权限
	                    	html += "<a href='javascript: deleteById(\""+rowData.contentId+"\");' style='margin: 5px; color: blue;'>删除</a>";
                    }
                    	
                    if(rowData.status == '0' && rowData.approvable && (auth & 16) > 0)  // 是否有审核权限
                    	html += "<a href='javascript: queryById(\""+rowData.contentId+"\",\"approve\");' style='margin: 5px; color: blue;'>审核</a>";
                    /* if(rowData.status == '2' && rowData.creatorId == $('#creatorId').val())   // 被拒绝的，创建人有权修改
                    	html += "<a href='javascript: queryById(\""+rowData.contentId+"\");' style='margin: 5px; color: red;'>修改</a>"; */
                	if (rowData.audit=='2')
                    {
	                    if(rowData.isTop==1)	
	                    	html += "<a href='javascript: removeTop(\""+rowData.contentId+"\");' style='margin: 5px; color: blue;'>取消置顶</a>";
	                    else
	                    	html += "<a href='javascript: putTop(\""+rowData.contentId+"\");' style='margin: 5px; color: blue;'>置顶</a>";
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
 * 根据ID查询详细信息，转到详细页面
 */
function queryById(id, p){
	if(p != undefined){
		window.location.href = "${pageContext.request.contextPath}/content/queryById.action?id="+id+"&isApprove=1";
	}else{
		window.location.href = id;
	}
}
/**
 * 置顶
 */
function putTop(id){
	$.post("putTop.action", {id: id},
            function(data){
                if(data.result){
                    slide(data.message);
                }else{
                	slide(data.message);
                }
               $('#contentList').datagrid('reload');
            }, "json");
}
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
/**
 * 取消置顶
 */
function removeTop(id){
	$.post("removeTop.action", {id: id},
            function(data){
                if(data.result){
                    slide(data.message);
                }else{
                	slide(data.message);
                }
                $('#contentList').datagrid('reload');
     		}, "json");
}

/**
 * 删除单条信息
 */
function deleteById(id){
    $.messager.confirm("提示", "您确认要删除此条内容吗？", function(r){
        if(r){
        	$.post("${pageContext.request.contextPath}/content/deleteById.action", {id: id},
                    function(data){
                        if(data.result){
                            slide(data.message);
                            $('#contentList').datagrid('reload');
                        }else{
                        	slide(data.message);
                        }clean();
                    }, "json");
        }
    });
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
	            $.post("${pageContext.request.contextPath}/content/deleteByIds.action", {ids: rowsId},
	                    function(data){
	                        if(data.result){
	                            slide(data.message)
	                            $('#contentList').datagrid('reload');
	                            rows.length=0;
	                        }else{
	                        	slide(data.message);
	                        }clean();
	                    }, "json");
	        }
	    });
	}else{
		$.messager.alert('选择','请先选择要删除的内容!','info');
	}
}

function releaseContents(){
	var rows = $("#contentList").datagrid("getChecked");
    var rowsId = "";
    for(i = 0; i < rows.length; i++){
    	if(rows[i].status != '3'){
    		$.messager.alert('提示信息','只允许发布“待发布”内容,请重新选择！','info');
    		return;
    	}
        rowsId += rows[i].contentId+",";
    }
    rowsId = rowsId.substring(0, rowsId.length-1);
    if(rows.length > 0){
        $.messager.confirm("提示", "您确认要发布这"+rows.length+"条内容吗？", function(r){
            if(r){
                $.post("${pageContext.request.contextPath}/content/releaseContents.action", {ids: rowsId},
                        function(data){
                            if(data.result){
                                slide(data.message)
                                query();
                            }else{
                            	slide(data.message);
                            }
                        }, "json");
            }
        });
    }else{
		$.messager.alert('选择','请先选择要发布的内容!','info');
	}
}

function queryWHByContentId(contentId){
	window.open('${pageContext.request.contextPath}/content/queryWHByContentId.action?contentId='+contentId,
			'newwindow','height=300,width=600,top='+(window.screen.availHeight-30-300)/2+
			',left='+(window.screen.availWidth-10-600)/2+
			',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
}

function toApproveContent(contentId){
	window.open('${pageContext.request.contextPath}/content/toApproveContent.action?contentId='+contentId,
            'newwindow','height=500,width=650,top='+(window.screen.availHeight-30-500)/2+
            ',left='+(window.screen.availWidth-10-650)/2+
            ',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
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
    queryParams.title=$("#title").val();
    queryParams.audit = $("#audit").combobox('getValue');
    queryParams.channelid = $('#parentId').combotree('getValue');
    queryParams.startTime = startTime2;
    queryParams.endTime = endTime2;
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
/**function queryOfPreview(contentId, category){
	$.post("count.action",{'contentId':contentId},function(data){
		var data=eval('('+data+')');
		if(data.result){
			if(data.message==1){
			window.open("${pageContext.request.contextPath}/html1/condetail"+contentId+".html",
		            'newwindow','height=900,width=1000,top='+(window.screen.availHeight-30-900)/2+
		            ',left='+(window.screen.availWidth-10-1000)/2+
		            ',toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no');
			}else{
				window.open("${pageContext.request.contextPath}/html2/condetail"+contentId+".html",
			            'newwindow','height=900,width=1000,top='+(window.screen.availHeight-30-900)/2+
			            ',left='+(window.screen.availWidth-10-1000)/2+
			            ',toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no');
			}
		}else{
			$.messager.alert('提示','正在发布请稍后再试！','info');
		}
	});
}*/

function reset() {
	$('.easyui-combotree').combotree("clear");
	$('.easyui-datetimebox').datetimebox("clear");
	$("#title").val("");
	$("#creator").val("");
	$("#contentType").combobox("setValue", "");
	$("#status").combobox("setValue", "");
	$("#orderProperty").combobox("setValue", "releaseTime");
	$("#isAsc").combobox("setValue", "desc");
	$('.easyui-combobox').combobox("clear");
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
return d2>d1;

},
message: '结束时间要大于开始时间！'
}
}) 

function comptime(beginTime,endTime) {
    var beginTimes = beginTime.substring(0, 10).split('-');
    var endTimes = endTime.substring(0, 10).split('-');

    beginTime = beginTimes[1] + '-' + beginTimes[2] + '-' + beginTimes[0] + ' ' + beginTime.substring(10, 19);
    endTime = endTimes[1] + '-' + endTimes[2] + '-' + endTimes[0] + ' ' + endTime.substring(10, 19);
    var a = (Date.parse(endTime) - Date.parse(beginTime)) / 3600 / 1000;
    if (a < 0) {
        alert("endTime小!");
    } else if (a > 0) {
        alert("endTime大!");
    } else if (a == 0) {
        alert("时间相等!");
    } else {
        return 'exception'
    }
}
</script>
<title>内容管理-列表</title>
</head>
<body class="bodyBG">
    <div class="con" id="con">
            <div class="containTit">
            <span class="position">
                <div class="posiCon">内容管理&nbsp;>>&nbsp;列表</div>
            </span>
            <span class="containTitext marB10">内容管理</span>
            </div>
            <div class="indexSearchBox push" style="padding:10px 0;">
            栏目名称：<input class="easyui-combotree"	id="parentId"  data-options=" url: ' ${pageContext.request.contextPath}/channel/listChannels.action' " >
               <input type="hidden" id="creatorId" value="${userId }" />
			        标题：
			    <input class="easyui-validatebox" type="text" id="title" size="15px;" 
			        data-options="required:false" />&nbsp;
			审核状态：<select id="audit" class="easyui-combobox" data-options="editable:false,panelHeight:'auto',width:90">
			       		<option value="" selected="selected">--请选择--</option>
			       		<option value="4">审核通过</option>
			       		<option  value="3">审核不通过</option>
			       		<option value="0">未审核</option>
			        </select>&nbsp;
			        </select>&nbsp;
			        编辑时间：<input class="easyui-datetimebox" style="width: 140px" id="start2" value="${startTime}" editable="false">
<span class="newfont06">至</span>
<input class="easyui-datetimebox" style="width: 140px" id="end2" value="" editable="false"> &nbsp;
			    <input type="button" 
							class="btnSea" onmouseout="this.className='btnSea'"
							onmouseover="this.className='btnSea1'" onclick="query();" style="vertical-align: bottom;"/>&nbsp;
				<input type="button" value="重 置" class="btnSearch" onmouseout="this.className='btnSearch'" onmouseover="this.className='btnSearch1'" onclick="reset();" style="vertical-align: bottom;"/>
		    </div>
		    
            <div id="tab_zzjs_1">
                <span class="positon">
                    <h3 class="h3Auto"> <a class="tabBbg" href="javascript:void(0);"> <span>内容管理</span> </a> </h3>
                </span>
                <div class="padT23">
                    <table id="contentList"></table>
                </div>
            </div>
    </div>
</body>
</html>