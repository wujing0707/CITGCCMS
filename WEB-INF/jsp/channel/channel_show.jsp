<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>${sysBackTitle}</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/cStyle.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/ueditor/themes/default/css/ueditor.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/easyui.ext.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/ueditor/ueditor.all.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/ueditor/lang/zh-cn/zh-cn.js"></script>


<script type="text/javascript">
$(function(){
	var hasContent ;
	if(!${empty channel.txt}){
		hasContent = 0;
	}
	
	var parentId = '${empty channel.channel ? '' : channel.channel.channelId}';
	
	var tplChaValue ='${empty channel.tplChannel ? '' : channel.tplChannel}';
	
    if(parentId != ''){
	    $('#parentId').combotree('setValue', parentId);
    }else{
    	$('#parentId').combotree('setValue', 1);
    }    
	if( hasContent == 0){
	    conDisplay('yes');
		$("#content_yes").attr("checked",true);
		$("#content_no").attr("checked",false);
	} else {
		conDisplay('no');
		$("#content_yes").attr("checked",false);
		$("#content_no").attr("checked",true);
	}
	//channel模板列表
	$("#tplCha").combobox({
		width: 130,
	    editable: false,
	    panelHeight: "auto",
	    url: "${pageContext.request.contextPath}/channel/listTpl.action?tpl=channel",
	    valueField: "value",
	    textField: "text",
	    onLoadSuccess: function (data) {
           	if (tplChaValue!=""){

           		 $('#tplCha').combobox('setValue',tplChaValue);
           		 $('#tplCha').combobox('setText',tplChaValue);
           	}
        }
 	});
});
function gotopage(){
	$.messager.alert("操作提示", "显示信息条数不能为空!","warning");
	gotoPage('/channel/listChannelPag.action');
}
	
function submitForm() {
	var content = null;
	var name = $.trim($("#name").val());
	var priority = $.trim($("#priority").val());
	if(name == ''){
		$.messager.alert("操作提示", "栏目名称不能为空!","warning");
		return;
	}
	if(!/^\d{0,2}$/.test(priority)){  
		$.messager.alert("操作提示", "优先级需输入0-2位数字!","warning");
        return;
    }  
	if ($("#content_yes").is(":checked") ){
		hasContent = $("#content_yes").val();
		content = editor.getContent();
	}	else if($("#content_no").is(":checked") ){
		hasContent = $("#content_no").val();
		content=null;
	}
	var flag = true;
	$.each($("input[type='text']"), function(i, elem) {
		if ($(elem).attr("validType") && !$(elem).validatebox("isValid")) {
			flag = false;
			return;
		}
	});
	var  act =  $("#channelId").val() == 0 ? "addChannel.action?" : "updateChannel.action?";
	$("#submitBtn").linkbutton("disable");
	
	$.post("${pageContext.request.contextPath}/channel/" + act + new Date().getTime(), 
		{ name: $("#name").val(),parentId : $('#parentId').combotree('getValue') ,
		priority: $("#priority").val(), hasContent: hasContent,
		tplChannel: $("#tplCha").combobox('getValue'),
		channelId : $("#channelId").val(), contentTxt : content},
		function(data) {
			if (data.result) {
				$.messager.alert("成功", "栏目保存成功！","info", function(r){
					gotoPage('/channel/listChannelPag.action');
				});
			} else {
				$.messager.alert('失败','栏目名称重复!',"error", function(r){});
			}
			$("#submitBtn").linkbutton("enable");
		}, "json");
}
//是否显示内容编辑框
function conDisplay(str){
	if(str == "yes"){
		$("#contentTxt").show();
	} else {
		$("#contentTxt").hide();
	}
}

function gotoPage(path) {
	window.location.href = "${pageContext.request.contextPath}"  + path ;
}


</script>
</head>
<body class="bodyBG">
	<div id="con" class="con">
		<div class="containTit">
			<span class="position">
				<div class="posiCon">
					栏目管理 >>&nbsp;
					<c:if test="${channel.channelId ne 0}">查看</c:if>
				</div>
			</span><span class="containTitext">栏目管理</span>
			<div class="cleardiv"></div>
		</div>
		<div id="tab_zzjs_1">
			<span class="positon">
				<h3 class="h3Auto">
					<a class="tabBbg" href="javascript:void(0);"><span>栏目表单</span>	</a>
				</h3>
			</span>
			<div class="padT23">
				<input type="hidden" id="channelId" value="${channel.channelId}" />
				<div id="center" region="center"
					style="width: 100%; height: auto; background: #fafafa; border: 0px">
					<div style="padding: 0px; overflow: auto;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="table4">
							<tr>
								<th align="right" nowrap="nowrap">上级栏目：</th>
								<td>
								<input disabled="disabled" class="easyui-combotree"	id="parentId"  data-options=" url: ' ${pageContext.request.contextPath}/channel/listChannels.action?channelId=${channel.channelId}' "   ></td>
								<th align="right"><font color="red">*</font>&nbsp;栏目名称：</th>
								<td><input disabled="disabled" type="text" id="name" value="${channel.name}"
									class="easyui-validatebox" data-options="validType:'length[0,50]'"
									required="required" missingMessage="栏目名称不能为空！" /></td>
							</tr>
							<tr>
								<th align="right">优先级：</th>
								<td><input disabled="disabled" type="text" id="priority"
									class="easyui-validatebox"  value="${channel.priority}" /></td>
								<th align="right">是否有内容：</th>
								<td><input disabled="disabled" type="radio" id="content_yes"
									onclick="conDisplay('yes')" name="has_content" value="0"
									 />是 <input disabled="disabled" type="radio" id="content_no"
									onclick="conDisplay('no')" name="has_content" value="1"  checked/>否
							</tr>
							<tr>
									<th align="right">栏目模板：</th>
								<td><select id="tplCha" disabled="disabled"></select></td>
									<th align="right"></th>
								<td></td>
							</tr>
							<tr id="contentTxt">
								<th align="right">内容：</th>
								<td colspan="3"><script id="container" name="content"
										type="text/plain" style="width:900px;height:240px;">${channel.txt}</script>
									<script type="text/javascript">   var editor = UE.getEditor('container'); editor.addListener("ready", function () {
		editor.disable();
		});</script>
								</td>
							</tr>
							<tr>
								<th colspan="4">
									<div style="padding: 10px;"><input
											type="button" value="返回" class="btnSearch"
											onmouseout="this.className='btnSearch'"
											onmouseover="this.className='btnSearch1'"
											onclick="gotoPage('/channel/listChannelPag.action');" />
									</div>
								</th>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>