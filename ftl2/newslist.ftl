﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="description" content="${channel.description!}"/>
<meta name="keyWords" content="${channel.keywords!}"/>
<title>诚信园区</title>
<link type="text/css" href="css/common.css" rel="stylesheet" />
<link href="js/artDialog2.0.6/skin/chrome/chrome.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="js/artDialog2.0.6/artDialog.min.js"></script>

<style type="text/css">  
        .code{   
            background-image:url("../html/images/QQ.jpg");   
            margin-left: 10px !important;
            font-family:Arial;   
            font-style:italic;   
            color:Red;   
            padding:2px 3px;   
            letter-spacing:3px;   
            font-weight:bolder;     
        }   
</style> 
<script type="text/javascript">
function queryOfPreview(contentId, category){
    window.location.href="../content/queryOfPreview.action?contentId="+contentId+"&date="+new Date();
}

$(function () {
	createCode(0);
	createCode(3);
});
 var code ; //在全局 定义验证码   
 function createCode(no){    
   code = "";   
   var codeLength = 4;//验证码的长度   
   var checkCode = document.getElementById("checkCodeID"+no);   
   var selectChar = new Array(0,1,2,3,4,5,6,7,8,9);//所有候选组成验证码的字符，当然也可以用中文的      
   for(var i=0;i<codeLength;i++){   
    var charIndex = Math.floor(Math.random()*10);   
    code +=selectChar[charIndex];   
   }    
   if(checkCode){   
     checkCode.className="code";   
     checkCode.value = code;
     checkCode.blur();   
   }        
 }
  function validate (i,t){  
    //   var checkCode = document.getElementById("checkCodeID"+i).value;  
       var inputCode = document.getElementById("validCode"+i).value;
       var zzjgdm=$('#zzjgdm').val();   
       var gszch=$('#gszch').val();   
       var companyname=$('#companyname').val();   
   //    if(inputCode.length <=0){   
     //      alert("请输入验证码！");   
       //}   
    //   else if(inputCode.toUpperCase()!=checkCode){   
      //    alert("验证码输入错误！");   
       //}
       if(zzjgdm==""&&gszch==""&&companyname==""){
       		alert("请至少输入一个查询条件!");
       }
       else{   
          //window.location.href="../seach/seachdetail.action?zzjgdm="+zzjgdm+"&gszch="+gszch+"&companyname="+companyname+"&template="+2; 
            $.post('../seach/checkSeachdetail.action',
            {zzjgdm: zzjgdm, gszch:gszch, companyname:companyname,vcode:inputCode, template:2 },
            function(data){
                 if (data == '1') {
                     $('#seaForm').submit(); 
                 }else if(data=='2'){
                 	alert("验证码输入错误！");
                 } else {
                    alert("暂无相关数据");
                 }
               }, "json");   
       }    
 }
 function seachList(i){
 	//   var checkCode = document.getElementById("checkCodeID0").value;  
       var inputCode = document.getElementById("validCode0").value;
       var name=$('#name').val();   
       var sfzhm=$('#sfzhm').val();   
       var zyzhm=$('#zyzhm').val(); 
    //   if(inputCode.length <=0){   
      //     alert("请输入验证码！");   
   //    }else if(inputCode.toUpperCase()!=checkCode){   
   //       alert("验证码输入错误！");   
       if(name==""&&sfzhm==""&&zyzhm==""){
       		alert("请至少输入一个查询条件!");
       }else{   
         //window.location.href="../seach/personalSeachList.action?zyzhm="+zyzhm+"&sfzhm="+sfzhm+"&name="+name+"&template=2";
                     $.post('../seach/checkPersonalSeachList.action',
            {zyzhm: zyzhm, sfzhm:sfzhm, name:name,vcode:inputCode,template:2 },
            function(data){
                 if (data == 1) {
                     $('#personForm').submit(); 
                 }else if(data=='2'){
                 	alert("验证码输入错误！");
                 } else {
                    alert("暂无相关数据");
                 }
               }, "json"); 
       }  
 }
 function reset(){
  	$('#zzjgdm').val('');   
    $('#gszch').val('');   
    $('#companyname').val('');  
    $('#validCode0').val('');  
 }  
 function personalReset(){
 	$('#name').val('');  
 	$('#sfzhm').val('');  
 	$('#zyzhm').val('');  
 	$('#validCode0').val(''); 
 }   
function show(str){
		var id=document.getElementById(str+"_0").value;
		window.location.href='content'+id+"_1.html?date="+new Date(); 
}
function showDe(str){
		window.location.href=str+"?date="+new Date(); 
}
function reload(i){
	if(i==1)
 	 window.location.href="qycheck.html";
 	 if(i==2)
 	 window.location.href="mycheck.html";
 	 if(i==3)
 	 window.location.href="qyyyshensu.html";
}
function goto(staus,name,index,size){
	if(staus=='up'&&index!=1){
		window.location.href=name+"_"+(index-1)+".html?date="+new Date();  
	}else if(staus=='first'){
		window.location.href=name+"_"+"1.html?date="+new Date();  
	}else if(staus=='down'){
		if(index!=size){
			window.location.href=name+"_"+(index+1)+".html?date="+new Date();  
		}
	}else if(staus=='last'){
		window.location.href=name+"_"+size+".html?date="+new Date();  
	}
}
 function seachContent(){
 	//var channelid=document.getElementById("channelid").value;
 	//var title=document.getElementById("title").value;
 	//if(title==""){
 		//return;
 	//}else{
 		//window.location.href="../content/listContentByChannelId.action?channelid="+channelid+"&title="+title;   
 	//	window.location.href="../content/listContentByTitle.action?title="+title;   
 	//}
 	var title=document.getElementById("title").value;
 	if (title == '' || title == '请输入关键字') {
 	   alert('请输入关键字');
 	   return;
 	}
 	title = encodeURIComponent(title);
 	window.location.href="../content/listContentByTitle.action?title="+title+"&date="+new Date(); 
 }
 function query(){
 	 var checknumber=document.getElementById("checkNumber").value;
 	  var reg = new RegExp("^[0-9]*$");  
    if(!reg.test(checknumber)){  
        alert("请输入数字!");  
        return;
    }  
 	 if (checknumber == "") {
 	    alert("信用核查码不能为空！");
 	 } else {
 	        $.post('../seach/approveContent.action',
            {checknumber: checknumber},
            function(data){
                 if (data == 1) {
                      window.open("http://${ip!}/creditVerification/getDetailVerificationInfo.action?checkcode=" + checknumber,
	               'newwindow','height=900,width=1000,top='+(window.screen.availHeight-30-900)/2+
	                   ',left='+(window.screen.availWidth-10-1000)/2+
	                 ',toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no');
               } else if (data == 2) {
                     window.open("http://${ip!}/creditVerification/getgroupsDetailVerificationInfo.action?checkcode=" + checknumber,
	                  'newwindow','height=900,width=1000,top='+(window.screen.availHeight-30-900)/2+
	                   ',left='+(window.screen.availWidth-10-1000)/2+
	                 ',toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no');
               }else {
                   if (data == '-1') {
                     alert("信用查询码不存在！");
                   } else if (data == '-2') {
                     alert("信用查询码已过期！");
                   } else if (data == '-3') {
                     alert("信用查询码已重新生成,请输入最新核查码!");
                   }
                }
            },'json');
 	 }
 }
function SetWinHeight(obj)
{

} 

function gotoPage(total,cid){
	var p=$("#textFooter").val();
	var i = parseInt(total);
	if(p!=""){
		var a=parseInt(p);
		if(a>0&&a<=i)
		window.location.href="../content"+cid+"_"+p+".html?date="+new Date(); 
		if(a>i)
		window.location.href="../content"+cid+"_"+1+".html?date="+new Date(); 
	}
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
		window.location.href = "../content/listContentByTitle.action?title="
				+ title;
	}
</script>
</head>

<body>
<!--header begin-->
<div class="header">
	<div class="wrap">
    	<div class="logo f_l"><a href="http://www.sipac.gov.cn/" target="_blank"><img src="images/logo.png" /></a></div>
    	<div class="number f_r" id="thrNum">
        </div>
    </div>
</div>
<!--header over-->

<!--nav begin-->
<div class="nav">
    <ul class="wrap tabs">
        <li><a href="../goToIndex.action">首页</a></li>
        <#list ListChannel as channel>
        <#if ListChannel??&&channel??>
        <#if channel.channelId!=1&&channel.channel.channelId==1>
        	<li><a href="javascript:void(0)" id="${channel.channelId}" onclick='show("${channel.channelId}")'>${channel.name!}</a></li>
            <#if channel.channels??>
		        	<#list channel.channels as cc>
		        	<#if (cc.status)??&&cc.status==0>
		        	<input type="hidden" id="${channel.channelId}_${cc_index}" value="${cc.channelId}">
		        	</#if>
		        	</#list>
            </#if>
        </#if>
        </#if>
        </#list>
        <li><a href="http://gzjd.sipac.gov.cn/Web/BBS/MainList.aspx"  target="_blank">在线交流</a></li>
    </ul>
</div>
<!--nav over-->

<!--content begin-->
<div class="cloud">
    <!--notice begin-->
    <div class="wrap">
    	<div class="notice f_l"> 
            <div class="notice_tit f_l f_b"><a href="content${fchid}_1.html" style="height:30px;line-height:30px;font-size:16px;color:#277DC4;text-ident:30px">${fChannelName_7!}</a></div>
            <div class="f_l notice_list"  id="mq" onmouseover=iScrollAmount=0 style="overflow:hidden; width:500px; height:30px;color:#000" onmouseout=iScrollAmount=1 >
                <ul>
                    <#if sonChannelList_7??>
	            	<#list sonChannelList_7 as info>
		            	 <#if info??>
		                    <li><a href="javascript:queryOfPreview('${info.contentId?c}')">${info.title!}</a></li>
		                 </#if>
		            </#list>
	             	</#if>
                </ul>
            </div>
        </div>
        <div class="search f_r">
            <form id="searchform" action="../content/listContentByTitle.action" method="post">
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
    <script type="text/javascript" src="js/muqruujs.js"></script>
    <!--notice over-->
    <!--center begin-->
    <div class="wrap mt10">
        <!--left begin-->
        <div class="leftbox f_l">
            <div class="left_menu">
                <h2><#if preName??&&preName!="顶级栏目">${preName}</#if></h2>
                <ul>
                <#if Channels??>
	        	<#list Channels.channels as cc>
				<#if (cc.status)??&&cc.status==0>
                <li><a href="javascript:void(0)" onclick="showDe('content${cc.channelId}_1.html')" <#if channel.channelId?? && cc.channelId?? && channel.channelId == cc.channelId>class="current"</#if>>${cc.name!}</a></li>
                </#if>
		    	</#list>
		    	</#if>
                </ul>
            </div>
            
        	<div class="left_link mt10">
                <a href="seach.html"><img src="images/icon1.png" /><em>信用查询</em></a>
            </div>
            
        	<div class="left_link mt10">
                <a href="qycomplain.html" class="bg_co2"><img src="images/icon2.png" /><em>异议申诉</em></a>
            </div>
            
        </div>
        <!--left over-->
        <!--right begin-->
        <div class="right f_r">
            <div class="right_tit"><input type="hidden" id="channelid" name="channelid" value="${channel.channelId!}"/><span>当前位置：<#if preName??&&preName!="顶级栏目">${preName} > </#if><em>${channel.name}</em> </span></div>
            <div class="pad10">
                <ul class="list inlist">
                 <#list contentlist as con>
            	 <#if (con.status)??&&con.status=="0">
            	  <#if con.isTop==1>
                  <li><img src="images/new.png" /><a href="javascript:queryOfPreview('${con.contentId?c}')">${con.title}</a><span><description><#if con.releaseTime ? exists>[ ${con.releaseTime?string("yyyy-MM-dd")} ]</#if> </description></span></li>
                  <#else>
                  <li><a href="javascript:queryOfPreview('${con.contentId?c}')">${con.title}</a><span><description><#if con.releaseTime ? exists>[ ${con.releaseTime?string("yyyy-MM-dd")} ]</#if> </description></span></li>
                 </#if>
                 </#if>
            	</#list>
                </ul>
            </div> 
            <div class="page_all">
                 <div class="page">
                <#if lastPage??&&lastPage==1>
                	 首页&nbsp;&nbsp;上一页&nbsp;&nbsp;下一页&nbsp;&nbsp;末页&nbsp;&nbsp;第&nbsp;<b>${index}</b>&nbsp;页&nbsp;&nbsp;共&nbsp;<b>${lastPage}</b>&nbsp;页&nbsp;&nbsp;共&nbsp;<b>${recordCount!}</b>&nbsp;条
                 </#if>
                 <#if index??&&index==1&&lastPage gt 1>
                 		 首页&nbsp;&nbsp;上一页&nbsp;&nbsp;<a href="javascript:void(0);" onclick="goto('down','${path}',${index},${lastPage})">下一页</a>&nbsp;&nbsp;<a  href="javascript:void(0);" onclick="goto('last','${path}',${index},${lastPage})">末页</a>&nbsp;&nbsp; 第&nbsp;<b>${index}</b>&nbsp;页&nbsp;&nbsp;共&nbsp;<b>${lastPage}</b>&nbsp;页&nbsp;&nbsp;共&nbsp;<b>${recordCount!}</b>&nbsp;条
                 </#if>
                 <#if index??&&lastPage??&&index==lastPage&&lastPage gt 1>
                 <a href="javascript:void(0);" onclick="goto('first','${path}',${index},${lastPage})">首页</a>&nbsp;&nbsp;<a href="javascript:void(0);" onclick="goto('up','${path}',${index},${lastPage})">上一页</a>&nbsp;&nbsp;下一页&nbsp;&nbsp;末页&nbsp;&nbsp;第&nbsp;<b>${index}</b>&nbsp;页&nbsp;&nbsp;共&nbsp;<b>${lastPage}</b>&nbsp;页&nbsp;&nbsp;共&nbsp;<b>${recordCount!}</b>&nbsp;条
                 </#if>
                 <#if index lt lastPage&&index gt 1>
               <a href="javascript:void(0);" onclick="goto('first','${path}',${index},${lastPage})">首页</a>&nbsp;&nbsp;<a href="javascript:void(0);" onclick="goto('up','${path}',${index},${lastPage})">上一页</a>&nbsp;&nbsp;<a href="javascript:void(0);" onclick="goto('down','${path}',${index},${lastPage})">下一页</a>&nbsp;&nbsp;<a  href="javascript:void(0);" onclick="goto('last','${path}',${index},${lastPage})">末页</a>&nbsp;&nbsp;
               第&nbsp;<b>${index}</b>&nbsp;页&nbsp;&nbsp;共&nbsp;<b>${lastPage}</b>&nbsp;页&nbsp;&nbsp;共&nbsp;<b>${recordCount!}</b>&nbsp;条
               	 </#if>
               	 &nbsp;&nbsp;到第 <input type="text" size="3" id="textFooter"/>&nbsp;页&nbsp;&nbsp;
				 <a style="text-decoration: none;color: #1c89e3;" href="javascript:void(0)" onclick="gotoPage('${lastPage!}','${channel.channelId!}');">跳转</a>&nbsp;&nbsp;&nbsp;&nbsp;
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
