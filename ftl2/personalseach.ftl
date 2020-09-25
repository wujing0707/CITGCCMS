<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<title>诚信园区</title>
<link type="text/css" href="css/common.css" rel="stylesheet" />
<link type="text/css" href="css/easyui.css" rel="stylesheet" />
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
  function ajaxLoading(){
      $("<div class=\"datagrid-mask\"></div>").css({display:"block",width:"100%",height:$(window).height()}).appendTo("body");
      $("<div class=\"datagrid-mask-msg\"></div>").html("正在处理，请稍候...").appendTo("body").css({display:"block",left:($(document.body).outerWidth(true) - 190) / 2,top:($(window).height() - 45) / 2});
   }
   function ajaxLoadEnd(){
       $(".datagrid-mask").remove();
       $(".datagrid-mask-msg").remove();
  }
  function validate (i,t){  
    //   var checkCode = document.getElementById("checkCodeID"+i).value;  
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
       if(inputCode.length <=0){   
           alert("请输入验证码！");   
       } else if(zzjgdm==""&&gszch==""&&companyname==""){
       		alert("请至少输入一个查询条件!");
       }
       else{   
          var url = "../seach/checkSeachdetail.action";
           $.ajax({
            url: url,
            beforeSend:ajaxLoading,
            dataType: 'json',
            data:{zzjgdm: zzjgdm,
                  gszch:gszch,
                  companyname:companyname,
                  vcode:inputCode,
                  template:2
            },
            success:function(data){ 
            if (data == '1') {
                 $('#seaForm').submit();
             }else if(data=='2'){
             	alert("验证码输入错误！");
             } else {
                alert("暂无相关数据");
             }
                 ajaxLoadEnd();
			}
            });
       }    
 }
 function seachList(i){
 	//   var checkCode = document.getElementById("checkCodeID0").value;  
       var inputCode = document.getElementById("validCode"+i).value;
       var name=$('#name').val();   
       var sfzhm=$('#sfzhm').val();   
       var zyzhm=$('#zyzhm').val(); 
     //  if(inputCode.length <=0){   
           //alert("请输入验证码！");   
       //}else 
       if(name==""&&sfzhm==""&&zyzhm==""){
       		alert("请至少输入一个查询条件!");
       }else{
               var url = "../seach/checkPersonalSeachList.action?date="+new Date().getTime();
               name=encodeURI(name,"UTF-8");
               name=encodeURI(name,"UTF-8");
               $.ajax({
                url: url,
                beforeSend:ajaxLoading,
                dataType: 'json',
                data:{zyzhm: zyzhm,
                      sfzhm:sfzhm,
                      name:name,
                      vcode:inputCode,
                      template:2
                },
                success:function(data){ 
                if (data == '1') {
                     $('#personForm').submit();
                 }else if(data=='2'){
                 	alert("验证码输入错误！");
                 } else {
                    alert("暂无相关数据");
                 }
                     ajaxLoadEnd();
				}
	            });
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
		window.location.href='content'+id+"_1.html"; 
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
 	window.location.href="../content/listContentByTitle.action?title="+title; 
 }
function gotoPage(total,cid){
	var p=$("#textFooter").val();
	var i = parseInt(total);
	if(p!=""){
		var a=parseInt(p);
		if(a>0&&a<=i)
		window.location.href="../content"+cid+"_"+p+".html";
		if(a>i)
		window.location.href="../content"+cid+"_"+1+".html";
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
	function queryOfPreview(contentId, category){
   		 window.location.href="../content/queryOfPreview.action?contentId="+contentId+"&date="+new Date();
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
                <h2>信用查询</h2>
                <ul>
                    <li><a href="seach.html"  >法人信用查询</a></li>
                    <li style="display:none"><a href="fqyseach.html" >非企业信用查询</a></li>
                    <li><a href="personalseach.html" class="current">重点人群信用查询</a></li>
                    <li><a href="xyhcm.html">查询码核查</a></li>
                    <li><a href="qycheck.html">法人信用核查</a></li>
                    <li><a href="mycheck.html">重点人群信用核查</a></li>
                </ul>
            </div>
        	<div class="left_link mt10">
                <a href="qycomplain.html" class="bg_co2"><img src="images/icon2.png" /><em>异议申诉</em></a>
            </div>
            
        </div>
        <!--left over-->
        <!--right begin-->
        <div class="right f_r">
            <div style="display:none" class="right_tit"><span>当前位置： 信用查询 > <em>重点人群信用查询</em></span></div>
            <div class="pad10 pad_t50">
            <form action="../seach/personalSeachList.action" method="post" id="personForm">
            <input name="template" type="hidden" value="2"/>
                  <ul class="forminfo">
                    <li>
                  <label>姓名</label>
                  <input name="name" id="name" type="text" class="dfinput" />
                </li>
                <li>
                  <label>注册证书号</label>
                  <input name="sfzhm" id="sfzhm" type="text" class="dfinput" />
                </li>
                <li style="display:none">
                  <label>执业类别</label>
                  <input name="zyzhm" id="zyzhm" type="text" class="dfinput" />
                </li>
                <li>
                  <label>验证码</label>
                  <table style="border-collapse:collapse;border-spacing:0;">
                      <tr>
	                      <td><input name="" type="text" id="validCode0" style="border: 1px solid #e2e2e2;height: 30px;line-height: 30px;text-indent: 5px;width: 120px;" value="" /></td>
	                      <td><img style="cursor: pointer;height:35px;vertical-align:middle;"src="../CodeServlet.code" onClick="this.src='../CodeServlet.code?'+new Date().getTime();"/></td>
	                      <td style="color:red">*注:请输入验证码计算结果数字，如出现负数请输入负数</td>
                      <tr>
                  </table>
                 <!-- <input id="checkCodeID0" size="3" type="text" style="color: Red;font-family: Arial;font-style: italic;font-weight: bolder;letter-spacing: 3px;padding: 2px 3px;width:30;border:0;cursor:pointer; height:23; background-image: url('../html/images/QQ.jpg');font-size:18px" readonly="readonly" onclick="createCode(0)">-->
                </li>
                    <li>
                      <label>&nbsp;</label>
                      <input name="" onClick="seachList(0);" type="button" class="btn" value="查 询"/>
                  <input name="" onclick="personalReset();" type="button" class="btn" value="重置"/>
                    </li>
                  </ul>
                  </form>
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
<script type="text/javascript">
	if(window.name != "bencalie"){
	     location.reload();
	     window.name = "bencalie";
	}
	else{
	     window.name = "";
	}
</script>
