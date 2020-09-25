<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>诚信园区</title>
<link type="text/css" href="<%=basePath %>html2/css/common.css" rel="stylesheet" />
</head>

<body>
                <table class="tablelist table">
                    <thead>
                    <tr>
                    <th class="thbg" colspan="10">基本信息 </th>
                    </tr>
                    </thead>
                    
                    <tbody>
                    <tr>
                    <th width="70">姓名</th>
                    <td colspan="3">${jbxs.姓名 }</td>
                    <th>身份证号</th>
                    <td>${jbxs.身份证号}</td>
                    <th>注册证书号</th>
                    <td>${jbxs.注册证书号}</td>
                    <th>执业类别</th>
                    <td>${jbxs.执业类别}</td>
                    </tr>

                    <tr  class="odd">
                    <th>性别</th>
                    <td>${jbxs.性别}</td>
                    <th>执业范围</th>
                    <td>${jbxs.执业范围}</td>
                    <th>执业单位</th>
                    <td>${jbxs.执业单位}</td>
                    <th>资格证书号</th>
                    <td>${jbxs.资格证书号}</td>
                    </tr>
                    </tbody>
                </table>
                
                <table class="tablelist table mt10">
                    <thead>
                    <tr>
                    <th class="thbg" colspan="7">荣誉表彰信息</th>
                    </tr>
                    </thead>
                    
                    <tbody>
                    <tr>
                    <th>表彰部门</th>
                    <th>荣誉称号</th>
                    <th>表彰日期</th>
                    <th>批准文号</th>
                    <th>表彰内容</th>
                    <th>地区</th>
                    <th>年度</th>
                    </tr>

                    <c:forEach items="${List}" var="l" varStatus="vs">
                    <tr  class="odd">
	                <td>${l.表彰部门}</td>
                    <td>${l.荣誉称号}</td>
                    <td>${l.表彰日期}</td>
                    <td>${l.批准文号}</td>
                    <td>${l.表彰内容}</td>
                    <td>${l.地区}</td>
                    <td>${l.年度}</td>
                    </tr>
                    </c:forEach>
                                        
                    </tbody>
                </table>
                <table class="tablelist table ">
                    <thead>
                    <tr>
                    <th class="thbg" colspan="8">失信行为信息</th>
                    </tr>
                    </thead>
                    
                    <tbody>
                    <tr>
                    <th>处罚机关名称</th>
                    <th>处罚名称</th>
                    <th>行政处罚日期</th>
                    <th>处罚决定书文号</th>
                    <th>处罚事由</th>
                    <th>处罚种类</th>
                    <th>行政处罚结论</th>
                    <th>失信等级</th>
                    </tr>

                    <c:forEach items="${qsggxx}" var="l" varStatus="vs">
                    <tr  class="odd">
	                <td>${l.处罚机关名称}</td>
                    <td>${l.处罚名称}</td>
                    <td>${l.行政处罚日期}</td>
                    <td>${l.处罚决定书文号}</td>
                    <td>${l.处罚事由}</td>
                    <td>${l.处罚种类}</td>
                    <td>${l.行政处罚结论}</td>
                    <td>${l.失信等级}</td>
                    </tr>
                    </c:forEach>
                                        
                    </tbody>
                </table>
</body>
</html>
