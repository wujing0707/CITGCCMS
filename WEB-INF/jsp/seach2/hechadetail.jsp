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
 function goback(){
	 history.back();
 }
 function queryOfPreview(contentId, category){
	    window.location.href="${pageContext.request.contextPath}/content/queryOfPreview.action?contentId="+contentId;
	}
 $(function () {
	    $.ajax({
	        type: "post",//使用post方法访问后台
	        dataType: "json",//返回json格式的数据
	        url: "${pageContext.request.contextPath}/content/findHOTKeyword.action",//要访问的后台地址
	        data:{},//要发送的数据
	        complete :function(){$("#load").hide();},//AJAX请求完成时隐藏loading提示
	        success: function(msg){//msg为返回的数据，在这里做数据绑定
	        	var b='关键字:&nbsp;';
	        	$.each(msg.rows, function(i, n){
	        	var a = '<a href="javascript:void(0)" onclick="byHotKwSeachContent(\''+msg.rows[i]+'\')">'+msg.rows[i]+'</a>&nbsp;&nbsp;';
	        	b+=a;
	           });
	           $("#hotkw").html(b);
	        }
	    })
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
    	<div class="logo f_l"><img src="<%=basePath %>html2/images/logo.png" /></div>
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
            <div class="notice_tit f_l f_b">${channel.name}</div>
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
                    <li><a href="<%=basePath %>html2/seach.html">企业信用查询</a></li>
                    <li style="display: none"><a href="<%=basePath %>html2/fqyseach.html" >非企业信用查询</a></li>
                    <li><a href="<%=basePath %>html2/personalseach.html">重点人群信用查询</a></li>
                    <li><a href="<%=basePath %>html2/xyhcm.html">查询码核查</a></li>
                    <li><a href="<%=basePath %>html2/qycheck.html">法人信用核查</a></li>
                    <li><a href="<%=basePath %>html2/mycheck.html">重点人群信用核查</a></li>
                </ul>
            </div>
            
        	<div class="in_menu mt10">
                 <a href="<%=basePath %>html2/qycomplain.html" class="bg_co2"><img src="<%=basePath %>html2/images/icon2.png" /><br />异议申诉</a>
            </div>
            
        </div>
        <!--left over-->
        <!--right begin-->
        <div class="right f_r">
            <div style="display:none" class=" tit1 right_tit"><span>当前位置： <a href="#">信用核查</a> > <em>信用核查详细</em></span></div>
            <div ><font color="red">${errorMsg}</font></div>
            <div class="pad30">                
                <table class="tablelist table">
                    <thead>
                    <tr>
                    <th class="thbg" colspan="10">基本信息 <a href="#" class="tablelink f_r" onclick="goback();">返回</a></th>
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
                
                <table class="tablelist table mt10">
                    <thead>
                    <tr>
                    <th class="thbg" colspan="8">失信行为信息</th>
                    </tr>
                    </thead>
                    
                    <tbody>
                    <tr>
                    <th>处罚机关全称</th>
                    <th>处罚名称</th>
                    <th>行政处罚日期</th>
                    <th>处罚决定书文号</th>
                    <th>处罚事由</th>
                    <th>处罚种类</th>
                    <th>行政处罚结论</th>
                    <th>失信等级</th>
                    </tr>

                    <c:forEach items="${List}" var="l" varStatus="vs">
                    <tr  class="odd">
	                <td>${l.处罚机关全称}</td>
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
                    <th>欠税税种</th>
                    <th>欠费时间</th>
                    <th>单位应补收金额</th>
                    <th>欠费次数</th>
                    </tr>

                    <c:forEach items="${qfqjxx}" var="l" varStatus="vs">
                    <tr  class="odd">
	                <td>${l.欠费类别}</td>
                    <td>${l.欠税税种}</td>
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
