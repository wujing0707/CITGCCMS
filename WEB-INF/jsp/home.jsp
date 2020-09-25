<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
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
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/locale/easyui-lang-zh_CN.js"></script>
<title>${sysBackTitle}</title>
<script type="text/javascript">
$(function() {
	$.post("${pageContext.request.contextPath}/content/queryUnapproved.action", {},
		function(data) {
			if(data.rows.length > 10) {
				//只显示20条
				for (var i = 0; i < 10; i++) {
					$("#pendingAuditID").append("<a href='javascript: queryById(\""+data.rows[i].contentId+"\");'><li>" + data.rows[i].title + "<span class=\"LogFonBlue floatR\">"+data.rows[i].releaseTime+"</span></li></a>");
				}
			} else {
				for (var i = 0; i < data.rows.length; i++) {
					$("#pendingAuditID").append("<a href='javascript: queryById(\""+data.rows[i].contentId+"\");'><li>" + data.rows[i].title + "<span class=\"LogFonBlue floatR\">"+data.rows[i].releaseTime+"</span></li></a>");
				}
			}		
		},
	"json");
});

function queryById(id){
	window.location.href = "${pageContext.request.contextPath}/content/queryById.action?id="+id+"&isApprove=1";
}
function queryOfPreview(contentId, category){
    window.open("${pageContext.request.contextPath}/content/queryOfPreview.action?contentId="+contentId+"&category="+category,
            'newwindow','height=900,width=1000,top='+(window.screen.availHeight-30-900)/2+
            ',left='+(window.screen.availWidth-10-1000)/2+
            ',toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no');
}
</script>
</head>
<body class="bodyBG">
    <div id="con" class="con" >
    	<div class="containTit">
    		<span class="position">
		    	<div class="posiCon">首页>>&nbsp;工作台</div>
		    </span><span class="containTitext">工作台</span>
		    <div class="cleardiv"></div>
	  	</div>
    	<div id="tab_zzjs_1">
    	    <div>
			     <div>      
			            <table width="100%" border="0" cellspacing="10" cellpadding="0" class="tableMission">
			              <tr>
			                <td align="left" nowrap="nowrap" width="50%" valign="top">
			                  <div class="mission_box" style="height:550px">
			                   <table width="100%" border="0" cellspacing="0" cellpadding="0">
			                      <tr>
			                        <th scope="col" align="left" width="1%" nowrap="nowrap" class="mission_tit" id="Mtit1">待审核列表</th>
			                        <th scope="col" align="right" width="*"><a href="${pageContext.request.contextPath}/content/toContentsApp.action">more</a></th>
			                      </tr>
			                      <tr class="mission_line">
			                        <td width="1%">&nbsp;</td>
			                        <td width="*">&nbsp;</td>
			                      </tr>
			                      <tr>
			                        <td colspan="2" class="pad10 BGwhite">
			                         <ul id="pendingAuditID">	
			                          <c:forEach items="${appList}" end="9" var="appList">
				                        	<a href='javascript: queryOfPreview("${appList.contentId}","${appList.category}");'><li>${appList.title}
				                        	<span class="LogFonBlue floatR"><fmt:formatDate value="${appList.releaseTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span></li></a>
				                        </c:forEach>	                           
			                         </ul>
			                        </td>
			                      </tr>
			                    </table>   
			                   </div>                 
			                  </td>
			                <td align="left" nowrap="nowrap" width="50%" valign="top">
			                 <div class="mission_box" style="height:550px">
			                   <table width="100%" border="0" cellspacing="0" cellpadding="0">
			                      <tr>
			                        <th scope="col" align="left" width="1%" nowrap="nowrap" class="mission_tit" id="Mtit2">内容发布</th>
			                        <th scope="col" align="right" width="*"><a href="${pageContext.request.contextPath}/content/toContents.action">more</a></th>
			                      </tr>
			                      <tr class="mission_line">
			                        <td>&nbsp;</td>
			                        <td>&nbsp;</td>
			                      </tr>
			                      <tr>
			                        <td colspan="2" class="pad10 BGwhite">
			                       	<ul id="publishedID">
				                        <c:forEach items="${publishedList}" end="9" var="publishedList">
				                        	<a href='javascript: queryOfPreview("${publishedList.contentId}","${publishedList.category}");'><li>${publishedList.title}
				                        	<span class="LogFonBlue floatR"><fmt:formatDate value="${publishedList.releaseTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span></li></a>
				                        </c:forEach>
			                        </ul>		                         
			                        </td>
			                      </tr>
			                    </table>   
			                   </div>
			                </td>
			              </tr>
<!-- 			              <tr>
			                <td align="left" nowrap="nowrap" width="50%">
			                 <div class="mission_box">
			                   <table width="100%" border="0" cellspacing="0" cellpadding="0">
			                      <tr>
			                        <th scope="col" align="left" width="1%" nowrap="nowrap" class="mission_tit" id="Mtit3">站内公告</th>
			                        <th scope="col" align="right" width="*"><a href="#">more</a></th>
			                      </tr>
			                      <tr class="mission_line">
			                        <td>&nbsp;</td>
			                        <td>&nbsp;</td>
			                      </tr>
			                      <tr>
			                        <td colspan="2" class="pad10 BGwhite">
			                         <ul>
			                             <li><a href="文章列表.html" class="floatL">《私人订制》有望带火苏州游</a> <span class="LogFonBlue floatR">2013-12-25 19:50</span></li>			                             
			                            </ul>
			                        </td>
			                      </tr>
			                    </table>   
			                   </div>
			                </td>
			                <td align="left" nowrap="nowrap" width="50%">
			                 <div class="mission_box">
			                   <table width="100%" border="0" cellspacing="0" cellpadding="0">
			                      <tr>
			                        <th scope="col" align="left" width="1%" nowrap="nowrap" class="mission_tit" id="Mtit4">站内留言</th>
			                        <th scope="col" align="right" width="*"><a href="#">more</a></th>
			                      </tr>
			                      <tr class="mission_line">
			                        <td>&nbsp;</td>
			                        <td>&nbsp;</td>
			                      </tr>
			                      <tr>
			                        <td colspan="2" class="pad10 BGwhite">
			                         <ul>
			                             <li><a href="文章列表.html" class="floatL">《私人订制》有望带火苏州游</a> <span class="LogFonBlue floatR">2013-12-25 19:50</span></li>			                             
			                            </ul>
			                        </td>
			                      </tr>
			                    </table>   
			                   </div>
			                </td>
			              </tr> -->
			      </table>
			    </div>
		    </div>
    	</div>
	</div>  
</body>
</html>