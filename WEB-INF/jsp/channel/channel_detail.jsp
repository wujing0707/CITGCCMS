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
	
	if( hasContent == 0){
	    conDisplay('yes');
		$("#content_yes").attr("checked",true);
		$("#content_no").attr("checked",false);
	} else {
		conDisplay('no');
		$("#content_yes").attr("checked",false);
		$("#content_no").attr("checked",true);
	}
 	ttt();
});
function ttt(){
	if($("#channelId").val() == 0){
 		$("#wu").attr("checked",true);
 		$("#yes").attr("checked",true);
 		$("#nolock").attr("checked",true);
	 	$('#parentId').combotree({
			//选择树节点触发事件  
		    onSelect : function(node) {  
		        //返回树对象  
		        var tree = $(this).tree;  
		        //选中的节点是否为叶子节点,如果不是叶子节点,清除选中  
		        $.post("isExcess.action",{channelId:node.id},function(data){
		    		var data = eval('(' + data + ')');  // change the JSON string to javascript object
		    		if(!data.result){
		    			 //清除选中  
			            $('#parentId').combotree('clear');  
		    			$.messager.alert("操作提示", "该级栏目下不能添加栏目!","warning");
		    		}
		        });
		    }  
		});
 	}
}
function gotopage(){
	$.messager.alert("操作提示", "显示信息条数不能为空!","warning");
	gotoPage('/channel/listChannelPag.action');
}
function getHtmlInfo(s){
	s = s.replace(/&amp;/g, "&");  
    s = s.replace(/&nbsp;/g, " ");  
    s = s.replace(/&#39;/g, "'");          
    s = s.replace(/&lt;/g, "<");  
    s = s.replace(/&gt;/g, ">");  
    s = s.replace(/"<br>"/g, "\n");  
    s = s.replace(/"?D"/g, "—");  
    return s;  
}	
function submitForm() {
	var content = null;
	var keywords = $.trim($("#keyword").val());
	var description = $.trim($("#description").val());
	var name = $.trim($("#name").val());
	var priority = $.trim($("#priority").val());
	if(name == ''){
		$.messager.alert("操作提示", "栏目名称不能为空!","warning");
		return;
	}	
	if(keywords.length>50){
		$.messager.alert("操作提示", "关键字长度不能超过50个字符!","warning");
		return;
	}
	if(description.length>50){
		$.messager.alert("操作提示", "描述长度不能超过50个字符!","warning");
		return;
	}
	if(name.length>50){
		$.messager.alert("操作提示", "栏目名称长度不能超过50个字符!","warning");
		return;
	}
	if($('#parentId').combotree('getValue')==''||$('#parentId').combotree('getValue')==null){
		$.messager.alert("操作提示", "上级栏目不能为空!","warning");
		return;
	}
    if(true){
    	var str = null;
    	    str = name.replace(/<\/?[^>]*>/g,''); //去除HTML tag
    	if(str!=name){
    	    $.messager.alert("操作提示", "栏目名称含有非法字符!","warning");
			return;
    	}
    }
    name = name.replace(/[ | ]*\n/g,'\n'); //去除行尾空白
    name = name.replace(/\n[\s| | ]*\r/g,'\n'); //去除多余空行
    name=  name.replace(/&nbsp;/ig,'');//去掉&nbsp;
    name=  name.replace(/'/g,'');
    name=  name.replace(/"/ig,'');
    if(name.length==0){
    	    $.messager.alert("操作提示", "栏目名称无效!","warning");
			return;
    }
	if(!/^\d{0,2}$/.test(priority)){  
		$.messager.alert("操作提示", "优先级需输入0-2位数字!","warning");
        return;
    }  
	if ($("#content_yes").is(":checked") ){
		hasContent = $("#content_yes").val();
		content = editor.getContent();
		if(content==""){
			$.messager.alert("操作提示", "内容不能为空!","warning");
			return;
		}
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
	var  act =  $("#channelId").val() == 0 ? "addChannel.action?date=" : "updateChannel.action?date=";
	$("#submitBtn").linkbutton("disable");
	
	$.post("${pageContext.request.contextPath}/channel/" + act + new Date().getTime(), 
		{ name: name,parentId : $('#parentId').combotree('getValue') ,
		priority: $("#priority").val(), hasContent: hasContent,isDisplay:$('input:radio:checked').val(),islock:$('input[name="lock"]:checked').val(),
		hasimage:$('input[name="hasimg"]:checked').val(),channelId : $("#channelId").val(), contentTxt : content,keyword:keywords,description:description},
		function(data) {
			if (data.result) {
				$.messager.alert("成功", "栏目保存成功！","info", function(r){
					gotoPage('/channel/listChannelPag.action');
				});
			} else {
				if(act=="updateChannel.action?")
				$.messager.alert('失败','顶级栏目下的栏目数量超出范围!',"error", function(r){});
				else
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
function reset(){
	$('.easyui-combotree').combotree("clear");
	$("#name").val("");
	$("#priority").val("");
}

</script>
</head>
<body class="bodyBG">
	<div id="con" class="con">
		<div class="containTit">
			<span class="position">
				<div class="posiCon">
					栏目管理 >>&nbsp;
					<c:if test="${channel.channelId eq 0}">添加</c:if>
					<c:if test="${channel.channelId ne 0}">修改</c:if>
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
								<th align="right" nowrap="nowrap"><font color="red">*</font>上级栏目：</th>
								<td>
									<input class="easyui-combotree"	id="parentId" data-options=" url: ' ${pageContext.request.contextPath}/channel/listChannels.action',value : '${empty channel.channel ? '' : channel.channel.channelId}' "   ></td>
								<th align="right"><font color="red">*</font>&nbsp;栏目名称：</th>
								<td><input type="text" id="name" value="${channel.name}"
									class="easyui-validatebox" data-options="validType:'length[0,50]'"
									required="required" missingMessage="栏目名称不能为空！" /></td>
							</tr>
							<tr>
								<th align="right">优先级：</th>
								<td><input type="text" id="priority" class="easyui-validatebox"  value="${channel.priority}" /></td>
								<th align="right" style="display: none">是否在前台首页显示：</th>
								<td style="display: none"><input type="radio" id="yes" onclick="" name="isdisplay" ${channel.isDisplay==0?'checked':''} value="0"/>是 
								<input type="radio" id="no"	onclick="" name="isdisplay" ${channel.isDisplay==1?'checked':''} value="1" />否</td>
								<th align="right">关键字：</th>
								<td><input type="text" id="keyword" class="easyui-validatebox" maxlength="50"  value="${channel.keywords}" /></td>
								<th style="display: none" align="right">是否是图片栏目：</th>
								<td style="display: none">
									<input type="radio" id="you" onclick="" ${channel.channelId gt 0?'disabled':''} name="hasimg" ${channel.hasImage==0?'checked':''} value="0"/>是 
									<input type="radio" id="wu"	onclick="" ${channel.channelId gt 0?'disabled':''} name="hasimg" ${channel.hasImage==1?'checked':''} value="1" />否
								</td>
								<th align="right" style="display: none">是否有内容：</th>
								<td style="display: none"><input type="radio" id="content_yes" 
									onclick="conDisplay('yes')" name="has_content" value="0"
									 />是 <input type="radio" id="content_no"
									onclick="conDisplay('no')" name="has_content" value="1"  checked/>否</td>
							</tr>
							<tr>
								<th align="right">描述：</th>
								<td><input type="text" id="description" class="easyui-validatebox"  maxlength="50" value="${channel.description}" /></td>
								<th align="right">是否锁定：</th>
								<td>
									是<input type="radio" id="lock" ${channel.isLock==0?'checked':''} name="lock" value="0"/>
									否<input type="radio" id="nolock" ${channel.isLock==1?'checked':''}  name="lock" value="1"/>
								</td>
							</tr>
							<tr>
								<th colspan="4">
									<div style="padding: 10px;">
										<input type="button" value="提交" class="btnSearch"
											onmouseout="this.className='btnSearch'"
											onmouseover="this.className='btnSearch1'"
											onclick="submitForm();" />&nbsp;&nbsp;<input
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