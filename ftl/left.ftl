<#include "/html/top.html">
<!--content begin-->
<div class="wrap mt10 clear">
<!--left begin-->
    <div id="lll" class="leftbox f_l">
     <#list ListChannel as channel>
        <#if ListChannel??&&channel??>
        <#if (channel.status)??&&channel.status==0&&channel.channelId!=1&&channel.channel.channelId==1>
        <div id="${channel.channelId}" class="left_menu box_border" style="display: none" >
            <div class="left_tit"><em></em>${channel.name}</div>
            <#if channel.channels??>
            <ul>
            	<#list channel.channels?sort_by(["createTime"]) as cc>
            	<#if (cc.status)??&&cc.status==0>
                <li><a href="content${cc.channelId}" class="current">${cc.name}</a></li>
                </#if>
		        </#list>
            </ul>
            </#if>
        </div>
        </#if>
        </#if>
        </#list>
        <div class="box_border mt10" id="dd">
        	<div class="left_tit left_seach"><em></em>企业信用查询</div>
            <div class="left_small">
              <ul class="forminfo">
                <li>
                  <label>组织机构代码</label>
                  <input name="" type="text" class="dfinput" />
                </li>
                <li>
                  <label>法定代表人</label>
                  <input name="" id="companyname" type="text" class="dfinput" />
                </li>
                <li>
                  <label>验证码</label>
                  <input name="" type="text" id="validCode3" class="dfinput w60 f_l" value="" />
                  <input id="checkCodeID3" size="2" type="text" style="width:30;border:0;cursor:pointer; height:23;font-size:18px" readonly="readonly" onclick="createCode(3)" class="code">
                </li>
                <li>
                  <label>&nbsp;</label>
                  <input name="" type="button" class="seach_btn" onclick="validate(3);" onmouseover="this.className='seach_btn1'" onmouseout="this.className='seach_btn'" value="查 询"/>
                </li>
              </ul>
            </div> 
        </div>
    </div>
    <!--left over-->