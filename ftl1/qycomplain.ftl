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
       var name=$('#name').val();   
       var sfzhm=$('#sfzhm').val();   
       var zyzhm=$('#zyzhm').val();   
       if(name==""&&sfzhm==""&&zyzhm==""){
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
        <ul></ul>
    </div>
    
</div>
<!--header over-->
<!--content begin-->
<div class="wrap mt5">
    <!--left begin-->
    <div class="leftbox f_l">
        <div class="left_menu">
            <ul>
                <li><a href="http://172.25.106.6:8080/complain/queryComplains.action?UTYPE=C&IDCODE=CCCC23952dfsfdsds" target="mainFrame">企业申诉列表</a></li>
                <li><a href="http://172.25.106.6:8080/complain/queryComplains.action?UTYPE=P&IDCODE=PPPPP23952dfsfdsds" target="mainFrame">个人申诉列表</a></li>
                <li><a href="http://172.25.106.6:8080/complain/editComplain.action?UTYPE=C&IDCODE=CCCC23952dfsfdsds" target="mainFrame">企业异议申诉</a></li>
                <li><a href="http://172.25.106.6:8080/complain/editComplain.action?UTYPE=P&IDCODE=PPPPP23952dfsfdsds" target="mainFrame">个人异议申诉</a></li>
            </ul>
        </div>
        
        <div class="mt5 left_seach">
        	<h2><em></em>企业信用查询</h2>
              <ul class="forminfo">
                <li>
                  <label>组织机构代码</label>
                  <input id="zzjgdm" name="" type="text" class="dfinput" />
                </li>
                <li>
                  <label>工商注册号</label>
                  <input id="gszch" name="" type="text" class="dfinput" />
                </li>
                <li>
                  <label>验证码</label>
                  <input name="" type="text" id="validCode3" class="dfinput w60 f_l" value="" />
                  <input id="checkCodeID3" size="3" type="text" style="width:60;border:0;cursor:pointer; height:25;font-size:18px" readonly="readonly" onclick="createCode(3)" class="code">
                </li>
                <li>
                  <label>&nbsp;</label>
                  <input name="" type="button" class="left_btn" onclick="validate(3,1);" onmouseover="this.className='left_btn1'" onmouseout="this.className='left_btn'" value="查 询"/>
                </li>
              </ul>
        </div>
        
    </div>
    <!--left over-->
    <!--right begin-->
    <div class="right f_r">
        <div class="pad10">
            <ul class="forminfo">
            <iframe src="http://172.25.106.6:8080/complain/queryComplains.action?UTYPE=C&IDCODE=CCCC23952dfsfdsds" name="mainFrame" frameborder="0" marginheight="0" marginwidth="0" height="650" width="100%"></iframe>
           </ul>
        </div> 
    </div>
    <!--right over-->
</div>
<!--content over-->

<!--登录窗口begin -->
<div class="tip" style="display:none">
    <div class="tiptop"><span>登录</span><a></a></div>
    
    <div class="tipnr tc">
        <p>请先登录再进行申诉！</p>
          <ul class="forminfo">
            <li>
              <label>用户名</label>
              <input name="" type="text" class="dfinput w200" />
            </li>
            <li>
              <label>密码</label>
              <input name="" type="text" class="dfinput w200" />
            </li>
            <li>
            <input name="" type="button"  class="sure" value="确定" />&nbsp;
            <input name="" type="button"  class="cancel" value="取消" />
            </li>
          </ul>
    </div>
</div>
<!--登录窗口over -->
<!--提示窗口begin -->
<div class="tip">
    <div class="tiptop"><span>提示信息</span><a></a></div>
    
    <div class="tipnr tc">
        <p>您的申诉已提交成功！请耐心等待！</p>
    </div>
</div>
<!--提示窗口over -->
    
</body>
</html>
