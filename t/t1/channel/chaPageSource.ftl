<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>苏州市军休网</title>
<link rel="stylesheet" type="text/css" href="/html/css/style.css"/>
<script type="text/javascript" src="/html/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript">
var page = {
		page: 1,
		rows: 10
	}

	$(function() {
		query(page.page, page.rows);
	});
		
	function query(page, rows) {
		var channelId = ${channel.channelId};
		$.post("../content/queryContentWithPage.action", 
			{"channelId" : channelId, page: page, rows: rows},
			function(data) {
				$("#pageIndex").html(page);
				$("#totalRows").html(data.total);
				
				var totalPage = 0;
				if (data.total % rows == 0)
					totalPage = data.total / rows;
				else
					totalPage = parseInt(data.total / rows, 10) + 1;
				$("#totalPage").html(totalPage);
				
				var obj = eval(data.rows);
				var index = 0;
				var tbody = "";
				$.each(obj,function(n,value) {
			         	 var trs = "";  
			         	 trs +=  "<li><a href='" + value.originUrl + "' target='blank'>" + value.title + "</a></li>";
			             tbody += trs;     
			           });  
				$("#li").html(tbody);  
				
				if (page == 1) {
					$("#first").css("color", "gray");
					$("#previous").css("color", "gray");
				} else {
					$("#first").css("color", "black");
					$("#previous").css("color", "black");
				}
				
				if (page == totalPage) {
					$("#next").css("color", "gray");
					$("#last").css("color", "gray");
				} else {
					$("#next").css("color", "black");
					$("#last").css("color", "black");
				}
				
			}, "json");
	}
		
	function first() {
		page.page = 1;
		query(page.page, page.rows);
	}

	function last() {
		page.page = Number($("#totalPage").html());
		query(page.page, page.rows);
	}

	function previous() {
		if (page.page - 1 < 1)
			return;
		
		page.page--;
		query(page.page, page.rows);
	}

	function next() {
		if (page.page + 1 > Number($("#totalPage").html()))
			return;
		page.page++;
		query(page.page, page.rows);
	}
</script>

</head>

<body>
<div id="container">
<!--#include file="top.shtml"-->
<div class="content">
<div class="z_content">
<div class="z_left">
<div class="leftMenu">
<#assign i = 0/>  
<#-- 定义宏buildNode --> 
<#macro buildNode child parent>  
<#if i = 0>
<div class="leftMenuTitle"><div class="txt"> ${parent.name}</div></div>
<ul>
<#else> 
	<#if path=parent.path>
		<li id="${parent.path}" parentId="${parent.channelId}" class="current" onclick="window.location.href='../html/${parent.path}.shtml';"> ${parent.name}</li>
	<#else> 
		<li id="${parent.path}" parentId="${parent.channelId}"  onclick="window.location.href='../html/${parent.path}.shtml';"> ${parent.name}</li>
	</#if>
</#if>  
<#assign i = i + 1/>  
  <#if child?? && child?size gt 0> 
                <#list child as t>   
                    <#-- 递归调用宏buildNode -->  
                    <@buildNode child=t.channels parent=t/>  
                </#list>   
        </#if>  
</#macro>   
 <@buildNode child=channels parent=channel.channel/>
</ul>
</div>

<!--#include virtual="quickRoad.shtml"-->
</div>
<div class="z_right">
<div class="positionBg"><span class="txt">当前位置：${channel.channel.name!}  > ${channel.name!}</span></div>
<div class="pad10">
<div class="newsList"><ul id ="li"></ul></div>
<div class="pageArea1" >
  <span class="floatL">第 <span id="pageIndex" class="bold">1</span> 页，共 <span id="totalPage" class="bold">1</span> 页，共 <span id="totalRows" class="bold">0</span> 条</span><span class="floatR">
  	<a class="newsH" id="first" href="javascript:first();">首页</a> <a class="newsH" id="previous" href="javascript:previous();">上页</a> <a class="newsH" id="next" href="javascript:next();">下页</a> <a class="newsH" id="last" href="javascript:last();">末页</a> 
</div>
</div>
</div>
</div></div> 
<!--#include virtual="foot.shtml" -->
</div>
</body>
</html>
