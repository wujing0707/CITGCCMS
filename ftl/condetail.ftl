<#include "/html/top.html">
<!--content begin-->
<div class="wrap mt10 box_border clear">
    <div class="breadcrumbs">
        <ul>
            <li>当前位置：</li>
           <#if preName??&&preName!="顶级栏目">
           		<li><a href="${path!}">${preName}</a> > </li>
           </#if>
            <#if (channel.name)??><li><a href="content${channel.channelId!}_1.html">${channel.name}</a> > </li></#if>
            <li> 详细</li>
        </ul>
    </div>
    <div class="pad10">
        <div class="art_tit">${c.title!}</div>
        <div class="tc artinfo"> 【发布日期：${c.releaseTime?string("yyyy-MM-dd")} 】【<a href="javascript:void(0)" onclick="window.print();">打印</a>】 </div>
        <div class="artnr pad10">${c.txt!}<br /></div>
    </div>
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