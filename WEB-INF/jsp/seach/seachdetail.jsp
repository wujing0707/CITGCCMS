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
<title>园区信用</title>
<link type="text/css" href="<%=basePath %>html/css/common.css" rel="stylesheet" />
<script type="text/javascript" src="<%=basePath %>html/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="<%=basePath %>html/js/jquery.idTabs.min.js"></script>

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
    createCode(0);
});
function show(str){
	if(str!=""){
		var id=document.getElementById(str+"_0").value;
		window.location.href="<%=basePath %>html/content"+id+"_1.html"; 
	}
}
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
  if(inputCode.length <=0){   
      alert("请输入验证码！");   
  }   
  else if(inputCode.toUpperCase()!=checkCode){   
     alert("验证码输入错误！");   
  //   createCode(i);//刷新验证码   
  }else{   
    window.location.href="../seach/seachdetail.action?zzjgdm="+zzjgdm+"&gszch="+gszch;   
  }    
}   
</script>

</head>

<body>
<!--top begin-->
<div class="top">
	<div class="wrap topnr">
    	<div class="logo f_l"><img src="<%=basePath %>html/images/logo.png" /></div>
        <div class="top_right f_r"><img src="<%=basePath %>html/images/top_right.png" /></div>
    </div>
</div>
<!--top over-->

<!--nav begin-->
<div class="nav">
    <ul class="wrap tabs">
        <li><a href="<%=basePath %>html/index.html" class="">首页</a></li>
        <c:if test="${not empty listChannel}">
        <c:forEach items="${listChannel}" var="channel" varStatus="vs">  
        <c:if test="${(channel.channelId!=1)&&(channel.channel.channelId==1)}">
        <li><a href="javascript:void(0)" class="on" onclick='show("${channel.channelId}")'>${channel.name}</a>
            <ul class="dropdown">
            <c:forEach items="${channel.channels}" var="cc"  varStatus="v">
       		<c:if test="${not empty cc}">
       		<input type="hidden" id="${channel.channelId}_${v.index}" value="${cc.channelId}">
                <li><a href="<%=basePath %>html/content${cc.channelId}_1.html">${cc.name}</a></li>
        	</c:if>
            </c:forEach>
            </ul>
        </li>
        </c:if>
        </c:forEach>
        </c:if>
    </ul>
</div>
<!--nav over-->

<!--content begin-->
<div class="wrap mt10 clear">
    <!--left begin-->
    <div class="leftbox f_l">
        <div class="left_menu box_border ">
            <div class="left_tit"><em></em>信用查询</div>
            <ul>
                <li><a href="<%=basePath %>html/content_1.html">企业信用查询</a></li>
            </ul>
        </div>
        
        <div class="box_border mt10">
        	<div class="left_tit left_seach"><em></em>企业信用查询</div>
            <div class="left_small">
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
                  <input name="" size="1" type="text" id="validCode0" class="dfinput w90 f_l" value="" />
                  <input id="checkCodeID0" size="2" type="text" style="color: Red;font-family: Arial;font-style: italic;font-weight: bolder;letter-spacing: 3px;margin-left: -4px !important;padding: 2px 3px;width:30;border:0;cursor:pointer; height:23; background-image: url('../html/images/QQ.jpg');font-size:18px" readonly="readonly" onclick="createCode(0)" >
                </li>
                <li>
                  <label>&nbsp;</label>
                  <input name="" type="button" class="seach_btn" onclick="validate(0);" onmouseover="this.className='seach_btn1'" onmouseout="this.className='seach_btn'" value="查 询"/>
                </li>
              </ul>
                
            </div> 
        </div>
        
    </div>
    <!--left over-->
    <!--right begin-->
    <div class="right box_border f_r">
    	<div class="tit1 right_tit"><b>企业信用详细</b><span>当前位置：<a href="#" target="_blank">首页</a> > 信用查询 > <a href="#" target="_blank">企业信用查询</a> > 企业信用详细</span></div>
        <div class="pad10">
        <div class="z_title">${companyName}</div>
        <div class="tab_tit"><span>基础信息</span></div>
          <table cellspacing="0" cellpadding="0" class="tablelist tablelist0" id="">
            <tbody>
             <c:forEach items="${map}" var="entry" varStatus="v"> 
             <c:if test="${v.count%2==1}">
              <tr>
                <th width="15%">${entry.key}</th>
                <td>${entry.value}</td>
              </c:if>
              <c:if test="${v.count%2==0}">
                <th width="15%">${entry.key}</th>
                <td>${entry.value}</td>
              </tr>
               </c:if>
               <c:if test="${v.count%2==1&&v.last==true}">
               </tr>
               </c:if>
              </c:forEach> 
            </tbody>
          </table>
          
            <div class="tab_tit mt50"><span>信用信息</span><em>（包含：行政审批信息、失信行为信息、荣誉表彰信息、履行约定信息、参保信息、其他信息）</em></div>
            <table class="tablelist ">
                <thead>
                </thead>
                <tbody>
                <tr>
                <th width="10%">序号</th>
                <th width="65%">数据分类</th>
                <th width="25%">信息量</th>
                </tr>
                <c:forEach items="${map1}" var="entry"  varStatus="v">
                <tr>
                <td class="tc">${v.count}</td>
                <td>${entry.key}</td>
                <td>共${entry.value}条信息</td>
                </tr> 
                </c:forEach>
                </tbody>
            </table>
                
            
        </div> 
        
        
    </div>
    <!--right over-->
</div>
<!--content over-->

<!--footer begin-->
<div class=" wrap mt10 link gradient clear">
    <div class="link_t">友情链接</div>
    <ul class="linkother">
        <li><a href="#">中国苏州</a></li>
        <li><a href="#">苏州工业园区</a></li>
        <li><a href="#">诚信江苏</a></li>
        <li><a href="#">诚信苏州</a></li>
    </ul>
</div>
<div class="bottom mt10">
    <div class=" wrap tc">
        <p>主办单位：************** &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;承办单位：**************  </p>
        <p>技术支持：江苏中集科技有限公司</p>
    </div>
</div>
<!--footer over-->
    
</body>
</html>

