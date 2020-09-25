<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>苏州市军休网</title>
<link rel="stylesheet" type="text/css" href="/html/css/style.css"/>
<script type="text/javascript" src="/html/js/jquery-1.10.2.min.js"></script>
</head>

<body>
<div id="container">
<!--#include file="/html/top.html"-->
<div class="content">
<div class="z_content">
<div class="z_left">
<div class="leftMenu">
<#assign i = 0/>  
<#-- 定义宏buildNode --> 
<#macro buildNode child parent>  
<#if i = 0>
<div class="leftMenuTitle"><div class="txt"> <a href=" ../html/${parent.path}.html">${parent.name}</a></div></div>
<ul>
<#else> 
<li id="${parent.channelId}" parentId="${parent.channelId}" class="current" > <a href=" ../html/${parent.path}.html">${parent.name}</a>
</#if>  
<#assign i = i + 1/>  
  <#if child?? && child?size gt 0> 
  		<ul>    
                <#list child as t>   
                    <#-- 递归调用宏buildNode -->  
                    <@buildNode child=t.channels parent=t/>  
                </#list>   
        </ul>
        </#if>  
  </li>
</#macro>   
 <@buildNode child=channels parent=channel.channel/>
</ul>
</div>

<!--#include virtual="quickRoad.shtml"-->
</div>
<div class="z_right">
<div class="positionBg"><span class="txt">当前位置：军休动态  > ${channel.name}</span></div>
<div class="pad10">
</div></div>
 		<div class="writings_con">
       		 ${txt!}
        </div>
</div>
</div>
</div></div> 
<!--#include virtual="foot.shtml" -->
</div>
</body>
</html>
