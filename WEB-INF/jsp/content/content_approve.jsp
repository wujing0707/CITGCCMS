<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript">
function submitFormApprove(){
	var approve;
	if($("#approvePass").attr("checked"))
		approve = '1';
	else
		approve = '0';
	$.post('${pageContext.request.contextPath}/content/approveContent.action',
			{contentId: $('#contentId').val(), approve: approve, summary: $('#summary').val()},
			function(data){
				if(data.result){
					$.messager.confirm("成功", data.message, function(r){
    			        if(r){
					      opener.location.reload();
					      window.close();					
    			        }
    			    });
				}else
					$.messager.confirm('失败',data.message, function(r){
    			        if(r){
    			        }
    			    });
			},'json');
}

function radioClick(p){
	if (p == 0) {
        $("#approveNotPass").attr("checked", true);
        $("#approvePass").attr("checked", false);
    } else {
        $("#approvePass").attr("checked", true);
        $("#approveNotPass").attr("checked", false);
    }
}
</script>
</head>
<body>
<div style="padding: 10px;">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table4">
        <tr>
            <th>审核：</th>
            <td>
            <input type="hidden" id="contentId" value="${contentId}" />
                <input type="radio" id="approvePass" checked="checked" onclick="radioClick(1);"/>通过
                <input type="radio" id="approveNotPass" onclick="radioClick(0);"/>拒绝
            </td>
        </tr>
        <tr>
            <th>审核备注：</th>
            <td>
                <textarea id="summary" rows="3" cols="50"></textarea>
            </td>
        </tr>
        <tr>
            <th colspan="2">
                <div style="padding:10px;">
			        <input id="submit" type="button" value="提交" class="btnSearch" onmouseout="this.className='btnSearch'" onmouseover="this.className='btnSearch1'" onclick="submitForm();"/>&nbsp;&nbsp;
			        <input type="button" value="重置" class="btnSearch" onmouseout="this.className='btnSearch'" onmouseover="this.className='btnSearch1'" 
			        onclick="javascript:window.location.href=window.location.href;"/>&nbsp;&nbsp;
			        <input type="button" value="返回" class="btnSearch" onmouseout="this.className='btnSearch'" onmouseover="this.className='btnSearch1'" onclick="window.close();"/>
			    </div>
            </th>
        </tr>
    </table>

</div>
</body>
</html>