<%@ page language="java" import="java.util.*,com.wa.cms.Constant" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-migrate-1.1.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/ajaxfileupload.js"></script>
<title>${sysBackTitle}</title>
</head>
<script type="text/javascript">
var advertisementId = ${advertisement.advertisementId};
$("#pictureImage1").hide();
$(function() {
	$.post("${pageContext.request.contextPath}/maintain/dictionary/listDictionary.action", {type: "<%=Constant.DIC_TYPE_ADV_POSITION%>"},
		function(data) {
			for (var i = 0; i < data.rows.length; i++) {
				var sel = (data.rows[i].value == "${advertisement.position}" ? " selected" : "");
				$("#position").append("<option value='" + data.rows[i].value + "'" + sel + ">" + data.rows[i].name + "</option>");
			}
		},
	"json");
});

function onSubmit() {
	$("#siteName").val($.trim($("#siteName").val()));
	if (!$("#siteName").validatebox("isValid")) {
		return;
	}
	if (advertisementId == 0) {
		$("#submit").val("添加");
	} else {
		$("#submit").val("修改");
	}
	$("#submit").attr("disabled","disabled");
	var act = advertisementId == 0 ? "add" : "update";
	$.post("${pageContext.request.contextPath}/assist/advertisement/" + act + "Advertisement.action", 
		{siteName: $.trim($("#siteName").val()), 
		domain: $.trim($("#domain").val()), 
		description: $.trim($("#description").val()),
		priority: $.trim($("#priority").val()), 
		viewTimes: $.trim($("#viewTimes").val()),
		logo: $.trim($("#pictureImage").val()),
		position: $.trim($("#position").val()),
		advertisementId : advertisementId},	        	  
		function(data) {
			$("#submit").removeAttr("disabled");
			if (data.result == true) {
				message = "成功！";	
				alert($("#submit").val() + message);
				back();
			} else {
				message = "失败！";	
				alert($("#submit").val() + message);
			}
		},
	"json");
}

function back() {
	window.location.href = "${pageContext.request.contextPath }/assist/advertisement/advertisementList.action";
}   

function ajaxFileUpload() { 
    $.ajaxFileUpload({  
        url : '${pageContext.request.contextPath }/assist/advertisement/uploadAjax.action?method=uploadAjax', 
        secureuri : false,  
        fileElementId : 'file', // 文件选择框的id属性   
        dataType : 'json',    
        success : function(data, status) {       
        	alert("上传成功: " + data.path);   
          	$("#pictureImage1")[0].src = data.path;  
           	$("#pictureImage").val(data.path); 
           	$("#pictureImage1").show();
        },  
        error : function(data, status, e) {  
            alert("上传失败");  
        }  
    });  
}  
</script>
<body class="bodyBG">
    <div id="con" class="con" >
    	<div class="containTit">
    		<span class="position">
		    	<div class="posiCon">广告管理>>&nbsp;<c:if test="${advertisement.advertisementId <= 0}">添加</c:if><c:if test="${advertisement.advertisementId > 0}">修改</c:if></div>
		    </span><span class="containTitext">广告管理</span>
		    <div class="cleardiv"></div>
	  	</div>
    	<div id="tab_zzjs_1"> 
    		<span class="positon">
		    	<h3 class="h3Auto"><a href="javascript:void(0);" class="tabBbg"> <span>广告表单</span> </a></h3>
		    </span>
	        <div class="padT23">   
	        	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table4">
		        	<tr>
		        		<th align="right"><font color="red">*</font>&nbsp;名称：</th><td><input class="easyui-validatebox" type="text" name="siteName" id="siteName" missingMessage="名称不能为空！" data-options="required:true" value="${advertisement.siteName}" maxlength="23"></input></td>
		        		<th align="right">&nbsp;域名：</th><td><input class="easyui-validatebox" type="text" name="domain" id="domain" value="${advertisement.domain}" maxlength="245"></input>
		        			<input type="hidden" value="${advertisement.advertisementId}" id="advertisementId" name="advertisementId"></input>
		        		</td>
		        	</tr>
		        	<tr>
		        		<th align="right">&nbsp;描述：</th>
		        		<td>
			        		<textarea  cols="35" rows="4" name="description" id="description" maxlength="160">${advertisement.description}</textarea>
		        		</td>
		        		<th align="right">&nbsp;顺序：</th>
		        		<td> <input class="easyui-numberbox" type="text" name="priority" id="priority" value="${advertisement.priority}" maxlength="4"></input>注：只能输入数字</td>
		        	</tr>		        		
		        	<tr>
		        		<th align="right">LOGO图片上传：</th>
		        		<td colspan="3">        			        				
		        			<div class="std_photo">                                 
							    <img id="pictureImage1" name="logo"  src="${advertisement.logo}"   height="150" width="100" />
							    <input type="hidden" id="pictureImage"  name="pictureImage" value="${advertisement.logo}"> 	  
							    <input id="file" type="file" name="file" /><input type="button" value="点击上传" onclick="return ajaxFileUpload();"  class="btnSearch" />   					                
							</div>
						</td>        		
		        	</tr> 
		        	<tr>
		        		<th align="right">&nbsp;查询次数：</th>
		        		<td>
		        		<c:if test="${empty viewTimes}">
		        		 	<input class="easyui-validatebox" readonly="readonly" type="text" name="viewTimes" id="viewTimes" value="0"></input>
		        		</c:if>
		        		<c:if test="${!empty viewTimes}">
		        			<input class="easyui-validatebox" readonly="readonly" type="text" name="viewTimes" id="viewTimes" value="${advertisement.viewTimes}"></input>
		        		</c:if>
		        		</td>
		        		<th align="right">&nbsp;位置：</th>
		        		<td>
		        			<select id="position"><option value="">--请选择--</option></select>
		        		</td>	        		
		        	</tr> 
		        	<tr>
		        		<th colspan="4">
		        			<div style="padding:10px;">
		        				<input type="button" id="submit" value="提交" class="btnSearch" onmouseout="this.className='btnSearch'" onmouseover="this.className='btnSearch1'" onclick="onSubmit();"/>&nbsp;&nbsp;
						      	<input type="button" value="重置" class="btnSearch" onmouseout="this.className='btnSearch'" onmouseover="this.className='btnSearch1'" onclick="window.location.reload();"/>&nbsp;&nbsp;
						      	<input type="button" value="返回" class="btnSearch" onmouseout="this.className='btnSearch'" onmouseover="this.className='btnSearch1'" onclick="back();"/>
					      	</div>
					    </th>
		        	</tr>       		     	
	        	</table>          	
    		</div> 
    	</div>
	</div>  
</body>
</html>