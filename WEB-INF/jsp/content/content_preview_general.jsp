<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${sysBackTitle}</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/html/css/style.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>
</head>
<body>
<div id="container">
<div id="top"><img src="${pageContext.request.contextPath}/html/images/top.jpg" width="990" height="162" /></div>
<div class="menu">
<li><a name="menu" href="javascript: void(0);">首页</a></li><li class="menuLine"></li>
<li><a name="menu" href="javascript: void(0);">政务公开</a></li><li class="menuLine"></li>
<li><a name="menu" href="javascript: void(0);">政策法规</a></li><li class="menuLine"></li>
<li><a name="menu" href="javascript: void(0);">军休动态</a></li><li class="menuLine"></li>
<li><a name="menu" href="javascript: void(0);">军休风采</a></li><li class="menuLine"></li>
<li><a name="menu" href="javascript: void(0);">健康保健</a></li><li class="menuLine"></li>
<li><a name="menu" href="javascript: void(0);">军休内刊</a></li><li class="menuLine"></li>
<li><a name="menu" href="javascript: void(0);">留言咨询</a></li><li class="menuLine"></li>
<li><a name="menu" href="javascript: void(0);">快速通道</a></li><li class="menuLine"></li>
<li><a name="menu" href="javascript: void(0);">助老上网</a></li></div>
<div class="sonMenu">
<div name="top_SecondMenu" style="padding-left:20px;"><span id="datetime">2014年2月13日 星期四</span> 您好,欢迎访问苏州市军休网!</div>
<div name="top_SecondMenu" style="padding-left:80px; display:none;"><a href="javascript: void(0);" class="select">机构概况</a> | <a href="javascript: void(0);">办事指南</a></div>
<div name="top_SecondMenu" style="padding-left:160px; display:none;"><a href="javascript: void(0);" class="select">国家政策</a> | <a href="javascript: void(0);">地方政策</a></div>
<div name="top_SecondMenu" style="padding-left:220px; display:none;"><a href="javascript: void(0);" class="select">理论学习</a> | <a href="javascript: void(0);">文体活动</a> | <a href="javascript: void(0);">工作动态</a></div>
<div name="top_SecondMenu" style="padding-left:80px; display:none;"><a href="javascript: void(0);" class="select">军休干部书画作品赏析</a> | <a href="javascript: void(0);">军休干部摄影作品赏析</a> | <a href="javascript: void(0);">军休干部文学作品赏析</a> | <a href="javascript: void(0);">军休干部先进事迹</a> | <a href="javascript: void(0);">关心下一代工作</a></div>
<div name="top_SecondMenu" style="padding-left:410px; display:none;"><a href="javascript: void(0);" class="select">保健常识</a> | <a href="javascript: void(0);">疾病自测</a> | <a href="javascript: void(0);">健康评估</a></div>
</div>
<div class="info"><div class="weather"><span class="red1">天气预报：</span><iframe width="450" scrolling="no" height="20" frameborder="0" allowtransparency="true" src="http://i.tianqi.com/index.php?c=code&id=1&icon=1&wind=1&num=1"></iframe></div>
<div class="searchBox"><span class="red1">站内搜索：</span>
 <input name="textfield" type="text" id="textfield" value="输入关键字" />
  <select name="select" id="select">
    <option>全部</option>
  </select>
  <input type="submit" name="button" id="button" value="  " class="btnSearch" />
</div>
</div>

<script type="text/javascript">
$(function(){
    $("a[name=menu]").mouseover(function() {
        $(this).attr("class", "current");
        $("a[name=menu]").not(this).removeClass("current");
        var index = $("a[name=menu]").index(this);
        if (index < 1 || index > 5)
            index = 0;
        
        showSecondMenu(index);
    });
    
    var now = new Date();
    var str = now.getFullYear() + "年";
    str += (now.getMonth() + 1) + "月";
    str += now.getDate() + "日";
    str += " 星期" + getChineseWeekday(now.getDay());
    $("#datetime").html(str);
});

function showSecondMenu(index) {
    $("div[name=top_SecondMenu]").each(function(i,elem) {
        if (index == i)
            $(this).css("display", "block");
        else
            $(this).css("display", "none");
    });
}

function getChineseWeekday(day) {
    switch (day) {
        case 0: return '天';
        case 1: return '一';
        case 2: return '二';
        case 3: return '三';
        case 4: return '四';
        case 5: return '五';
        case 6: return '六';
        default: return '';
    }
}
</script>



    <div class="detailPage">
        <div class="positionBg">
            <span class="txt">当前位置：</span>
        </div>
        <div class="detailContent">
            <h1>${c.title }</h1>
            <div class="detailLine"></div>
            <div class="textM">
            【 发稿时间：<fmt:formatDate value="${c.releaseTime}" pattern="yyyy-MM-dd"/> 】
            【作者：${c.author}】
            【阅览次数：${c.viewTimes}】
            </div>
            ${txt }
        </div>
    </div>
    
    
    
    
<div class="foot">Copyright 2013苏州市军休干部服务管理网 All Rights Reserved   您是本站第<span class="bold red1">200000</span>位客人 <br />
  主办单位：苏州市民政局
  <br />
  技术支持：苏州市无线应用中心</div>

</div>
</body>
</html>