<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>苏州军休网</title>
<link href="/html/css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/html/css/yx_rotaion.css"/>
<link rel="stylesheet" type="text/css" href="/html/css/div_content.css"/>
<script type="text/javascript" src="/html/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="/html/js/jquery.yx_rotaion.js"></script>
<script type="text/javascript" src="/html/js/jquery.notice_scroll.js"></script>
<script type="text/javascript" src="/html/js/selectCheck.js"></script>
<script type="text/javascript" src="/html/js/swfobject_modified.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    $(".yx-rotaion").yx_rotaion({auto:true});
    
    /* $("#yqlj_pic").imgscroll({
        speed: 40,    // 图片滚动速度
        amount: 0,    // 图片滚动过渡时间
        width: 1,     // 图片滚动步数
        dir: "left"   // "left" 或 "up" 向左或向上滚动
    }); */
    $("#shsy_scroll").imgscroll({
        speed: 30,    // 图片滚动速度
        amount: 0,    // 图片滚动过渡时间
        width: 1,     // 图片滚动步数
        dir: "left"   // "left" 或 "up" 向左或向上滚动
    });
    $("#tzgg_scroll").imgscroll({
        speed: 50,    // 图片滚动速度
        amount: 0,    // 图片滚动过渡时间
        width: 1,     // 图片滚动步数
        dir: "up"     // "left" 或 "up" 向左或向上滚动
    });
    $("#sr_scroll").imgscroll({
        speed: 80,    // 图片滚动速度
        amount: 0,    // 图片滚动过渡时间
        width: 1,     // 图片滚动步数
        dir: "up"     // "left" 或 "up" 向左或向上滚动
    });
    $.post("/home/index.action", {}, function(data) {});
});

function divChange(p){
	switch(p){
	case '1':
		$('#jkbjMore').attr('href', '/html/jkbj_jbzc_list.shtml');
		$('#ul_jbzc').show();
		$('#ul_jkpg').hide();
		$('#ul_jkcs').hide();
	    $($('#ul_tab li:nth-child(odd)')[2].children).attr('class', 'select');
	    $($('#ul_tab li:nth-child(odd)')[3].children).attr('class', '');
	    $($('#ul_tab li:nth-child(odd)')[4].children).attr('class', '');
		break;
	case '2':
		$('#jkbjMore').attr('href', '/html/jkbj_jkpg_list.shtml');
		$('#ul_jkpg').show();
		$('#ul_jbzc').hide();
		$('#ul_jkcs').hide();
	    $($('#ul_tab li:nth-child(odd)')[3].children).attr('class', 'select');
	    $($('#ul_tab li:nth-child(odd)')[2].children).attr('class', '');
	    $($('#ul_tab li:nth-child(odd)')[4].children).attr('class', '');
		break;
	case '3':
		$('#jkbjMore').attr('href', '/html/bjcsh.shtml');
		$('#ul_jkcs').show();
		$('#ul_jbzc').hide();
		$('#ul_jkpg').hide();
	    $($('#ul_tab li:nth-child(odd)')[4].children).attr('class', 'select');
	    $($('#ul_tab li:nth-child(odd)')[3].children).attr('class', '');
	    $($('#ul_tab li:nth-child(odd)')[2].children).attr('class', '');
		break;
	}
}

function divChange1(p){
	switch(p){
	case '1':
		$('#jxfcMore').attr('href', '/html/zhrsy.shtml');
		$('#ul_zrsy').show();
		$('#ul_gxxyd').hide();
	    $($('#ul_tab li:nth-child(odd)')[0].children).attr('class', 'select');
	    $($('#ul_tab li:nth-child(odd)')[1].children).attr('class', '');
		break;
	case '2':
		$('#jxfcMore').attr('href', '/html/gxxyd.shtml');
		$('#ul_gxxyd').show();
		$('#ul_zrsy').hide();
	    $($('#ul_tab li:nth-child(odd)')[1].children).attr('class', 'select');
	    $($('#ul_tab li:nth-child(odd)')[0].children).attr('class', '');
		break;
	}
}
</script>
</head>

<body>
<div id="container">
<!--#include file="top.shtml" -->
<div class="content">
<!-- <div class="iNews"><img src="/html/images/iNewPic1.jpg" width="324" height="288" /><div class="textM"><a href="#" class="newsH">副市长***到市军休中立调研工作</a></div></div> -->
<div class="iNews">
<div class="yx-rotaion">
<ul class="rotaion_list">
	<#list topLine as con>
	 	<li><a href="/html/${con.contentId?c!}.shtml" target="blank"><img src="${con.titleImg!}" width="324" height="315" alt="<#if con.title?length gt 13>${con.title?substring(0,11)!}...<#else>${con.title!}</#if>" /></a></li>
	</#list>
    </ul>
</div>
</div>

<div class="iArea1" style="background:url(/html/images/iArea1Bg.jpg) no-repeat;">
<div class="iArea1Top"><span class="more"><a href="/html/jyzhl_1.shtml" class="moreH">更多>></a></span></div>
<ul>
<#list education as con>
 	<li><span class="floatR">[${con.releaseTime?string('yyyy-MM-dd')!}]</span><a href="/html/${con.contentId?c!}.shtml" target="blank"><#if con.title?length gt 20>${con.title?substring(0,17)!}...<#else>${con.title!}</#if></a></li>
</#list>
</ul>
</div>

<div class="iNotice">
<div class="iNoticeTop"><span class="txt">通知公告</span><span class="more"><a href="/html/tzhtg_1.shtml" class="moreH">更多>></a></span></div>
<div class="scrolltop" id="tzgg_scroll">
<ul>
<#list notice as con>
 	<li><a href="/html/${con.contentId?c!}.shtml" target="blank"><#if con.title?length gt 7>${con.title?substring(0,7)!}...<#else>${con.title!}</#if><span class="floatR">[${con.releaseTime?string('yyyy-MM-dd')!}]</span></a></li>
</#list>
	<li style="background:none">&nbsp;</li>
	<li style="background:none">&nbsp;</li>
	<li style="background:none">&nbsp;</li>
	<li style="background:none">&nbsp;</li>
	<li style="background:none">&nbsp;</li>
	<li style="background:none">&nbsp;</li>
	<li style="background:none">&nbsp;</li>
	<li style="background:none">&nbsp;</li>
</ul>
</div>
</div> 
<div class="content" style="margin-top:10px;">
<div class="iLeft">
<div class="quickBox marginB9">
	<div class="quickBoxTop">
	<div class="quickTxt">快速通道</div></div>
	<div class="leftQuickRoad">
	<ul><li><a href="/html/zhcjd.shtml"></a></li><li class="space"></li><li><a href="/html/ybdd.shtml"></a></li><li><a href="/html/bmfw.shtml"></a></li><li class="space"></li><li><a href="/html/shqlj.shtml"></a></li><li><a href="http://www.1183300.com/main.jsp" target="blank"></a></li><li class="space"></li><li><a href="http://www.zongheng.com/" target="blank"></a></li></ul></div>
</div>
<div class="quickBox marginB9">
<div class="quickBoxTop">
<div class="buildingTxt">军休干部服务和管理机构</div></div>
<ul class="buildingList"><li><a href="/html/jxs.shtml?groupId=2">苏州市军休中心<b>(点击进入)</b></a></li><li><a href="/html/jxs.shtml?groupId=3">苏州市盘溪军休所<b>(点击进入)</b></a></li><li><a href="/html/jxs.shtml?groupId=4">苏州市城中军休所<b>(点击进入)</b></a></li><li><a href="/html/jxs.shtml?groupId=5">苏州市里河军休所<b>(点击进入)</b></a></li><li><a href="/html/jxs.shtml?groupId=6">苏州市胥江军休所<b>(点击进入)</b></a></li><li><a href="/html/jxs.shtml?groupId=7">苏州市梅花军休所<b>(点击进入)</b></a></li></ul>
</div><div class="quickBox">
<div class="quickBoxTop">
<div class="houseTxt">社会化服务机构</div></div>
<div class="houseTitle"><div class="txt">养老机构</div></div><ul class="houseList"><li><a href="/html/syljg_szsshflzy.shtml" target="blank">苏州市社会福利总院<b>(点击进入)</b></a></li><li><a href="/html/syljg_pjxyhlngy.shtml" target="blank">平江夕阳红老年公寓<b>(点击进入)</b></a></li><li><a href="/html/syljg_pjlngy.shtml" target="blank">平江老年公寓<b>(点击进入)</b></a></li><li><a href="/html/syljg_clqjly.shtml" target="blank">沧浪区敬老院<b>(点击进入)</b></a></li><li><a href="/html/syljg_clqysjy.shtml" target="blank">沧浪区银色家园<b>(点击进入)</b></a></li><li><a href="/html/syljg_jcqlngy.shtml" target="blank">金阊区老年公寓<b>(点击进入)</b></a></li><li><a href="/html/syljg_szxyhly.shtml" target="blank">苏州心圆护理院<b>(点击进入)</b></a></li><li><a href="/html/syljg_szyslngy.shtml" target="blank">苏州阳山老年公寓<b>(点击进入)</b></a></li><li><a href="/html/syljg_szaxhly.shtml" target="blank">苏州爱心护理院<b>(点击进入)</b></a></li></ul>
<div class="houseTitle"><div class="txt">居家养老</div></div>
<ul class="houseList"><li><a href="/html/jjyl.shtml" target="blank">居家养老服务中心一览表<b>(点击进入)</b></a></li></ul>
</div>
</div>

<div class="iRight">
<script type="text/javascript">
function happyBirthday() {
	
}
</script>
<div class="iBirthday">
<div class="scrollbirth" id="sr_scroll">
<ur>
</ul>
</div>
<div class="month"></div>
</div>


<div class="iNotice" style="height:118px; float:left; margin-left:5px;">
	<div class="iNoticeTop"><span class="video">&nbsp;</span><span class="more"><a href="/html/jxwhsp_1.shtml" class="moreH">更多>></a></span></div>
	<div class="horse"><img src="/html/images/horse.jpg" width="212" height="76" /></div>
</div>

<div class="iArea2 padR10">
  <div class="jxTop"><span class="more"><a href="/html/xxjy.shtml" class="moreH">更多>></a></span></div>
<ul class="ruleList">
<#list dynamic as con>
 	<li><span class="floatR">[${con.releaseTime?string('yyyy-MM-dd')!}]</span><a href="/html/${con.contentId?c!}.shtml" target="blank"><#if con.title?length gt 15>${con.title?substring(0,15)!}...<#else>${con.title!}</#if></a></li>
</#list>
</ul>
</div>

<div class="iArea2">
<div class="ruleTop"><span class="more"><a href="/html/gjzhc.shtml" class="moreH">更多>></a></span></div>
<ul class="ruleList">
<#list policy as con>
 	<li><span class="floatR">[${con.releaseTime?string('yyyy-MM-dd')!}]</span><a href="/html/${con.contentId?c!}.shtml" target="blank"><#if con.title?length gt 15>${con.title?substring(0,15)!}...<#else>${con.title!}</#if></a></li>
</#list>
</ul>
</div>

<div class="iArea2  padR10">
<div class="fcTop">
<ul id="ul_tab" class="iTab">
	<li><a href="javascript:divChange1('1');">军休文化</a></li>
	<li>|</li>
	<li><a style="width:75px;" href="javascript:divChange1('2');" class="select">关心下一代</a></li>
</ul>
<span class="more"><a id="jxfcMore" href="/html/gxxyd.shtml" class="moreH">更多>></a></span>
</div>
<ul class="ruleList" style="display:none;" id="ul_zrsy">
<#list eventfulYear as con>
 	<li><span class="floatR">[${con.releaseTime?string('yyyy-MM-dd')!}]</span><a href="/html/${con.contentId?c!}.shtml" target="blank"><#if con.title?length gt 15>${con.title?substring(0,15)!}...<#else>${con.title!}</#if></a></li>
</#list>
</ul>
<ul class="ruleList" id="ul_gxxyd">
<#list care as con>
 	<li><span class="floatR">[${con.releaseTime?string('yyyy-MM-dd')!}]</span><a href="/html/${con.contentId?c!}.shtml" target="blank"><#if con.title?length gt 15>${con.title?substring(0,15)!}...<#else>${con.title!}</#if></a></li>
</#list>
</ul>
</div>

<div class="iArea2">
<div class="healthTop">
<ul id="ul_tab" class="iTab">
	<li><a href="javascript:divChange('1');" class="select">疾病自测</a></li>
	<li>|</li>
	<li><a href="javascript:divChange('2');">健康评估</a></li>
	<li>|</li>
	<li><a href="javascript:divChange('3');">保健常识</a></li>
	<!--li><a href="jkbj_jbzc_list.shtml" class="moreH">更多>></a></li-->
</ul>
<span class="more"><a id="jkbjMore" href="/html/jkbj_jbzc_list.shtml" class="moreH">更多>></a></span>
</div>
<ul class="ruleList" style="display:none;" id="ul_jkcs">
<#list healthCommonSense as con>
	<li><span class="floatR">[${con.releaseTime?string('yyyy-MM-dd')!}]</span><a href="/html/${con.contentId?c!}.shtml" target="blank"><#if con.title?length gt 15>${con.title?substring(0,15)!}...<#else>${con.title!}</#if></a></li>
</#list>
</ul>
<ul class="ruleList" id="ul_jbzc">
	<li><a href="/html/jkbj_jbzc1.shtml" target="blank">基础问卷</a></li>
	<li><a href="/html/jkbj_jbzc2.shtml" target="blank">心脏病问卷</a></li>
	<li><a href="/html/jkbj_jbzc3.shtml" target="blank">骨质疏松问卷</a></li>
	<li><a href="/html/jkbj_jbzc4.shtml" target="blank">三高综合症问卷</a></li>
</ul>
<ul class="ruleList" style="display:none;" id="ul_jkpg">
	<li><a href="/html/jkbj_jkpg1.shtml" target="blank">BMI测试 </a></li>
	<li><a href="/html/jkbj_jkpg2.shtml" target="blank">血压测试 </a></li>
	<li><a href="/html/jkbj_jkpg3.shtml" target="blank">血糖测试</a></li>
</ul>
</div>

<div class="iRight marginB9">
<div class="iFC"><div class="iFCtitle">&nbsp;<span class="more"><a href="/html/yyfc.shtml" class="moreH">更多>></a></span></div></div>
<div class="iFCcontent">
<div class="scrollleft_shsy" id="shsy_scroll">
	<ul class="iArea4">
	<#list art as con>
		<li><a href="/html/${con.contentId?c!}.shtml" target="blank"><img src="${con.titleImg!}" width="219" height="159" /></a>
		<div class="textM"><a href="/html/${con.contentId?c!}.shtml" target="blank"><#if con.title?length gt 20>${con.title?substring(0,20)!}...<#else>${con.title!}</#if></a></div></li>
	</#list>
	</ul>
</div>
</div>

<div style="margin-top:10px;">
  <object id="FlashID" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="720" height="144">
    <param name="movie" value="/html/images/banner.swf" />
    <param name="quality" value="high" />
    <param name="wmode" value="opaque" />
    <param name="swfversion" value="9.0.45.0" />
    <!-- 此 param 标签提示使用 Flash Player 6.0 r65 和更高版本的用户下载最新版本的 Flash Player。如果您不想让用户看到该提示，请将其删除。 -->
    <param name="expressinstall" value="Scripts/expressInstall.swf" />
    <!-- 下一个对象标签用于非 IE 浏览器。所以使用 IECC 将其从 IE 隐藏。 -->
    <!--[if !IE]>-->
    <object type="application/x-shockwave-flash" data="images/banner.swf" width="720" height="144">
      <!--<![endif]-->
      <param name="quality" value="high" />
      <param name="wmode" value="opaque" />
      <param name="swfversion" value="9.0.45.0" />
      <param name="expressinstall" value="Scripts/expressInstall.swf" />
      <!-- 浏览器将以下替代内容显示给使用 Flash Player 6.0 和更低版本的用户。 -->
      <div>
        <h4>此页面上的内容需要较新版本的 Adobe Flash Player。</h4>
        <p><a href="http://www.adobe.com/go/getflashplayer"><img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="获取 Adobe Flash Player" width="112" height="33" /></a></p>
      </div>
      <!--[if !IE]>-->
    </object>
    <!--<![endif]-->
</object>
</div>
</div>


</div>
<div class="link">
<ul class="linkPic">
<#if friendlylinktype2 ??>
<#list friendlylinktype2 as con>
 	<li><a href="${con.domain!}"><img src="${con.logo!}" width="122" height="35" /></a></li>
</#list>
</#if>
</ul>
<div class="linkSelect">
<select name="mz" id="mz" onchange="selectMZ(this)">
	<option value="0">---民政网站---</option>
	</#if friendlylinktype2>
	<#list friendlylinktype2 as con>
	 	<option value="${con.domain!}">${con.siteName!}</option>
   </#list>
   </#if>
</select> 
<select name="select2" id="select2" onchange="suzao_MZ(this)">						
  	<option>---市区民政网站---</option>
  	<#if friendlylinktype2 ??>
	<#list friendlylinktype2 as con>
		<option value="${con.domain!}">${con.siteName!}</option>
	</#list>
	</#if>
</select> 
<select name="select3" id="select3" onchange="suzao_select3(this)">
	<option value="0">---直属单位网站---</option>
	<#if friendlylinktype2 ??>
	<#list friendlylinktype2 as con>
		<option value="${con.domain!}">${con.siteName!}</option>
	</#list>
	</#if>
</select> 
<select name="select4" id="select4" onchange="suzao_select4(this)">
	<option value="0">---社区网站---</option>
	<#if friendlylinktype2 ??>
	<#list friendlylinktype2 as con>
		<option value="${con.domain!}">${con.siteName!}</option>
	</#list>
	</#if>
</select>
</div>
</div>
<!--#include file="foot.shtml" -->
</div>
</body>
</html>
