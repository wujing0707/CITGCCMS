<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
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
    <script type="text/javascript" src="<%=basePath%>js/jquery-1.7.2.js"></script>
<script type="text/javascript">
function show(str){
		var id=document.getElementById(str+"_0").value;
		window.location.href='<%=basePath %>html2/content'+id+"_1.html"; 
}
function goto(staus,name,index,size){
	if(staus=='up'&&index!=1){
		window.location.href=name+"_"+(index-1)+".html"; 
	}else if(staus=='first'){
		window.location.href=name+"_"+"1.html"; 
	}else if(staus=='down'){
		if(index!=size){
			window.location.href=name+"_"+(index+1)+".html"; 
		}
	}else if(staus=='last'){
		window.location.href=name+"_"+size+".html"; 
	}
}
function seachContent(){
 	var title=document.getElementById("title").value;
 	if (title == '' || title == '请输入关键字') {
  	   alert('请输入关键字');
  	   return;
  	}else{
  		title = encodeURIComponent(title);
 		window.location.href="../content/listContentByTitle.action?title="+title;   
 	}
 }
 function submitForm(name,sfzh,zyzh, sfzh_true) {
	 document.getElementById("name").value = name;
	 document.getElementById("sfzh").value = sfzh;
	 document.getElementById("zyzh").value = zyzh;
	 document.getElementById("sfzh_true").value = sfzh_true;
	 document.getElementById("cform").submit();
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
		 function queryOfPreview(contentId, category){
			    window.location.href="${pageContext.request.contextPath}/content/queryOfPreview.action?contentId="+contentId;
			}
</script>
</head>

<body>
<!--header begin-->
<div class="header">
	<div class="wrap">
    	<div class="logo f_l"><img src="../html2/images/logo.png" /></div>
    	<div class="number f_r" id="thrNum">
        </div>
    </div>
</div>
<!--header over-->

<!--nav begin-->
<div class="nav">
    <ul class="wrap tabs">
        <li><a href="../html2/index.html">首页</a></li>
        <c:if test="${not empty listChannel}">
        <c:forEach items="${listChannel}" var="channel" varStatus="vs">  
        <c:if test="${(channel.channelId!=1)&&(channel.channel.channelId==1)}">
        <li><a href="javascript:void(0)" onclick='show("${channel.channelId}")'>${channel.name}</a></li>
         <c:forEach items="${channel.channels}" var="cc"  varStatus="v">
       		<c:if test="${not empty cc}">
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
            <div class="notice_tit f_l f_b"><a href="content${cfid}_1.html" style="height:30px;line-height:30px;font-size:16px;color:#277DC4;text-ident:30px">${channel.name}</a></div>
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
				      	 <input type="text" onfocus="if(this.value =='请输入关键字') {this.value=''; }" onblur="if(this.value==''){this.value='请输入关键字';}" class="text_input" style="width:200px" value="请输入关键字" name="title" id="title">
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
    <!--notice over-->
    
    <!--center begin-->
    <div class="wrap mt10">
        <!--left begin-->
        <div class="leftbox f_l">
            <div class="left_menu">
                <h2>信用查询</h2>
                <ul>
                    <li><a href="<%=basePath %>html2/seach.html">法人信用查询</a></li>
                    <li style="display: none"><a href="<%=basePath %>html2/fqyseach.html" >非企业信用查询</a></li>
                    <li><a href="<%=basePath %>html2/personalseach.html" class="current">重点人群信用查询</a></li>
                    <li><a href="<%=basePath %>html2/xyhcm.html">查询码核查</a></li>
                    <li><a href="<%=basePath %>html2/qycheck.html">法人信用核查</a></li>
                    <li><a href="<%=basePath %>html2/mycheck.html">重点人群信用核查</a></li>
                </ul>
            </div>
        	<div class="left_link mt10">
                <a href="<%=basePath %>html2/qycomplain.html" class="bg_co2"><img src="<%=basePath %>html2/images/icon2.png" /><em>异议申诉</em></a>
            </div>
            
        </div>
        <!--left over-->
        <!--right begin-->
        <div class="right f_r">
            <div style="display:none" class="right_tit"><span>当前位置：信用查询 > <em>重点人群信用查询</em></span></div>
            <div class="pad30">
                <table class="tablelist table">
                    <thead>
                    <tr>
                    <th>姓名</th>
                    <th>注册证书号</th>
                    <th>执业类别</th>
                    <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${array}" var="arr" varStatus="v"> 
	                <tr>
	                <td>${arr[0]}</td>
	                <td>${arr[1]}</td>
	                <td>${arr[2]}</td>
	                <td><a href="javascript:void(0)" onclick="submitForm('${arr[0]}', '${arr[1]}', '${arr[2]}', '${arr[3]}')"  class="tablelink">查看</a></font></td>
	                </tr> 
                	</c:forEach> 
                    </tbody>
                </table>
                  <input type="button" class="btn" value="返回" onclick="history.go(-1)" style="float:right" />
                  <form action="../seach/personalSeachdetail.action" id="cform"" method="POST">
                    <input type="hidden" name="name" id="name"/>
                    <input type="hidden" name="sfzh" id="sfzh"/>
                    <input type="hidden" name="zyzh" id="zyzh"/>
                    <input type="hidden" name="sfzh_true" id="sfzh_true"/>
                  </form>
            </div> 
            <div style="display: none" class="page_all">
                 <div class="page">
                 首页&nbsp;&nbsp;上一页&nbsp;&nbsp;<a href="">下一页</a>&nbsp;&nbsp;<a  href="">末页</a>&nbsp;&nbsp;第&nbsp;<b>1</b>&nbsp;页&nbsp;&nbsp;共&nbsp;<b>20</b>&nbsp;页&nbsp;&nbsp;共&nbsp;<b>100</b>&nbsp;条&nbsp;&nbsp;到第
    <input type="text" size="1" id="textFooter">
    页&nbsp;&nbsp;<a style="text-decoration: none;color: #1c89e3;" href="">跳转</a>&nbsp;&nbsp;&nbsp;&nbsp;
    每页显示
    <select onchange="javascript:gotoPage(1)" name="page.pageSize">
      <option value="5">5</option>
      <option value="10">10</option>
      <option value="15">15</option>
      <option value="20">20</option>
      <option value="25">25</option>
      <option selected="" value="30">30</option>
    </select>
    条数据
                 </div>
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
