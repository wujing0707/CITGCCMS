<#include "/html/top.html">
<!--content begin-->
<div class="wrap mt10 clear">
    <!--left begin-->
    <div class="leftbox f_l">
        <div class="left_menu box_border ">
            <div class="left_tit"><em></em>信用动态</div>
            <ul>
                <li><a href="#" class="current">国内动态</a></li>
                <li><a href="#">省内动态</a></li>
                <li><a href="#">本地动态</a></li>
            </ul>
        </div>
        
        <div class="box_border mt10">
        	<div class="left_tit left_seach"><em></em>企业信用查询</div>
            <div class="left_small">
              <ul class="forminfo">
                <li>
                  <label>企业名称</label>
                  <input name="" type="text" class="dfinput" />
                </li>
                <li>
                  <label>法定代表人</label>
                  <input name="" type="text" class="dfinput" />
                </li>
                <li>
                  <label>验证码</label>
                  <input name="" type="text" id="validCode" class="dfinput w60 f_l" value="" />
                  <input id="checkCodeID" size="2" type="text" style="width:30;border:0;cursor:pointer; height:23;font-size:18px" readonly="readonly" onclick="createCode()" class="code">
                </li>
                <li>
                  <label>&nbsp;</label>
                  <input name="" type="button" class="seach_btn" onclick="validate();" onmouseover="this.className='seach_btn1'" onmouseout="this.className='seach_btn'" value="查 询"/>
                </li>
              </ul>
            </div> 
        </div>
    </div>
    <!--left over-->
    <!--right begin-->
    <div class="right box_border f_r">
    	<div class="tit1 right_tit"><b>国内动态</b><span>当前位置：<a href="#">首页</a> > <a href="#">信用动态</a> > 国内动态 </span></div>
        <div class="pad10">
            <ul class="list inlist">
            <#list InformationList as info>
                <li><a href="xydtdetail${info.id}.html" target="_blank">${info.title}</a><span>${info.addtime?substring(0,9)}</span></li>
            </#list>
            </ul>
        </div> 
        <div class="page_all">
             <table width="100%" border="0" cellspacing="0" cellpadding="0" >
              <tr>
                 <td>
                 <div class="page">
               <a href="javascript:void(0);" onclick="goto('first','xydtlist',${index},${lastPage})">首页</a>&nbsp;&nbsp;<a href="javascript:void(0);" onclick="goto('up','xydtlist',${index},${lastPage})">上一页</a>&nbsp;&nbsp;<a href="javascript:void(0);" onclick="goto('down','xydtlist',${index},${lastPage})">下一页</a>&nbsp;&nbsp;<a  href="javascript:void(0);" onclick="goto('last','xydtlist',${index},${lastPage})">末页</a>&nbsp;&nbsp;
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
