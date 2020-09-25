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
                    <th width="70">企业名称</th>
                    <td colspan="3">${jbxs.企业名称 }</td>
                    <th>组织机构代码</th>
                    <td>${jbxs.组织机构代码}</td>
                    <th>企业注册号</th>
                    <td>${jbxs.企业注册号}</td>
                    <th>法定代表人</th>
                    <td>${jbxs.法定代表人}</td>
                    </tr>

                    <tr  class="odd">
                    <th>注册类型</th>
                    <td>${jbxs.注册类型}</td>
                    <th>注册资本</th>
                    <td>${jbxs.注册资本}</td>
                    <th>企业状态</th>
                    <td>${jbxs.企业状态}</td>
                    <th>联系电话</th>
                    <td>${jbxs.联系电话}</td>
                    <th>纳税人标识号</th>
                    <td>${jbxs.纳税人标识号}</td>
                    </tr>
                    
                    <tr>
                    <th>注册地址</th>
                    <td colspan="3">${jbxs.注册地址}</td>
                    <th>经营范围</th>
                    <td colspan="5">${jbxs.经营范围}</td>
                    </tr> 
                    
                    </tbody>
                </table>
                <c:forEach items="${infos}" var="info" varStatus="vs">
                <table class="tablelist table mt10">
                    <thead>
                    <tr>
                    <th class="thbg" colspan="7">${info.name}</th>
                    </tr>
                    </thead>
                    
                    <tbody>
                    <tr>
                    <th>处罚名称</th>
                    <th>行政处罚日期</th>
                    <th>处罚决定书文号</th>
                    <th>处罚事由</th>
                    <th>处罚种类</th>
                    <th>行政处罚结论</th>
                    <th>失信等级</th>
                    </tr>
                    <c:forEach items="${info.value}" var="l" varStatus="vs">
                    <tr  class="odd">
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
                </c:forEach>
                <table class="tablelist table ">
                    <thead>
                    <tr>
                    <th class="thbg" colspan="5">欠税公告信息</th>
                    </tr>
                    </thead>
                    
                    <tbody>
                    <tr>
                    <th>纳税人识别号</th>
                    <th>欠税税种</th>
                    <th>非正常户认定时间及其他需要说明的事项</th>
                    <th>当期新发生的欠税金额</th>
                    <th>截止日期</th>
                    </tr>

                    <c:forEach items="${qsggxx}" var="l" varStatus="vs">
                    <tr  class="odd">
	                <td>${l.纳税人识别号}</td>
                    <td>${l.欠税税种}</td>
                    <td>${l.非正常户认定时间及其他需要说明的事项}</td>
                    <td>${l.当期新发生的欠税金额}</td>
                    <td>${l.截止日期}</td>
                    </tr>
                    </c:forEach>
                                        
                    </tbody>
                </table>
                <table class="tablelist table ">
                    <thead>
                    <tr>
                    <th class="thbg" colspan="5">欠费欠缴信息</th>
                    </tr>
                    </thead>
                    
                    <tbody>
                    <tr>
                    <th>欠费类别</th>
                    <th>欠费时间</th>
                    <th>单位应补收金额</th>
                    <th>欠费次数</th>
                    </tr>

                    <c:forEach items="${qfqjxx}" var="l" varStatus="vs">
                    <tr  class="odd">
	                <td>${l.欠费类别}</td>
                    <td>${l.欠费时间}</td>
                    <td>${l.单位应补收金额}</td>
                    <td>${l.欠费次数}</td>
                    </tr>
                    </c:forEach>
                                        
                    </tbody>
                </table>
                <table class="tablelist table ">
                    <thead>
                    <tr>
                    <th class="thbg" colspan="10">法院执行人案件当事人信息</th>
                    </tr>
                    </thead>
                    
                    <tbody>
                    <tr>
                    <th>案号</th>
                    <th>诉讼地位</th>
                    <th>立案日期</th>
                    <th>案由</th>
                    <th>执行依据文号</th>
                    <th>立案标的</th>
                    <th>结案方式</th>
                    <th>结案标的</th>
                    <th>结案日期</th>
                    <th>受理法院</th>
                    </tr>

                    <c:forEach items="${qfqjxx}" var="l" varStatus="vs">
                    <tr  class="odd">
	                <td>${l.案号}</td>
                    <td>${l.诉讼地位}</td>
                    <td>${l.立案日期}</td>
                    <td>${l.案由}</td>
                    <td>${l.执行依据文号}</td>
                    <td>${l.立案标的}</td>
                    <td>${l.结案方式}</td>
                    <td>${l.结案标的}</td>
                    <td>${l.结案日期}</td>
                    <td>${l.受理法院}</td>
                    </tr>   
                    </c:forEach>
                                        
                    </tbody>
                </table>
</body>
</html>
