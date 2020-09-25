<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>园区信用</title>
<link type="text/css" href="css/common.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
<script>
$(function () {
    var $dropdowns = $(".tabs .dropdown");
    var $ons = $(".tabs>li .on");
    var tabTimer = null;
    $(".tabs").on("mouseover",".on",function(e){
        var $this = $(this);
        clearTimeout(tabTimer);
       $dropdowns.hide();
        $ons.removeClass("cover");
        $this.addClass("cover");
        $this.siblings(".dropdown").show();
    }).on("mouseout",".on",function(event){
        event.preventDefault();
        var $this = $(this);
        tabTimer = setTimeout(function(){
            $this.removeClass("cover");
            $this.siblings(".dropdown").hide();
        }, 300);
    });

    $(".tabs").on("mouseover",".dropdown",function(event){
        var $this = $(this);
        clearTimeout(tabTimer);
         $this.siblings(".on").addClass("cover");
         $this.show();
    }).on('mouseleave', '.dropdown', function(event) {
        event.preventDefault();
        var $this = $(this);
        $this.hide();
        $this.siblings(".on").removeClass("cover");
    });
});
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
function show(str,sss,path){
	$(this).addClass("cover").parent().siblings().find("a").removeAttr("class");
	if(sss!=""){
//		document.getElementById(str+"_"+sss).className = 'cover';
		window.location.href=path+sss+"_1.html"; 
	}else{
		var id=document.getElementById(str+"_0").value;
   //		document.getElementById(str).className = 'cover';
		window.location.href=path+id+"_1.html"; 
	}
	var oo=$("#lll").children();
	for(var i=0;i<oo.length;i++){
		oo[i].style.display="none";
	}
	document.getElementById(str).style.display="";
	document.getElementById("dd").style.display="";
}
</script>
</head>
<body onLoad="createCode(0);createCode(1);createCode(2);createCode(3);">
<!--top begin-->
<div class="top">
	<div class="wrap topnr">
    	<div class="logo f_l"><img src="images/logo.png" /></div>
        <div class="top_right f_r"><img src="images/top_right.png" /></div>
    </div>
</div>
<div class="nav">
    <ul id="test" class="wrap tabs">
        <li><a href="index.html" class="">首页</a></li>
        <#list ListChannel as channel>
        <#if ListChannel??&&channel??>
        <#if channel.channelId!=1&&channel.channel.channelId==1>
        <li><a href="javascript:void(0)" id="${channel.channelId}" class="on" onclick='show("${channel.channelId}","","content")'>${channel.name!}</a>
           <#if channel.channels??>
	            <ul class="dropdown">
		        	<#list channel.channels as cc>
		        	<#if (cc.status)??&&cc.status==0>
		        	<input type="hidden" id="${channel.channelId}_${cc_index}" value="${cc.channelId}">
	                <li><a href="javascript:void(0)" id="${channel.channelId}_${cc.channelId}" onclick='show("${channel.channelId}","${cc.channelId}","content")'>${cc.name!}</a></li>
	                </#if>
		        	</#list>
	            </ul>
            </#if>
        </li>
        </#if>
        </#if>
        </#list>
    </ul>
</div>  
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
    <script language="javascript" type="text/javascript">  
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
     function validate (i){  
       var checkCode = document.getElementById("checkCodeID"+i).value;  
       var inputCode = document.getElementById("validCode"+i).value;
       var zzjgdm=$('#zzjgdm').val();   
       var gszch=$('#gszch').val();   
       var companyname=$('#companyname').val();  
       if(inputCode.length <=0){   
           alert("请输入验证码！");   
       }   
       else if(gszch.length <=0&&zzjgdm.length <=0){   
          alert("组织机构代码或工商注册号不能为空！");   
       }
       else if(inputCode.toUpperCase()!=checkCode){   
          alert("验证码输入错误！");   
       //   createCode(i);//刷新验证码   
       }else{   
         window.location.href="../seach/seachdetail.action?zzjgdm="+zzjgdm+"&gszch="+gszch+"&companyname="+companyname;   
       }    
 }   
</script>  
