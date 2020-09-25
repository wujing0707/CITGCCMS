<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
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
</head>
<body>
<div style="padding: 10px;">
    <%-- <table class="easyui-datagrid" style="width: 500px; height: auto;" title="操作记录详情">
        <thead>
            <tr>
                <th data-options="field:'cx',align:'center'">次序</th>
                <th data-options="field:'shzt',align:'center'">状态</th>
                <th data-options="field:'shr',align:'center'">操作人</th>
                <th data-options="field:'shjs',align:'center'">角色</th>
                <th data-options="field:'shbz',align:'center'">备注</th>
                <th data-options="field:'shsj',align:'center'">时间</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="lst" items="${list}" varStatus="varstatus">
	            <tr>
	                <td>${varstatus.count}</td>
	                <td>${lst.statusDesc}</td>
	                <c:choose>
	                    <c:when test="${lst.sysUser != null}">
	                        <td>${lst.sysUser.username}</td>
	                    </c:when>
	                    <c:otherwise>
	                        <td></td>
	                    </c:otherwise>
	                </c:choose>
	                <td>${lst.roleIdDesc}</td>
	                <td>${lst.summary}</td>
	                <td>${lst.createTime}</td>
	            </tr>
	        </c:forEach>
        </tbody>
    </table>
    <div style="padding:10px;">
        <input type="button" value="关闭窗口" class="btnSearch" onmouseout="this.className='btnSearch'" onmouseover="this.className='btnSearch1'" onmouseup="window.close();"/>
    </div> --%>
    
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table4">
        <tr>
            <th>次序</th>
            <th>状态</th>
            <th>操作人</th>
            <th>角色</th>
            <th>备注</th>
            <th>时间</th>
        </tr>
        <c:forEach var="lst" items="${list}" varStatus="varstatus">
             <tr>
                 <td>${varstatus.count}</td>
                 <td>${lst.statusDesc}</td>
                 <c:choose>
                     <c:when test="${lst.sysUser != null}">
                         <td>${lst.sysUser.username}</td>
                     </c:when>
                     <c:otherwise>
                         <td></td>
                     </c:otherwise>
                 </c:choose>
                 <td>${lst.roleName}</td>
                 <td>${lst.summary}</td>
                 <td><fmt:formatDate value="${lst.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
             </tr>
         </c:forEach>
         <tr>
           <th colspan="6">
                <div style="padding:10px;">
                    <input type="button" value="关闭窗口" class="btnSearch" onmouseout="this.className='btnSearch'" onmouseover="this.className='btnSearch1'" onclick="window.close();"/>
                </div>
            </th>
         </tr>
    </table>
    
</div>
</body>
</html>