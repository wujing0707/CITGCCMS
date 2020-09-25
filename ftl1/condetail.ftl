<#include "/html1/top.html">
<!--content begin-->
<div class="wrap mt5 content">
    <div class="breadcrumbs">
        <ul>
            <li>当前位置：</li>
           <#if preName??&&preName!="顶级栏目">
          		<li><a href="${path!}">${preName}</a> > </li>
           </#if>
            <#if (channel.name)??><li><a href="content${channel.channelId!}_1.html">${channel.name}</a> > </li></#if>
            <li>详细</li>
        </ul>
    </div>
    
    <div class="pad50">
    	<div class="art_head">
            <h1>${c.title!}</h1>
            <div class="tc art_date"> 【发布日期：${c.releaseTime?string("yyyy-MM-dd")} 】【<a href="javascript:void(0)" onclick="window.print();">打印</a>】 </div>
        </div>
        <div class="artnr">${c.txt!}</div>
    </div>
    
</div>
<!--content over-->

<!--footer begin-->
<div class="wrap mt5">
	<div class="pad10  nylink">
        <h1>友情链接</h1>
        <ul class="pad10">
            <li><a href="#" target="_blank">中国苏州</a></li>
            <li><a href="#" target="_blank">中国苏州</a></li>
            <li><a href="#" target="_blank">中国苏州</a></li>
            <li><a href="#" target="_blank">中国苏州</a></li>
        </ul>
    </div>
    
</div>

<div class="wrap mt5 foot">
	<div class="pad10">
    	<span>主办单位：********** </span><span>承办单位：**********</span><span>技术支持：江苏中集科技有限公司</span>
    </div> 
</div>
<!--footer over-->
    
</body>
</html>
