<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${sysBackTitle}</title>
<style type="text/css">
.yx-rotaion{ margin-top: 0; margin-right: auto; margin-bottom: 0; margin-left: auto; }
.yx-rotaion-btn,.yx-rotaion-title,.yx-rotation-focus,.yx-rotation-t,.yx-rotaion-btn{position:absolute}
.yx-rotation-title{position:absolute;width:100%;height:40px;line-height:40px;background:#000;filter:alpha(opacity=40);-moz-opacity:0.4;-khtml-opacity:0.4;opacity:0.4;left:0;bottom:0;_bottom:-1px;z-index:1}
.yx-rotation-t{color:#fff;font-size:16px;font-family:microsoft yahei;z-index:2;bottom:0;left:10px;line-height:40px}
.yx-rotation-focus span,.yx-rotaion-btn span{background:url(${pageContext.request.contextPath}/html/images/ico.png) no-repeat;display:block;}
.yx-rotation-focus{height:40px;line-height:40px;right:20px;bottom:0;z-index:2}
.yx-rotation-focus span{width:12px;height:12px;line-height:12px;float:left;margin-left:5px;position:relative;top:14px;cursor:pointer;background-position:-24px -126px;text-indent:-9999px}
.yx-rotaion-btn{width:100%;height:41px;top:50%;margin-top:-20px;}
.yx-rotaion-btn span{width:41px;height:41px;cursor:pointer;filter:alpha(opacity=30);-moz-opacity:0.3;-khtml-opacity:0.3;opacity:0.3;position:relative}
.yx-rotaion-btn .left_btn{background-position:-2px -2px;float:left;left:10px}
.yx-rotaion-btn .right_btn{background-position:-2px -49px;float:right;right:10px}
.yx-rotaion-btn span.hover{filter:alpha(opacity=80);-moz-opacity:0.8;-khtml-opacity:0.8;opacity:0.8}
.yx-rotation-focus span.hover{background-position:-10px -126px}
.rotaion_list{width:0;height:0;overflow:hidden;}
</style>
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

/**
 * 幻灯片
 */
(function($){   
    $.fn.extend({     
         yx_rotaion: function(options) {   
            //默认参数
            var defaults = {
                 /**轮换间隔时间，单位毫秒*/
                 during: 3000,
                 /**是否显示左右按钮*/
                 btn: true,
                 /**是否显示焦点按钮*/
                 focus: false,
                 /**是否显示标题*/
                 title: false,
                 /**是否自动播放*/
                 auto: true               
            }        
            var options = $.extend(defaults, options);   
            return this.each(function(){
                var o = options;   
                var curr_index = 0;
                var $this = $(this);                
                var $li = $this.find("li");
                var li_count = $li.length;
                $this.css({position:'relative',overflow:'hidden',width:$li.find("img").width(),height:$li.find("img").height()});
                $this.find("li").css({position:'absolute',left:0,top:0}).hide();
                $li.first().show();
                $this.append('<div class="yx-rotaion-btn"><span class="left_btn"><\/span><span class="right_btn"></span><\/div>');
                if(!o.btn) $(".yx-rotaion-btn").css({visibility:'hidden'});
                if(o.title) $this.append(' <div class="yx-rotation-title"><\/div><a href="" class="yx-rotation-t" target="blank"><\/a>');
                if(o.focus) $this.append('<div class="yx-rotation-focus"><\/div>');
                var $btn = $(".yx-rotaion-btn span"),$title = $(".yx-rotation-t"),$title_bg = $(".yx-rotation-title"),$focus = $(".yx-rotation-focus");
                //如果自动播放，设置定时器
                if(o.auto) var t = setInterval(function(){$btn.last().click()},o.during);
                $title.text($li.first().find("img").attr("alt"));   
                $title.attr("href",$li.first().find("a").attr("href"));             
                
               // 输出焦点按钮
               for(i=1;i<=li_count;i++){
                 $focus.append('<span>'+i+'</span>');
               }
               // 1.8版本及之前版本，兼容IE6透明图片（jQuery1.8版可以用“$.browser” jQuery1.9版以后改成了“$.support”）
               /*if($.browser.msie && $.browser.version == "6.0" ){
                  $btn.add($focus.children("span")).css({backgroundImage:'url(images/ico.gif)'});
               }*/
               // 1.9版本之后兼容IE6透明图片
               if('undefined' == typeof(document.body.style.maxHeight)){
                   $btn.add($focus.children("span")).css({backgroundImage:'url(images/ico.gif)'});
               }
               var $f = $focus.children("span");
               $f.first().addClass("hover");
               // 鼠标覆盖左右按钮设置透明度
               $btn.hover(function(){
                  $(this).addClass("hover");
               },function(){
                  $(this).removeClass("hover");
               });
               //鼠标覆盖元素，清除计时器
               $btn.add($li).add($f).hover(function(){
                if(t) clearInterval(t);
               },function(){
                if(o.auto) t = setInterval(function(){$btn.last().click()},o.during);
               });
               //鼠标覆盖焦点按钮效果
               $f.bind("mouseover",function(){
                 var i = $(this).index();
                 $(this).addClass("hover");
                 $focus.children("span").not($(this)).removeClass("hover");
                 $li.eq(i).fadeIn(300);
                 $li.not($li.eq(i)).fadeOut(300);   
                 $title.text($li.eq(i).find("img").attr("alt"));
                 curr_index = i;
               });
               //鼠标点击左右按钮效果
               $btn.bind("click",function(){
                 $(this).index() == 1?curr_index++:curr_index--;
                 if(curr_index >= li_count) curr_index = 0;
                 if(curr_index < 0) curr_index = li_count-1;
                 $li.eq(curr_index).fadeIn(300);
                 $li.not($li.eq(curr_index)).fadeOut(300);  
                 $f.eq(curr_index).addClass("hover");
                 $f.not($f.eq(curr_index)).removeClass("hover");
                 $title.text($li.eq(curr_index).find("img").attr("alt"));
                 $title.attr("href",$li.eq(curr_index).find("a").attr("href")); 
               });
 
            });   
        }   
    });   
       
})(jQuery);
$(document).ready(function(){
	$(".yx-rotaion").yx_rotaion({auto:true});
});
</script>



    <div class="detailPage">
        <div class="positionBg">
            <span class="txt">当前位置：</span>
        </div>
        <div class="detailContent">
            <h1>${c.title }</h1>
            <div class="detailLine"></div>
            <div class="textM">
            【 发稿时间：<fmt:formatDate value="${c.releaseTime}" pattern="yyyy-MM-dd HH:mm:ss"/> 】
            </div>
            <div class="yx-rotaion">
                <ul class="rotaion_list">
                    <c:forEach var="pic" items="${pic }">
                        <li><img src="${pic.imgPath }" /></li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
    
    
    
    
<div class="foot">Copyright 2013苏州市军休干部服务管理网 All Rights Reserved   您是本站第<span class="bold red1">200000</span>位客人 <br />
  主办单位：苏州市民政局
  <br />
  技术支持：苏州市无线应用中心</div>

</div>
</body>
</html>