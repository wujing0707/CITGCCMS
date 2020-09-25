<#include "/html/top.html">
<!--content begin-->
<div class="wrap mt10 clear">
<!--left begin-->
   <!--left begin-->
    <div class="leftbox f_l">
        <div class="left_menu box_border ">
        <div class="left_tit"><em></em><#if preName??&&preName!="顶级栏目">${preName}</#if></div>
        <ul><#if Channels??>
	        <#list Channels.channels as cc>
			<#if (cc.status)??&&cc.status==0>
        <!--    <li><a href="#" class="current">守信公示</a></li>-->
            <li><a href="content${cc.channelId}_1.html" >${cc.name!}</a></li>
            </#if>
		    </#list>
		    </#if>
        </ul>
        </div>
        <div class="box_border mt10" id="dd">
        	<div class="left_tit left_seach"><em></em>企业信用查询</div>
            <div class="left_small">
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
                  <input id="checkCodeID3" size="3" type="text" style="width:30;border:0;cursor:pointer; height:25;font-size:18px" readonly="readonly" onclick="createCode(3)" class="code">
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
<!--right begin-->
    <div class="right box_border f_r">
    	<div class="tit1 right_tit"><b>${channel.name!}</b><span>当前位置：<#if preName??&&preName!="顶级栏目"> <a href="#">${preName}</a> ></#if> ${channel.name}</span></div>
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
             <table width="100%" border="0" cellspacing="0" cellpadding="0" >
              <tr>
                 <td>
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
                 </td>
              </tr>
             </table>
            </div>
    </div>
    <!--right over-->
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
