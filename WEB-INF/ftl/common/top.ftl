<div id="top"><img src="images/top.jpg" width="990" height="162" /></div>
<div class="menu">
<li><a name="menu" href="index.shtml">首页</a></li><li class="menuLine"></li>
<li><a name="menu" href="zwgk_jggk_list.shtml">政务公开</a></li><li class="menuLine"></li>
<li><a name="menu" href="zcfg_gjzc_list.shtml">政策法规</a></li><li class="menuLine"></li>
<li><a name="menu" href="jxdt_llxx_list.shtml">军休动态</a></li><li class="menuLine"></li>
<li><a name="menu" href="jxfc_shzpsx_list.shtml">军休风采</a></li><li class="menuLine"></li>
<li><a name="menu" href="jkbj_bjcs_list.shtml">健康保健</a></li><li class="menuLine"></li>
<li><a name="menu" href="jxnk_list.shtml">军休内刊</a></li><li class="menuLine"></li>
<li><a name="menu" href="lyzx_ckhf_list.shtml">留言咨询</a></li><li class="menuLine"></li>
<li><a name="menu" href="kstd_zcjd_zzdy_list.shtml">快速通道</a></li><li class="menuLine"></li>
<li><a name="menu" href="zlsw.shtml">助老上网</a></li></div>
<div class="sonMenu">
<div name="top_SecondMenu" style="padding-left:20px;"><span id="datetime">2014年2月13日 星期四</span> 您好,欢迎访问苏州市军休网!</div>
<div name="top_SecondMenu" style="padding-left:80px; display:none;"><a href="zwgk_jggk_list.shtml" class="select">机构概况</a> | <a href="zwgk_bszn_list.shtml">办事指南</a></div>
<div name="top_SecondMenu" style="padding-left:160px; display:none;"><a href="zcfg_gjzc_list.shtml" class="select">国家政策</a> | <a href="zcfg_dfzc_list.shtml">地方政策</a></div>
<div name="top_SecondMenu" style="padding-left:220px; display:none;"><a href="jxdt_llxx_list.shtml" class="select">理论学习</a> | <a href="jxdt_wthd_list.shtml">文体活动</a> | <a href="jxdt_gzdt_list.shtml">工作动态</a></div>
<div name="top_SecondMenu" style="padding-left:80px; display:none;"><a href="jxfc_shzpsx_list.shtml" class="select">军休干部书画作品赏析</a> | <a href="jxfc_syzpsx_list.shtml">军休干部摄影作品赏析</a> | <a href="jxfc_wxzpsx_list.shtml">军休干部文学作品赏析</a> | <a href="jxfc_jxgbxjsj_list.shtml">军休干部先进事迹</a> | <a href="jxfc_gxxydgc_list.shtml">关心下一代工作</a></div>
<div name="top_SecondMenu" style="padding-left:410px; display:none;"><a href="jkbj_bjcs_list.shtml" class="select">保健常识</a> | <a href="jkbj_jbzc_list.shtml">疾病自测</a> | <a href="jkbj_jkpg_list.shtml">健康评估</a></div>
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