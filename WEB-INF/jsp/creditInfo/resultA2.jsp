<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/web/jsp/inc/tld.inc"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>诚信苏州</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<script type='text/javascript'
			src='${pageContext.request.contextPath}/web/js/common.js'></script>
		<link href="${pageContext.request.contextPath }/web/css/style.css"
			rel="stylesheet" type="text/css" />
		<script type="text/javascript">
			
			window.onload = function() {
				var selectObj = document.getElementById("pages");
				var curpage = "${curpage}";
				var pageCount = "${pager.pageCount}";
				if(selectObj != null) {
					for(var x=1;x<=pageCount;x++) {
						var opt = new Option("第"+x+"页",x);
						if(browser.isFF) selectObj.options.add(opt);
						else selectObj.add(opt);
						if(x == curpage) opt.selected = true;
					}
					selectObj.onchange = function() {
						document.form.curpage.value = this.options[this.selectedIndex].value;
						document.form.submit();
					}
				}
			}
			
			function jumpTo(curpage) {
				document.form.curpage.value = curpage;
				document.form.submit();
			}
			
		</script>
	</head>
	<body>
							<div class="iIitle">
								<div class="iName1">
									企业信用查询
								</div>
							</div>
							<div class="newsList">
								<div style="" class="suggestTitle">
									搜索关键字
									<span class="red">${queryEnterprises.organizationName}</span>
									的相关结果
								</div>
								<form name="form"
									action="${pageContext.request.contextPath }/FrontQEAction_toSWJEnterprisesResultListPage.action"
									method="post">
									<input type="hidden" name="curpage" id="curpage" />
									<input type="hidden" name="queryEnterprises.organizationName"
										id="queryEnterprises.organizationName"
										value="${queryEnterprises.organizationName}" readonly="true" />
									<c:choose>
										<c:when test="${not empty data}">
											<ul class="iList">
												<c:forEach var="data" items="${data}" varStatus="index">
													<li>
														<c:if test="${not empty data.sheliriqi}">
															<span class="floatR">[${fn:substring(fn:trim(data.sheliriqi),0,10)}]</span>
														</c:if>
														<a target="_blank"
															href="${pageContext.request.contextPath }/FrontQEAction_toSWJDetailsPage.action?id=${data.id}">${data.qiyemc}</a>
													</li>
												</c:forEach>
											</ul>
											<ul class="pages clearfix">
												<li class="floatR">当前页[<span style="color: red;">${curpage}</span>]
												/总页数[<span style="color: red;">${pager.pageCount}</span>]
												<c:if test="${pager.pageCount gt 1}">
													<c:choose>
														<c:when test="${curpage le 1}">
															<span style="color: gray;">首页 上一页</span>
														</c:when>
														<c:otherwise>
															<a href="javascript:jumpTo(1);" style="cursor: pointer;">首页</a>
															<a href="javascript:jumpTo(${curpage-1});"
																style="cursor: pointer;">上一页</a>
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${curpage ge pager.pageCount}">
															<span style="color: gray;">下一页 末页</span>
														</c:when>
														<c:otherwise>
															<a href="javascript:jumpTo(${curpage+1});"
																style="cursor: pointer;">下一页</a>
															<a href="javascript:jumpTo(${pager.pageCount});"
																style="cursor: pointer;">末页</a>
														</c:otherwise>
													</c:choose>
														跳转至<select id="pages"></select>
												</c:if></li>
											</ul>
										</c:when>
										<c:otherwise>
											&nbsp;暂无数据!
										</c:otherwise>
									</c:choose>
							</div>
	</body>
</html>
