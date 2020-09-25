<%@ page language="java" import="java.util.*,java.io.File" pageEncoding="UTF-8"%>
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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/cStyle.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-migrate-1.1.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/ajaxfileupload.js"></script>
<title>${sysBackTitle}</title>
<script type="text/javascript">
var path = decodeURIComponent(decodeURIComponent("${path}"));

$(function() {
	$("#path").html(path.substr(path.indexOf("<%=File.separator.equals("\\") ? "\\\\" : "/"%>t<%=File.separator.equals("\\") ? "\\\\" : "/"%>"), path.length));
	
	$("#templateList").datagrid({
		height : 420,
		nowrap : false,
		striped : true,
		collapsible : false,
		fitColumns : true,
		url : "${pageContext.request.contextPath}/template/listTemplates.action?path=${path}&date=" + new Date().getTime(),
		toolbar : [{
			text : "删除",
			iconCls : "icon-remove",
			handler : function() {
				var checkItems = $('#templateList').datagrid('getChecked');
				var fileNames = "";
				$.each(checkItems, function (index, item) {
					fileNames += (item.realPath + ",");
				});
				fileNames = fileNames.substring(0, fileNames.length - 1);
				removeFile(fileNames);
			}
		}],
		remoteSort : false,
		loadMsg : "载入中...请等待.",
		idField : "realPath",
		columns : [[
			{field : "ck", checkbox : true, width : 20},
			{field : "isDirectory", title : "是否为文件夹", width : 50, align : "center",
				formatter : function(value, row) {
					if (value)
						return "是";
					return "否";
				}
			},
			{field : "name", title : "文件（夹）名", width : 120},
			{field : "updateTime", title : "最新修改时间", width : 90},
			{field : "realPath", title : "操作", width : 120, align : "center",
				formatter : function(value, row) {
					var str = "<span style='color:blue' onclick=\"javascript:templateDetails('"
							+ row.name
							+ "')\">修改</span>&nbsp;&nbsp;";
					return str;
				}
			}]],
		rownumbers : true
	});
});

function query() {
	$("#templateList").datagrid("reload");
}
function toAdd() {
	window.location.href = "${pageContext.request.contextPath}/maintain/dictionary/dictionaryDetails.action";
}

function removeFile(fileNames) {
	if (confirm("确认删除文件或文件夹？")) {
		$.post("${pageContext.request.contextPath}/template/removeFile.action?date=" + new Date().getTime(),
			{fileNames: fileNames},
			function(data) {
				if (data.result) {
					alert("删除成功！");
					query();
				} else {
					alert("删除失败！");
				}
				window.parent.freshTree();
			}, "json");
	}
}

function makeDirectory() {
	var dir = $.trim($("#directory").val());
	if (dir == "") {
		$("#directory").val("");
		alert("请输入目录名!");
	}
	var dirPath = path + '<%=File.separator.equals("\\") ? "\\\\" : "/"%>' + dir;
	$.post("${pageContext.request.contextPath}/template/makeDirectory.action?date=" + new Date().getTime(), 
		{dirPath : dirPath},
		function(data) {
			window.parent.freshTree();
			query();
		}, "json");
}

function ajaxFileUpload() {
	var file = $("#file").val();
	if (file.lastIndexOf(".ftl") != (file.length - 4)) {
		alert("只支持ftl文件上传！");
		return;
	}
	
	$("#submit").attr("disabled", "disabled");
    $.ajaxFileUpload({  
        url : "${pageContext.request.contextPath}/template/uploadTemplate.action?" + new Date().getTime(), 
        secureuri : false,  
        fileElementId : "file", // 文件选择框的id属性   
        data: {path: path},
        dataType : "json", 
        success : function(data, status) {
        	$("#submit").removeAttr("disabled");
        	query();
        	$("#file").val("");
        	alert("上传成功!");
        },  
        error : function(data, status, e) {
        	$("#submit").removeAttr("disabled");
            alert("上传失败!");  
        }  
    });  
}

function templateDetails(fileName) {
	window.location.href = "${pageContext.request.contextPath}/template/templateDetails.action?path=" 
			+ encodeURIComponent(encodeURIComponent(path + '<%=File.separator.equals("\\") ? "\\\\" : "/"%>' + fileName));
}
</script>
</head>
<body>
	<div class="con" id="con">
    	<div class="indexSearchBox push" style="padding:10px;">
			<div>
				当前目录：<span id="path"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				新建目录：<input type="text" id="directory"/>&nbsp;
				<input style="vertical-align:bottom" type="button" value="新建" class="btnSearch" onmouseout="this.className='btnSearch'" onmouseover="this.className='btnSearch1'" onclick="makeDirectory();"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input id="file" type="file" name="file" style="vertical-align:bottom"/>&nbsp;
				<input id="upload" type="button" value="点击上传文件" onclick="return ajaxFileUpload();" class="btnSearch" style="vertical-align:bottom"/>&nbsp;
				<font color="red">（支持ftl文件上传）</font>
			</div>
		</div>
		<div class="cleardiv"></div>
		<div id="tab_zzjs_1">
        	<div class="padT23">
				<table id="templateList"></table>
			</div>
		</div>
	</div>
</body>
</html>

