<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${sysBackTitle} </title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/ueditor/themes/default/css/ueditor.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/cStyle.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/ztree/zTreeStyle/zTreeStyle.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/ajaxfileupload.js"></script>
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
function back() {
    window.location.href = "${pageContext.request.contextPath}/hotKey/toHotKey.action";
}
/**
 * 提交内容
 */
function submitForm(){
	var hotKey = $('#hotKey').val();
	var id = '${sd.id}';
	var url;
	if (hotKey.length==0)
	{
		$.messager.alert('提示','关键字不能为空！','warning');
		return;
	}
	if (id == ''){
		url = "${pageContext.request.contextPath}/hotKey/add.action";
	}else{
		url = "${pageContext.request.contextPath}/hotKey/editById.action?id="+id;
	}
	$("#submit").attr("disabled", "disabled"); // 提交按钮不可用
	$.post(url, {hotKey : hotKey}, function(data) {
		$("#submit").removeAttr("disabled"); // 回复提交按钮可用
		if (data.result) {
			if(data.message=="1"){
				$.messager.alert("操作提示", "关键字已存在!", "warning");	
			}else{
				$.messager.alert("成功", data.message, "info", function(r) {
					back();
				});
			}
		} else
			$.messager.alert('失败', data.message, "error", function(r) {});
	}, "json");
}
</script>
<title>关键字管理</title>
</head>
<body class="bodyBG">
    <div class="con" id="con">
         <div class="containTit">
            <span class="position">
                <div class="posiCon">关键字管理&nbsp;>>&nbsp;列表</div>
            </span>
            <span class="containTitext marB10">关键字管理</span>
            <!-- 页面隐藏域 -->
            <div id="tab_zzjs_1">
                <span class="positon">
                    <h3 class="h3Auto"> <a class="tabBbg" href="javascript:void(0);"> <span>关键字管理</span> </a> </h3>
                </span>
                <div class="padT23">
			    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table4">
			        <tr>
			            <th><font color="red">*</font>关键字：</th>
			            <td><input class="easyui-validatebox" type="text"name="hotKey" id="hotKey" value="${sd.description}" data-options="validType:'length[0,4]'" maxlength=4></td>
			        </tr>
			        <tr id="submit_tr">
	                    <th colspan="4">
	                        <div style="padding:10px;">
	                            <input id="submit" type="button" value="提交" class="btnSearch" onmouseout="this.className='btnSearch'" onmouseover="this.className='btnSearch1'" onclick="submitForm();"/>&nbsp;&nbsp;
	                            <input type="button" value="返回" class="btnSearch" onmouseout="this.className='btnSearch'" onmouseover="this.className='btnSearch1'" onclick="back();"/>
	                        </div>
	                    </th>
		            </tr>
			    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>