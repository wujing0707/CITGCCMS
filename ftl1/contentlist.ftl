<#include "/html1/top.html">
<!--content begin-->
<div class="wrap mt5">
    <!--left begin-->
    <div class="leftbox f_l">
        <div class="left_menu">
            <h2><em></em><#if preName??&&preName!="顶级栏目">${preName}</#if></h2>
            <ul>
            <#if Channels??>
	        <#list Channels.channels as cc>
				<#if (cc.status)??&&cc.status==0>
                <li><a href="content${cc.channelId}_1.html">${cc.name!}</a></li>
                </#if>
		    </#list>
		    </#if>
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
    	<div class="tit1 right_tit"><b>${channel.name!}</b>&emsp;&nbsp;&nbsp;&nbsp;<input type="text" id="title" name="title"/>&emsp;&nbsp;<input type="button" value="搜索" onClick="seachContent('${channel.channelId!}')"/><span>当前位置：<#if preName??&&preName!="顶级栏目"> <a href="">${preName}</a> > </#if> ${channel.name} </span></div>
        <div class="pad10">
            <ul class="list inlist">
               <#list contentlist?sort_by(["releaseTime"])?reverse as con>
            <#if (con.status)??&&con.status=="0">
                <li><a href="condetail${con.contentId?c}.html">${con.title}</a><span>${con.releaseTime?string("yyyy-MM-dd")}</span></li>
                 </#if>
            </#list>
            </ul>
        </div> 
        <div class="page_all">
             <div class="page">
          <#if lastPage??&&lastPage==1>
                	 首页&nbsp;&nbsp;上一页&nbsp;&nbsp;下一页&nbsp;&nbsp;末页&nbsp;&nbsp;第&nbsp;<b>${index}</b>&nbsp;页&nbsp;&nbsp;共&nbsp;<b>${lastPage}</b>&nbsp;页&nbsp;&nbsp;共&nbsp;<b>${recordCount!}</b>&nbsp;条
                 </#if>
                 <#if index??&&index==1&&lastPage gt 1>
                 		 首页&nbsp;&nbsp;上一页&nbsp;&nbsp;<a href="javascript:void(0);" onclick="goto('down','${path}',${index},${lastPage})">下一页</a>&nbsp;&nbsp;<a  href="javascript:void(0);" onclick="goto('last','${path}',${index},${lastPage})">末页</a>&nbsp;&nbsp; 第&nbsp;<b>${index}</b>&nbsp;页&nbsp;&nbsp;共&nbsp;<b>${lastPage}</b>&nbsp;页&nbsp;&nbsp;共&nbsp;<b>${recordCount!}</b>&nbsp;条
                 </#if>
                 <#if index??&&lastPage??&&index==lastPage&&lastPage gt 1>
                 <a href="javascript:void(0);" onclick="goto('first','${path}',${index},${lastPage})">首页</a>&nbsp;&nbsp;<a href="javascript:void(0);" onclick="goto('up','${path}',${index},${lastPage})">上一页</a>&nbsp;&nbsp;下一页&nbsp;&nbsp;末页&nbsp;&nbsp;第&nbsp;<b>${index}</b>&nbsp;页&nbsp;&nbsp;共&nbsp;<b>${lastPage}</b>&nbsp;页&nbsp;&nbsp;共&nbsp;<b>${recordCount!}</b>&nbsp;条
                 </#if>
                 <#if index lt lastPage&&index gt 1>
               <a href="javascript:void(0);" onclick="goto('first','${path}',${index},${lastPage})">首页</a>&nbsp;&nbsp;<a href="javascript:void(0);" onclick="goto('up','${path}',${index},${lastPage})">上一页</a>&nbsp;&nbsp;<a href="javascript:void(0);" onclick="goto('down','${path}',${index},${lastPage})">下一页</a>&nbsp;&nbsp;<a  href="javascript:void(0);" onclick="goto('last','${path}',${index},${lastPage})">末页</a>&nbsp;&nbsp;
               第&nbsp;<b>${index}</b>&nbsp;页&nbsp;&nbsp;共&nbsp;<b>${lastPage}</b>&nbsp;页&nbsp;&nbsp;共&nbsp;<b>${recordCount!}</b>&nbsp;条
               	 </#if>
        </div>

    </div>
    <!--right over-->
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
