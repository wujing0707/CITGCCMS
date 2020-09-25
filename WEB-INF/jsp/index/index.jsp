<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-type" content="text/html"  charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
    <title>诚信园区</title>
    <link type="text/css" href="<%=basePath%>css/common.css" rel="stylesheet"/>
    <link type="text/css" href="<%=basePath%>js/artDialog2.0.6/skin/chrome/chrome.css" rel="stylesheet">
    <script type="text/javascript" src="<%=basePath%>js/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/util.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/artDialog2.0.6/artDialog.min.js"></script>
  </head>
  <body>
    <%@ include file="top.jsp"%>
     <!--notice over-->
    <!--center begin-->
     <div class="wrap mt10 ">
        	<div class="in_menu f_l">
                <a href="seach.html"><img src="images/icon1.png" /><br />信用查询</a>
            </div>
            <div class="box f_l w394 sxjg">
                <h1>${fChannelName_2}
                <c:if test="${not empty sonChannelList_2}">
                  <c:choose>
                    <c:when test="${sonChannleSize_2 < 1 && sonChannleSize_2 != 0}">
                      <a href="" class="arrow" title="更多"></a>
                    </c:when>
                    <c:otherwise>
                      <a href="content${fChannelId_2}_1.html" class="arrow" title="更多"></a>
                    </c:otherwise>
                  </c:choose>
                </c:if>
	        	</h1>
                <ul class="list">
                <c:forEach var="info" items="${sonChannelList_2}"  varStatus="status">
                  <c:if test="${not empty info && status.index < 4}">
                       <c:if test="${sonChannleSize_2 == 1 || sonChannleSize_2 == 0}">
                         <c:choose>
                           <c:when test="${info.isTop==1}">
                              <li><img src="images/new.png" /><a href="javascript:queryOfPreview('${info.contentId}')" title="${info.title}">${info.title}</a></li>
                           </c:when>
                           <c:otherwise>
                              <li><a href="javascript:queryOfPreview('${info.contentId}')" title="${info.title}">${info.title}</a></li>
                           </c:otherwise>
                         </c:choose>
                       </c:if>
                       <c:if test="${sonChannleSize_2 > 1}">
                         <c:choose>
                           <c:when test="${info.isTop==1}"> 
                              <li><img src="images/new.png" /><a href="javascript:queryOfPreview('${info.contentId}')" title="${info.title}"><em>[${sslmName_2}]</em>${info.title}</a></li>
                           </c:when>
                           <c:otherwise>
                             <li><a href="javascript:queryOfPreview('${info.contentId}')" title="${info.title}"><em>[${sslmName_2}]</em>${info.title}</a></li>
                           </c:otherwise>
                         </c:choose>
                       </c:if>
                  </c:if>
                </c:forEach>
                </ul>
            </div>
            <div class="box f_l ml10 w394 sxblack">
            	<div class="sxblackimg"></div>
                <h1>${fChannelName_3}
                <c:if test="${not empty sonChannelList_3}">
                  <c:choose>
                    <c:when test="${sonChannelSize_3 < 1 && sonChannleSize_3 != 0}">
                      <a href="" class="arrow" title="更多"></a>
                    </c:when>
                    <c:otherwise>
                      <a href="content${fChannelId_3}_1.html" class="arrow" title="更多"></a>
                    </c:otherwise>
                  </c:choose>
                </c:if>
	        	</h1>
                <ul class="list">
                <c:forEach var="info" items="${sonChannelList_3}" varStatus="status">
                  <c:if test="${not empty info && status.index < 4}">
                       <c:if test="${sonChannleSize_3 == 1 || sonChannleSize_3 == 0}">
                         <c:choose>
                           <c:when test="${info.isTop==1}">
                              <li><img src="images/new.png" /><a href="javascript:queryOfPreview('${info.contentId}')" title="${info.title}">${info.title}</a></li>
                           </c:when>
                           <c:otherwise>
                              <li><a href="javascript:queryOfPreview('${info.contentId}')" title="${info.title}">${info.title}</a></li>
                           </c:otherwise>
                         </c:choose>
                       </c:if>
                       <c:if test="${sonChannleSize_3 > 1}">
                         <c:choose>
                           <c:when test="${info.isTop==1}"> 
                              <li><img src="images/new.png" /><a href="javascript:queryOfPreview('${info.contentId}')" title="${info.title}"><em>[${sslmName_3}]</em>${info.title}</a></li>
                           </c:when>
                           <c:otherwise>
                             <li><a href="javascript:queryOfPreview('${info.contentId}')" title="${info.title}"><em>[${sslmName_3}]</em>${info.title}</a></li>
                           </c:otherwise>
                         </c:choose>
                       </c:if>
                  </c:if>
                </c:forEach>
                </ul>
            </div>
        </div>
         
        <div class="wrap mt10 ">
        	<div class="in_menu f_l">
                <a href="qycomplain.html" class="bg_co2"><img src="images/icon2.png" /><br/>异议申诉</a>
                <c:if test="${not empty sonChannelList_8}">
                  <c:choose>
                    <c:when test="${sonChannleSize_8 < 1 && sonChannleSize_8 != 0}">
                    <a href="#" class="bg_co3 none"><img src="images/icon3.png" /><br />${fChannelName_8}</a>
                    </c:when>
                    <c:otherwise>
                    <a href="content${fChannelId_8}_1.html" class="bg_co3 none"><img src="images/icon3.png" /><br />${fChannelName_8}</a>
                    </c:otherwise>
                  </c:choose>
                </c:if>
                <c:if test="${empty sonChannelList_8}">
                  <a href="content${fChannelId_8}_1.html" class="bg_co3 none"><img src="images/icon3.png" /><br/>${fChannelName_8}</a>
                </c:if>
            </div>
            
            <div class="f_l mark ml10">
            	<ul>
                	<li>
                        <a href="http://shixin.court.gov.cn/" target="_blank" style="cursor:hand">
                        	<div class="tit" style="padding-right:5px">法院失信被执行</div>
                            <div class="ico"><img src="images/mark_ico2.png" /></div>
                        </a>
                    </li>
                	<li>
                        <a href="http://xxgk.sipac.gov.cn/sipacjcy/SipacJCY/default.aspx" target="_blank" style="cursor:hand;background:#1580e7">
                        	<div class="tit f_l" style="padding-left:10px;width:120px">行贿犯罪档案</div>
                            <div class="ico f_r"><img src="images/mark_ico3.png" /></div>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="box f_r w394">
                <h1>${fChannelName_1}
                <c:if test="${not empty sonChannelList_1}">
                  <c:choose>
                    <c:when test="${sonChannleSize_1 < 1 && sonChannleSize_1 != 0}">
                      <a href="" class="arrow" title="更多"></a>
                    </c:when>
                    <c:otherwise>
                      <a href="content${fChannelId_1}_1.html" class="arrow" title="更多"></a>
                    </c:otherwise>
                  </c:choose>
                </c:if>
	        	</h1>
                <ul class="list">
                <c:forEach var="info" items="${sonChannelList_1}" varStatus="status">
                  <c:if test="${not empty info && status.index < 4}">
                       <c:if test="${sonChannleSize_1 == 1 || sonChannleSize_1 == 0}">
                         <c:choose>
                           <c:when test="${info.isTop==1}">
                              <li><img src="images/new.png" /><a href="javascript:queryOfPreview('${info.contentId}')" title="${info.title}">${info.title}</a></li>
                           </c:when>
                           <c:otherwise>
                              <li><a href="javascript:queryOfPreview('${info.contentId}')" title="${info.title}">${info.title}</a></li>
                           </c:otherwise>
                         </c:choose>
                       </c:if>
                       <c:if test="${sonChannleSize_1 > 1}">
                         <c:choose>
                           <c:when test="${info.isTop==1}"> 
                              <li><img src="images/new.png" /><a href="javascript:queryOfPreview('${info.contentId}')" title="${info.title}"><em>[${sslmName_1}]</em>${info.title}</a></li>
                           </c:when>
                           <c:otherwise>
                             <li><a href="javascript:queryOfPreview('${info.contentId}')" title="${info.title}"><em>[${sslmName_1}]</em>${info.title}</a></li>
                           </c:otherwise>
                         </c:choose>
                    </c:if>
                  </c:if>
                </c:forEach>
                </ul>
            </div>
        </div>
        
        <div class="wrap mt10 tsfw">
        	<h1 class="tsfw_tit f_l">特色服务</h1>
            <ul class="tsfw_pic f_l">
            	<li><a href="http://smecredit.sipac.gov.cn"  target="_blank" class="pic1"></a></li>
            	<li><a href="http://smecredit.sipac.gov.cn" target="_blank" class="pic2"></a></li>
            	<li><a href="http://xxgk.jsgs.gov.cn/xxgk/jcms_files/jcms1/web16/site//col/col1228/index.html"  target="_blank" class="pic3"></a></li>
            	<li><a href="http://58.210.186.76/XXGK/credit/xyxxgk.aspx?type=entList&categoryNum=102001001&OUCode=320509JS"  target="_blank" class="pic4"></a></li>
            </ul>
        </div>   
        <div class="wrap mt10">
            <div class="box f_l w394 news">
                <h1>${fChannelName_4}
                 <c:if test="${not empty sonChannelList_4}">
                  <c:choose>
                    <c:when test="${sonChannleSize_4 < 1 && sonChannleSize_4 !=0}">
                      <a href="" class="arrow" title="更多"></a>
                    </c:when>
                    <c:otherwise>
                      <a href="content${fChannelId_4}_1.html" class="arrow" title="更多"></a>
                    </c:otherwise>
                  </c:choose>
                </c:if>
	        	</h1>
                <ul class="list">
                <c:forEach var="info" items="${sonChannelList_4}" varStatus="status">
                  <c:if test="${not empty info && status.index < 4}">
                       <c:if test="${sonChannleSize_4 == 1 || sonChannleSize_4 == 0}">
                         <c:choose>
                           <c:when test="${info.isTop==1}">
                              <li><img src="images/new.png" /><a href="javascript:queryOfPreview('${info.contentId}')" title="${info.title}">${info.title}</a></li>
                           </c:when>
                           <c:otherwise>
                              <li><a href="javascript:queryOfPreview('${info.contentId}')" title="${info.title}">${info.title}</a></li>
                           </c:otherwise>
                         </c:choose>
                       </c:if>
                       <c:if test="${sonChannleSize_4 > 1}">
                         <c:choose>
                           <c:when test="${info.isTop==1}"> 
                              <li><img src="images/new.png" /><a href="javascript:queryOfPreview('${info.contentId}')" title="${info.title}">${info.title}</a></li>
                           </c:when>
                           <c:otherwise>
                             <li><a href="javascript:queryOfPreview('${info.contentId}')" title="${info.title}">${info.title}</a></li>
                           </c:otherwise>
                         </c:choose>
                       </c:if>
                  </c:if>
                </c:forEach>
                </ul>
            </div>
            
        	<div class="in_menu f_l ml10">
        	    <c:if test="${not empty sonChannelList_5}">
        	      <c:choose>
        	        <c:when test="${sonChannleSize_5 < 1 && sonChannleSize_5 != 0}">
        	          <a href="content${fChannelId_5}_1.html" class="bg_co4"><img src="images/icon4.png" /><br />${fChannelName_5}</a>
        	        </c:when>
        	        <c:otherwise>
        	          <a href="content${fChannelId_5}_1.html" class="bg_co4"><img src="images/icon4.png" /><br />${fChannelName_5}</a>
        	        </c:otherwise>
        	      </c:choose>
        	    </c:if>
        	    <c:if test="${empty sonChannelList_5}">
        	      <a href="content${fChannelId_5}_1.html" class="bg_co4"><img src="images/icon4.png" /><br/>${fChannelName_5}</a>
        	    </c:if>
            </div>
            
            <div class="box f_r w394 policy">
                <h1>${fChannelName_6}
                  <c:if test="${not empty sonChannelList_6}">
                  <c:choose>
                    <c:when test="${sonCannleSize_6 < 1 && sonChannleSize_6 !=0}">
                      <a href="" class="arrow" title="更多"></a>
                    </c:when>
                    <c:otherwise>
                      <a href="content${fChannelId_6}_1.html" class="arrow" title="更多"></a>
                    </c:otherwise>
                  </c:choose>
                </c:if>
	        	</h1>
                <ul class="list">
                <c:forEach var="info" items="${sonChannelList_6}" varStatus="status">
                  <c:if test="${not empty info && status.index < 4}">
                       <c:if test="${sonChannleSize_6 == 1 || sonChannleSize_6 == 0}">
                         <c:choose>
                           <c:when test="${info.isTop==1}">
                              <li><img src="images/new.png" /><a href="javascript:queryOfPreview('${info.contentId}')" title="${info.title}">${info.title}</a></li>
                           </c:when>
                           <c:otherwise>
                              <li><a href="javascript:queryOfPreview('${info.contentId}')" title="${info.title}">${info.title}</a></li>
                           </c:otherwise>
                         </c:choose>
                       </c:if>
                       <c:if test="${sonChannleSize_6 > 1}">
                         <c:choose>
                           <c:when test="${info.isTop==1}"> 
                              <li><img src="images/new.png" /><a href="javascript:queryOfPreview('${info.contentId}')" title="${info.title}">${info.title}</a></li>
                           </c:when>
                           <c:otherwise>
                             <li><a href="javascript:queryOfPreview('${info.contentId}')" title="${info.title}">${info.title}</a></li>
                           </c:otherwise>
                         </c:choose>
                       </c:if>
                    </c:if>
                </c:forEach>
                </ul>
            </div>
          </div>
         <%@ include file="foot.jsp"%> 
</body>
</html>
<script type="text/javascript">
function queryOfPreview(contentId, category){
    window.location.href="${pageContext.request.contextPath}/content/queryOfPreview.action?contentId="+contentId;
}

function seachContent() {
	var title = document.getElementById("title").value;
	if (title == '' || title == '请输入关键字') {
		alert('请输入关键字');
		return;
	}
	title = encodeURIComponent(title);
	//title = encodeURI(encodeURI(userName, "UTF-8"), "UTF-8");
	//alert(title);
	window.location.href = "<%=basePath%>content/listContentByTitle.action?title="
			+ title;
}

function show(str) {
	var id = document.getElementById(str + "_0").value;
	window.location.href = '<%=basePath%>content' + id + "_1.html";
}
function out(){
        //if(getCookie("out")!="yes"){
             //  setCookie("out","yes",1);
               //alert(123);
       artDialog({
		  height: 55,
		 content:'园区信用网址目前为试运营，您可以将反馈意见发送到相关微信号！<br/><img src="images/eweima.jpg" width="80" height="80" style="padding-left:130px"></img>'});
      //  }
}
function close() {
  $('.ui_dialog_wrap').remove();
}
setTimeout("out()",1000); 
//setTimeout("close()",4000); 
</script> 