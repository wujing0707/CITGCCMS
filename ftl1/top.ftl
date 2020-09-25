<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>诚信园区</title>
<link type="text/css" href="css/common.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
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
<script>
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
function show(str){
		var id=document.getElementById(str+"_0").value;
		window.location.href='content'+id+"_1.html"; 
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
 function validate (i,t){  
       var checkCode = document.getElementById("checkCodeID"+i).value;  
       var inputCode = document.getElementById("validCode"+i).value;
       var zzjgdm=$('#zzjgdm').val();   
       var gszch=$('#gszch').val();   
       var companyname=$('#companyname').val();   
       if(inputCode.length <=0){   
           alert("请输入验证码！");   
       }   
       else if(inputCode.toUpperCase()!=checkCode){   
          alert("验证码输入错误！");   
       }
       else if(zzjgdm==""&&gszch==""&&companyname==""){
       		alert("请至少输入一个查询条件!");
       }
       else{   
         window.location.href="../seach/seachdetail.action?zzjgdm="+zzjgdm+"&gszch="+gszch+"&companyname="+companyname+"&template="+t;   
       }    
 }
 function seachList(i){
 	   var checkCode = document.getElementById("checkCodeID0").value;  
       var inputCode = document.getElementById("validCode0").value;
       var name=$('#name').val();   
       var sfzhm=$('#sfzhm').val();   
       var zyzhm=$('#zyzhm').val(); 
       if(inputCode.length <=0){   
           alert("请输入验证码！");   
       }   
       else if(inputCode.toUpperCase()!=checkCode){   
          alert("验证码输入错误！");   
       }else if(name==""&&sfzhm==""&&zyzhm==""){
       		alert("请至少输入一个查询条件!");
       }else{   
         window.location.href="../seach/personalSeachList.action?zyzhm="+zyzhm+"&sfzhm="+sfzhm+"&name="+name+"&template=1";   
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
 function query(i){
 	var number=$('#checknumber').val();
 	if(number==""){
 		alert("请输入信用核查码！");
 		return;
 	}else{
 		window.location.href="http://172.25.106.6:8080/YQFramework-web/creditVerification/getDetailVerificationInfo.action?checkcode="+number;   
 	}
 }
 function checkReset(){
 	$('#checknumber').val('');
 }
 function query1(i){
 	var number=$('#checknumber').val();
 	if(number==""){
 		alert("请输入我的信用核查码！");
 		return;
 	}else{
 		window.location.href="http://172.25.106.6:8080/YQFramework-web/creditVerification/tocreditVerification.action?UTYPE=P&IDCODE="+number;   
 	}
 }
 function seachContent(cid){
 	var title=$('#title').val();
 	if(title==""){
 		return;
 	}else{
 		window.location.href="../content/listContentByChannelId.action?channelid="+cid+"&title="+title;   
 	}
 }
</script>
<script type="text/javascript">
$(document).ready(function(){
  $(".click").click(function(){
  $(".tip").fadeIn(200);
  });
  
  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
});

  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
});

});
</script>
</head>

<body>
<!--header begin-->
<div class="wrap header">
	<div class="logo"><a href="index.html"><img src="images/logo.png" /></a></div>
    <div class="nav">
        <ul>
            <li><a href="index.html">首页</a></li>
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
        </ul>
    </div>
    
</div>
<!--header over-->