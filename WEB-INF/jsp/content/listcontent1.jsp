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
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript">
function show(str){
		var id=document.getElementById(str+"_0").value;
		window.location.href='<%=basePath %>html2/content'+id+"_1.html"; 
}
function gotoo(staus,index,size){
	var title=document.getElementById("title").value;
	if(staus=='up'&&index!=1){
		var v = parseInt(index) - parseInt(1);
		window.location.href="../content/listContentByTitle.action?index="+v+"&title="+title;
	}else if(staus=='first'){
		window.location.href="../content/listContentByTitle.action?title="+title; 
	}else if(staus=='down'){
		if(index!=size){
			var v = parseInt(index) + parseInt(1);
			window.location.href="../content/listContentByTitle.action?index="+v+"&title="+title; 
		}
	}else if(staus=='last'){
		window.location.href="../content/listContentByTitle.action?index="+index+"&title="+title; 
	}
}
function gotoPage(index, size)
{
	var title=document.getElementById("title").value;
	var ti=document.getElementById("textFooter").value;
	if (parseInt(ti) >= 1 && parseInt(ti) <= parseInt(size))
	{
		window.location.href="../content/listContentByTitle.action?index="+ti+"&title="+title;
	}
}
 function seachContent(){
 	var title=document.getElementById("title").value;
 	if (title == '' || title == '请输入关键字') {
  	   alert('请输入关键字');
  	   return;
  	}else{
  		userName = encodeURIComponent(title);
 		window.location.href="../content/listContentByTitle.action?title="+userName;   
 	}
 }
 
function queryOfPreview(contentId, category){
    window.location.href="${pageContext.request.contextPath}/content/queryOfPreview.action?contentId="+contentId;
}
$(document).ready(function() {
 	$.ajax({
        type: "post",//使用post方法访问后台
        dataType: "json",//返回json格式的数据
        url: "../getCCS.action",//要访问的后台地址
        data:{},//要发送的数据
        complete :function(){$("#load").hide();},//AJAX请求完成时隐藏loading提示
        success: function(msg){//msg为返回的数据，在这里做数据绑定
				$("#thrNum").html(msg);
        }
    });
    $.ajax({
        type: "post",//使用post方法访问后台
        dataType: "json",//返回json格式的数据
        url: "../content/findHOTKeyword.action",//要访问的后台地址
        data:{},//要发送的数据
        complete :function(){$("#load").hide();},//AJAX请求完成时隐藏loading提示
        success: function(msg){//msg为返回的数据，在这里做数据绑定
        	var b='关键字:&nbsp;';
        	$.each(msg.rows, function(i, n){
        	var a = '<a href="javascript:void(0)" onclick="byHotKwSeachContent(\''+msg.rows[i]+'\')" >'+msg.rows[i]+'</a>&nbsp;&nbsp;';
        	b+=a;
           });
           $("#hotkw").html(b);
        }
    });
});
	function byHotKwSeachContent(str) {
		var title = encodeURIComponent(str);
		window.location.href = "<%=basePath%>content/listContentByTitle.action?title="
				+ title;
	}
</script>
</head>

<body>
<!--header begin-->
<div class="header">
	<div class="wrap">
    	<div class="logo f_l"><a href="http://www.sipac.gov.cn/" target="_blank"><img src="../html2/images/logo.png" /></a></div>
    	<div class="number f_r" id="thrNum">
        </div>
    </div>
</div>
<!--header over-->

<!--nav begin-->
<div class="nav">
    <ul class="wrap tabs">
        <li><a href="../goToIndex.action">首页</a></li>
        <c:if test="${not empty listChannel}">
        <c:forEach items="${listChannel}" var="channel" varStatus="vs">  
        <c:if test="${(channel.channelId!=1)&&(channel.channel.channelId==1)}">
        <li><a href="javascript:void(0)" id="${channel.channelId}" onclick='show("${channel.channelId}")'>${channel.name}</a></li>
         <c:forEach items="${channel.channels}" var="cc"  varStatus="v">
       		<c:if test="${not empty cc&&cc.status==0}">
       		<input type="hidden" id="${channel.channelId}_${v.index}" value="${cc.channelId}">
        	</c:if>
         </c:forEach>
        </c:if>
        </c:forEach>
        </c:if>
        <li><a href="http://gzjd.sipac.gov.cn/Web/BBS/MainList.aspx" target="_blank">在线交流</a></li>
    </ul>
</div>
<!--nav over-->

<!--content begin-->
<div class="cloud">
    <!--notice begin-->
    <div class="wrap">
    	<div class="notice f_l"> 
            <div class="notice_tit f_l f_b"><a href="content${ccid}_1.html" style="height:30px;line-height:30px;font-size:16px;color:#277DC4;text-ident:30px">${ccname}</a></div>
            <div class="f_l notice_list"  id="mq" onmouseover=iScrollAmount=0 style="overflow:hidden; width:500px; height:30px;color:#000" onmouseout=iScrollAmount=1 >
                <ul>
                    <c:if test="${not empty sonChannelList_7}">
        			<c:forEach items="${sonChannelList_7}" var="info" varStatus="vs">  
                    <li><a href="javascript:queryOfPreview('${info.contentId}')">${info.title}</a></li>
        			</c:forEach>
        			</c:if>
                </ul>
            </div>
        </div>
        <div class="search f_r">
            <form id="searchform">
            	
                <fieldset>
<table>
                 	<tr>
				      <td width="70%">
				      	 <input id="title" name="title" type="text" value="<c:choose><c:when test='${not empty title}'>${title}</c:when><c:otherwise>请输入关键字</c:otherwise></c:choose>" style="width:200px" onblur="if(this.value==''){this.value='请输入关键字';}" onfocus="if(this.value =='请输入关键字') {this.value=''; }" />
				         <input type="button" onclick="seachContent()" name="button"> 
				      </td>
				   	</tr>
				   	<tr>
				   		 <td id="hotkw"></td>
				   	</tr>
				  </table>  
                </fieldset>
            </form>
        </div>
    </div>
    <script type="text/javascript" src="<%=basePath %>html2/js/muqruujs.js"></script>
    <!--notice over-->    <!--center begin-->
    <div class="wrap mt10">
        <!--left begin-->
        <div class="leftbox f_l">
            <div class="left_menu" style="display: none">
                <h2>${channelName}</h2>
                <ul>
                <c:if test="${not empty channelList}">
	            <c:forEach items="${channelList}" var="channel" varStatus="vs">
	            <li><a href="<%=basePath %>html2/content${channel.channelId}_1.html">${channel.name}</a></li>  
	            </c:forEach>
            	</c:if>
                </ul>
            </div>
            
        	<div class="left_link mt10">
                <a href="<%=basePath %>html2/seach.html"><img src="<%=basePath %>html2/images/icon1.png" /><em>信用查询</em></a>
            </div>
            
        	<div class="left_link mt10">
                <a href="<%=basePath %>html2/qycomplain.html" class="bg_co2"><img src="<%=basePath %>html2/images/icon2.png" /><em>异议申诉</em></a>
            </div>
            
        </div>
        <!--left over-->
        <!--right begin-->
        <div class="right f_r">
            <div class="right_tit" style="display: none"><input type="hidden" id="channelid" name="channelid" value="${channelid}"/><span>当前位置：<a href="">${channelName}</a> > <em>${soncName}</em> </span></div>
            <div class="pad10">
                <ul class="list inlist">
             	 <c:if test="${not empty contentList}">
		           	<c:forEach items="${contentList}" var="content" varStatus="vs">
		                <li><a href="javascript:queryOfPreview('${content.contentId}')">${content.title}</a><span>[ ${fn:substring(content.releaseTime,0,10)} ]</span></li>
		            </c:forEach>
           		 </c:if>
           		 <c:if test="${empty contentList }">
           		 	
           		 	<c:choose>
						<c:when test="${typeVal eq '1'}">
						非法字符查询
						</c:when>
						<c:otherwise>
						暂无相关数据 
						</c:otherwise>
					</c:choose>
           		 	<c:if test="">
           		 		
           		 	</c:if>
           		 	
           		 </c:if>
                </ul>
            </div>
     <div class="page_all">
          <div class="page">
            <c:if test="${not empty contentList}">
              <c:if test="${index == 1 && lastPage == 1}">
                                                            首页&nbsp;&nbsp;上一页&nbsp;&nbsp;下一页&nbsp;&nbsp;末页&nbsp;&nbsp;第&nbsp;<b>${index}</b>&nbsp;页&nbsp;&nbsp;共&nbsp;<b>${lastPage}</b>&nbsp;页&nbsp;&nbsp;共&nbsp;<b>${recordCount}</b>&nbsp;条
              </c:if>
              <c:if test="${index == 1 && lastPage > 1}">
                                                            首页&nbsp;&nbsp;上一页&nbsp;&nbsp;<a href="javascript:void(0);" onclick="gotoo('down',${index},${lastPage})">下一页</a>&nbsp;&nbsp;<a  href="javascript:void(0);" onclick="gotoo('last',${lastPage},${lastPage})">末页</a>&nbsp;&nbsp;第&nbsp;<b>${index}</b>&nbsp;页&nbsp;&nbsp;共&nbsp;<b>${lastPage}</b>&nbsp;页&nbsp;&nbsp;共&nbsp;<b>${recordCount}</b>&nbsp;条
              </c:if>
              <c:if test="${index > 1 && index == lastPage}">
                 <a href="javascript:void(0);" onclick="gotoo('first',${index},${lastPage})">首页</a>&nbsp;&nbsp;<a href="javascript:void(0);" onclick="gotoo('up',${index},${lastPage})">上一页</a>&nbsp;&nbsp;下一页&nbsp;&nbsp;末页&nbsp;&nbsp;第&nbsp;<b>${index}</b>&nbsp;页&nbsp;&nbsp;共&nbsp;<b>${lastPage}</b>&nbsp;页&nbsp;&nbsp;共&nbsp;<b>${recordCount}</b>&nbsp;条
               </c:if>
               <c:if test="${index > 1 && index < lastPage}">
               <a href="javascript:void(0);" onclick="gotoo('first',${index},${lastPage})">首页</a>&nbsp;&nbsp;<a href="javascript:void(0);" onclick="gotoo('up',${index},${lastPage})">上一页</a>&nbsp;&nbsp;<a href="javascript:void(0);" onclick="gotoo('down',${index},${lastPage})">下一页</a>&nbsp;&nbsp;<a  href="javascript:void(0);" onclick="gotoo('last',${lastPage},${lastPage})">末页</a>&nbsp;&nbsp;
                                                                   第&nbsp;<b>${index}</b>&nbsp;页&nbsp;&nbsp;共&nbsp;<b>${lastPage}</b>&nbsp;页&nbsp;&nbsp;共&nbsp;<b>${recordCount}</b>&nbsp;条
               	</c:if>
               	 &nbsp;&nbsp;到第 <input type="text" size="3" style="vertical-align:middle;" id="textFooter"/>&nbsp;页&nbsp;&nbsp;
				 <a style="text-decoration: none;color: #1c89e3;" href="javascript:void(0)" onclick="gotoPage('${index}','${lastPage }');">跳转</a>&nbsp;&nbsp;&nbsp;&nbsp;
            </c:if>
        	</div>
        </div>
        <!--right over-->
    </div>
    <!--center over-->
        
    <!--footer begin-->
    <div class="wrap mt10">
        <div class="link">
            <h1>友情链接</h1>
            <ul class="l_list">
                <li><a href="http://www.creditchina.gov.cn/" target="_blank">信用中国</a></li>
                <li><a href="http://www.js.gov.cn/jsxy/index.htm" target="_blank">诚信江苏</a></li>
                <li><a href="http://www.njcredit.gov.cn/" target="_blank">诚信南京</a></li>
                <li><a href="http://www.szcredit.gov.cn/" target="_blank">诚信苏州</a></li>
                <li><a href="http://credit.zjg.gov.cn/toIndex.action" target="_blank">诚信张家港</a></li>
            </ul>
        </div>
        
        <div class="foot">
            <p><span>主办单位：苏州工业园区信用办 </span><span>技术支持：江苏中集科技有限公司</span><span><script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1256639142'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s4.cnzz.com/z_stat.php%3Fid%3D1256639142' type='text/javascript'%3E%3C/script%3E"));</script></span></p>
        </div>
        
    </div>
    <!--footer over-->
</div>
<!--content over-->
    
</body>
</html>
