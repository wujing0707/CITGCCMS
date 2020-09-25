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
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/cStyle.css"/>
<title>${sysBackTitle}</title>
	</head>
	<body>
		<div id="container">
			<div class="content">
				<div class="floatL">
					<img
						src="${pageContext.request.contextPath }/web/images/front1/banner.jpg"
						width="753" height="124" />
					<div class="position">
						当前位置：
						<a
							href="${pageContext.request.contextPath }/OldInitAction_toIndex.action">主页</a>
						> 信用查询 > 企业信用查询
					</div>

					<div class="mainContent">
						<div class="tab">
							<ul>
								<li class="current">
									企业信用查询
								</li>
								<li>
									信用结果查询
								</li>
							</ul>
						</div>
						<div id="tab_content1" class="tab_content">
							<div class="red margB10">
								*为必填项，信息提交完成后需要等待管理员处理。
							</div>
							<div class="bold margB10">
								填写所查询企业的相关信息
							</div>
							<form name="applyform"
								action="${pageContext.request.contextPath }/OldQEAction_addApplay.action"
								method="post">
								<div class="formBox">
									<table width="100%" border="0" cellpadding="6" cellspacing="0">
										<tr>
											<td width="16%">
												<span class="red">*</span> 所在地区：
											</td>
											<td width="25%">
												<label for="select"></label>
												<select name="queryEnterprises.address"
													id="queryEnterprises.address">
													<option value="苏州">
														苏州
													</option>
												</select>
											</td>
											<td width="*"></td>
										</tr>
										<tr>
											<td>
												<span class="red">* </span>企业名称：
											</td>
											<td>
												<input type="text" value="${organizationName }"
													name="queryEnterprises.organizationName"
													id="queryEnterprises.organizationName" />
											</td>
											<td><span id="onMsg" style="color: #006400;"></span></td>
										</tr>
										<tr>
											<td>
												&nbsp;&nbsp;法人姓名：
											</td>
											<td>
												<label for="textfield"></label>
												<input type="text" value="${corporationName }"
													name="queryEnterprises.corporationName"
													id="queryEnterprises.corporationName" />
											</td>
											<td><span id="cnMsg" style="color: #006400;"></span></td>
										</tr>
										<tr>
											<td>
												&nbsp;&nbsp;工商注册号：
											</td>
											<td>
												<input type="text" value="${registrationNum }"
													name="queryEnterprises.registrationNum"
													id="queryEnterprises.registrationNum" />
											</td>
											<td><span id="rnMsg" style="color: #006400;"></span></td>
										</tr>
										<tr>
											<td>
												 &nbsp;&nbsp;组织机构代码：
											</td>
											<td>
												<input type="text" value="${organizationCode }"
													name="queryEnterprises.organizationCode"
													id="queryEnterprises.organizationCode" />
											</td>
											<td><span id="ocMsg" style="color: #006400;"></span></td>
										</tr>
									</table>
								</div>
								<div class="bold margB10">
									请留下您的信息以方便我们发送查询结果。我们将为你提供的信息严格保密，谢谢！
								</div>
								<div class="formBox">
									<table width="100%" border="0" cellpadding="6" cellspacing="0">
										<tr>
											<td width="16%">
												<span class="red">* </span>姓名：
											</td>
											<td width="25%">
												<label for="select2"></label>
												<input type="text" name="queryEnterprises.name"
													id="queryEnterprises.name" />
											</td>
											<td width="*"><span id="nameMsg" style="color: #006400;"></span></td>
										</tr>
										<tr>
											<td>
												<span class="red">* </span>身份证号：
											</td>
											<td>
												<label for="textfield"></label>
												<input type="text" name="queryEnterprises.idcard"
													id="queryEnterprises.idcard" />
											</td>
											<td><span id="idcardMsg" style="color: #006400;"></span></td>
										</tr>
								
									</table>
								</div>
							</form>
							<div class="textM">
								<input type="button" name="button" id="button" value="提 交"
									class="btn_R_2"
									onclick="return checkMe();" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
