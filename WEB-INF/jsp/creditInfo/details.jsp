<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/cStyle.css"/>
<title>${sysBackTitle}</title>
	</head>
<body class="bodyBG">
	<div id="con" class="con">
			<div class="containTit">
				<span class="position">
					<div class="posiCon">
					信用查询 >>&nbsp;
					</div>
					</span><span class="containTitext">企业信用查询</span>
					<div class="cleardiv"></div>
					</div>
					<div class="padT23">
						<div  region="center">
							<h1>
								企业信用档案
							</h1>
							<div class="fileBanner">
								企业基本信息
							</div>
							<div class="pad15">
								<table width="100%" border="0" align="center" cellpadding="0"
									cellspacing="5" class="table3">
									<tr>
										<th width="15%">
											企业名称：
										</th>
										<td colspan="3">
											${data.qiyemc}
										</td>
									</tr>
									<tr>
										<th>
											法定代表人：
										</th>
										<td>
											${data.faddbrxm }
										</td>
										<th>
											所属行业名称：
										</th>
										<td>
											${data.suoshangymc }
										</td>
									</tr>
									<tr>
										<th>
											组织机构代码：
										</th>
										<!-- 中间三位隐藏 -->
										<td width="40%">
										 <c:if test="${not empty data.zzjgdm}">
<%-- 											 ${fn:substring(data.zzjgdm,0,3)}***${fn:substring(data.zzjgdm,6,-1)} --%>
										 </c:if>
										</td>
										<th width="19%">
											工商注册号：
										</th>
										<!-- 中间七位隐藏 -->
										<td width="26%">
										 <c:if test="${not empty data.gszch}">
<%-- 											${fn:substring(data.gszch,0,4)}*******${fn:substring(data.gszch,11,-1)} --%>
										 </c:if>
										</td>
									</tr>
									<tr>
										<th>
											设立日期：
										</th>
										<td width="40%">
											${data.sheliriqi}
										</td>
										<th width="19%">
											（变更）核准日期：
										</th>
										<td width="26%">
											${data.hezhunriqi }
										</td>
									</tr>
									<tr>
										<th>
											企业住所：
										</th>
										<td colspan="3">
											${data.qiyzhus }
										</td>
									</tr>
									<tr>
										<th>
											登记机关名称：
										</th>
										<td colspan="3">
											${data.gongsdjjgmc }
										</td>
									</tr>
								</table>
							</div>
							<div class="fileBanner">
								政府监管信息
								<span class="grey normal">（含工商 税务 质检 法院 司法 海关 环保 国土 劳动 安检
									食药 卫生 版权 教育 住建等全部职能部门）</span>
							</div>
							<div class="pad15">
								<table width="100%" border="0" align="center" cellpadding="5"
									cellspacing="0" class="table4">
									<c:choose>
										<c:when test="${not empty countlist}">
											<c:forEach var="data" items="${countlist}" varStatus="status">
												<tr>
												<td width="43%">
<%-- 													${status.count}.${fn:split(data,':')[0]} --%>
												</td>
												<td width="*">
													共
													<a target="_blank"
														href="${pageContext.request.contextPath }/web/jsp/front1/promptA2.jsp"
														class="redB"><%-- ${fn:split(data,':')[1]} --%></a>条信息
												</td>
											</tr>
										
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td>
													暂无数据！
												</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</table>
							</div>
						
					</div>
				</div>
			</div>
	</body>
</html>
