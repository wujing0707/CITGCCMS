<#include "/html/top.html">
<!--notice begin-->
<div class="notice">
	<div class="wrap">
    	<div class="notice_tit f_l f_b">${channel_0!}</div>
        <div class="notice_list list f_r" >
        	<ul>
        	<#if gonggaoList??>
        	   <#list gonggaoList?sort_by(["releaseTime"])?reverse as info>
            	  <#if info??>
            		<li><a href="condetail${info.contentId?c}.html"><NOBR> ${info.title!}</NOBR></a></li>
            	  </#if>
                </#list>
             </#if>
            </ul>
        </div>
    </div>
</div>
<!--notice over-->

<!--content begin-->
<div class="content clear">
	<div class="wrap mt10 clear">
    	<!--焦点图 begin-->
        <div class="yx-rotaion f_l">
            <ul class="rotaion_list">
               <#list ImageList as info>
                <#if info_index<4>
                <li><a href="condetail${info.contentId?c}.html"><img src="${info.titleImg!}" alt="${info.title!}"></a></li>
                </#if>
                </#list>
            </ul>
        </div>
        <script type="text/javascript" src="js/jquery.yx_rotaion.js"></script>
        <script type="text/javascript">
        $(".yx-rotaion").yx_rotaion({auto:true});
        </script>
        <!--焦点图 over-->
    	<!--信用动态 begin-->
    	<div class=" box_border w300 ml10 f_l" style="height:283px;">
        	<div class="tit"><span class="tit_ico"></span>信用动态</div>
            <ul class=" dt_list">
            <#list xydtList?sort_by(["releaseTime"])?reverse as info>
            	  <#if info??>
            	  <#if info_index<4>
            	  <#assign contentId="${info.contentId?c!}" lanmuName="xydtChanName_"+contentId n=lanmuName?eval>
                <li><a href="condetail${info.contentId?c}.html"><NOBR>[${n!}]${info.title!}</NOBR></a>
                    <div class="time">${info.releaseTime?string("yyyy-MM-dd")}</div>
                </li>
                </#if>
                </#if>
                </#list>
            </ul>
        </div>
    	<!--失信黑名单 begin-->
    	<div class=" box_border w300 f_r" style="height:283px;">
        	<div class="tit h_tit"><span class="tit_ico "></span>失信黑名单</div>
           	<div class="">
                <ul class="list h_list" >
                <#list sxhmdList?sort_by(["releaseTime"])?reverse as info>
            	  <#if info??&&info_index<5>
                    <li><a href="condetail${info.contentId?c}.html"><NOBR>${info_index+1} ${info.title!}</NOBR></a></li>
                   </#if>
                   </#list>
                </ul>
            </div>
        </div>
        <!--失信黑名单 over-->
		<script>
        var myVar = setInterval(function(){ scroll() }, 100);
        
        var _margin = 0;
        function scroll() {
            var _width = $(".notice_list").find("ul").find("li").eq(0).width();
            if( _margin < _width ){
                _margin+= 5;
            } else {
                _margin = 0;
                $(".notice_list").find("ul").find("li").eq(0).appendTo(".notice_list ul");
            }
            $(".notice_list").find("ul").css({"margin-left" : ( 0 - _margin) + "px"})
        }
        
        $(".notice_list").find("ul").hover(function(){
            clearInterval(myVar);
        },function(){
            myVar = setInterval(function(){ scroll() }, 100);
        });
        
        var newVar = setInterval(function(){ newsc() }, 2000);
        function newsc() {
            var _height = $(".h_box").find("ul").find("li").eq(0).height();
            $(".h_box").find("ul").animate({"margin-top":( 0 - _height ) +"px"},1000,function(){
                $(".h_box").find("ul").css({"margin-top":0 +"px"});
                $(".h_box").find("ul").find("li").eq(0).appendTo(".h_box ul");
            });
        }
        </script>
    </div>
    <!--nr1 over-->
    
    <!--nr2 begin-->
    <div class="wrap mt10 clear">
    	
        <div class="box_border w690 f_l " style="height:206px">
        	<div class="w325 f_l ml10">
                <div class="tit1"><em><img src="images/tit_ico1.png" /></em><b>守信公示</b><a href="content61_1.html" class="f_r">MORE</a></div>
                <ul class="list pad10">
                 <#list sxgsList?sort_by(["releaseTime"])?reverse as info>
            	  <#if info??>
            	  <#if info_index<5>
                    <li><a href="condetail${info.contentId?c}.html"><NOBR> ${info.title!}</NOBR></a></li>
                  </#if>
                  </#if>
                 </#list>
                </ul>
            </div>
            
        	<div class="w325 f_l ml10" style="height:206px">
                <div class="tit1"><em><img src="images/tit_ico2.png" /></em><b>失信警告</b><a href="content60_1.html" class="f_r">MORE</a></div>
                <ul class="list pad10">
                 <#list sxjgList?sort_by(["releaseTime"])?reverse as info>
            	  <#if info??>
            	  <#if info_index<5>
                    <li><a href="condetail${info.contentId?c}.html"><NOBR> ${info.title!}</NOBR></a></li>
                    </#if>
                  </#if>
                 </#list>
                </ul>
            </div>
            
        </div>
        
        <div id="usual1" class="usual box_border w300 f_r gradient">
            
                    <div class="itab">
                        <ul> 
                            <li class="itab1"><a href="#tab1" class="selected">企业</a></li> 
                            <li style="display:none" class="itab2"><a href="#tab2">非企业</a></li> 
                            <li class="selected"><a href="#tab3">重点人群</a></li> 
                        </ul>
                    </div> 
                    
                    <div id="tab1" class="tabson small">
                      <ul class="forminfo">
                        <li>
                          <label>组织机构代码</label>
                          <input name="" id="zzjgdm" type="text" class="dfinput" />
                        </li>
                        <li>
                          <label>工商注册号</label>
                          <input name="" id="gszch" type="text" class="dfinput" />
                        </li>
                        <li>
                          <label>验证码</label>
                          <input name="" type="text" id="validCode0" class="dfinput w90 f_l" value="" />
                          <input id="checkCodeID0" size="3" type="text" style="width:30;border:0;cursor:pointer; height:23;font-size:18px" readonly="readonly" onclick="createCode(0)" class="code">
                        </li>
                        <li>
                          <label>&nbsp;</label>
                          <input name="" type="button" class="seach_btn" onclick="validate(0);" onmouseover="this.className='seach_btn1'" onmouseout="this.className='seach_btn'" value="查 询"/>
                          <a href="seach.html" class="ml10">高级查询</a>
                        </li>
                      </ul>
                        
                    </div> 
                    
                    <div id="tab2" class="tabson small">
                      <ul class="forminfo">
                        <li>
                          <label>组织单位名称</label>
                          <input name="" type="text" class="dfinput" />
                        </li>
                        <li>
                          <label>法定代表人</label>
                          <input name="" id="companyname" type="text" class="dfinput" />
                        </li>
                        <li>
                          <label>验证码</label>
                          <input name="" type="text" id="validCode1" class="dfinput w90 f_l" value="" />
                          <input id="checkCodeID1" size="3" type="text" style="width:30;border:0;cursor:pointer; height:23;font-size:18px" readonly="readonly" onclick="createCode(1)" class="code">
                        </li>
                        <li>
                          <label>&nbsp;</label>
                          <input name="" type="button" class="seach_btn" onclick="validate(1);" value="查 询"/>
                          <a href="#" class="ml10">高级查询</a>
                        </li>
                      </ul>
                    </div>  
                    
                    <div id="tab3" class="tabson small">
                      <ul class="forminfo">
                        <li>
                          <label>姓名</label>
                          <input name="" type="text" class="dfinput" />
                        </li>
                        <li>
                          <label>个人类型</label>
                          <select class="select">
                            <option value="0">所有分类</option>
                            <option value="1">教师</option>
                            <option value="2">律师</option>
                          </select>
                        </li>
                        <li>
                          <label>验证码</label>
                          <input name="" type="text" id="validCode2" class="dfinput w90 f_l" value="" />
                          <input id="checkCodeID2" size="3" type="text" style="width:30;border:0;cursor:pointer; height:23;font-size:18px" readonly="readonly" onclick="createCode(2)" class="code">
                        </li>
                        <li>
                          <label>&nbsp;</label>
                          <input name="" type="button" class="seach_btn" onclick="validate(2);" value="查 询"/>
                          <a href="#" class="ml10">高级查询</a>
                        </li>
                      </ul>
                    </div>  
                 
                    <script type="text/javascript"> 
                      $("#usual1 ul").idTabs(); 
                    </script>
        
                </div>  
        <!--查询 over-->
    </div>
    <!--nr2 over-->
    
    <!--nr3 begin-->
    <div class="wrap mt10">
    	<div class="xyfw_box">
        	<div class="xyfw_tit f_l"></div>
        	<div class="xyfw_logo f_l"></div>
            <ul class="xyfw_nr f_l">
            	<li>
                <a href="#">
                	<div class="xyfw_pic f_l"><img src="images/xyfw_pic1.png" /></div>
                    <div class="xyfw_txt f_l">
                    	<h3>信用服务机构</h3>
                        <p>简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介</p>
                    </div>
                </a>
                </li>
            	<li>
                <a href="#">
                	<div class="xyfw_pic f_l"><img src="images/xyfw_pic2.png" /></div>
                    <div class="xyfw_txt f_l">
                    	<h3>信用服务大厅</h3>
                        <p>简介简介简介简介简介</p>
                    </div>
                </a>
                </li>
            	<li>
                <a href="qycomplain.html">
                	<div class="xyfw_pic f_l"><img src="images/xyfw_pic3.png" /></div>
                    <div class="xyfw_txt f_l">
                    	<h3>信用异议申诉</h3>
                        <p>简介简介简介简介简介</p>
                    </div>
                </a>
                </li>
            </ul>
        </div>
    </div>
    <!--nr3 over-->
    
    <!--nr4 begin-->
    <div class="wrap mt10 clear">
        <div class="box_border w325 f_l" style="height:186px">
        	<div class="tit1"><em><img src="images/tit_ico3.png" /></em><b>${channel_2!}</b><a href="content320_1.html" class="f_r">MORE</a></div>
            <ul class="list">
            <#list Listpdbz?sort_by(["releaseTime"])?reverse as info>
            <#if info_index<5>
	                <li class="none"><a href="condetail${info.contentId?c}.html"><NOBR> ${info.title!}</NOBR></a></li>
             </#if>
            </#list>
            </ul>
        </div>
        
        <div class="box_border w325 f_l ml10" style="height:186px">
        	<div class="tit1"><em><img src="images/tit_ico4.png" /></em><b>${channel_3!}</b><a href="content321_1.html" class="f_r">MORE</a></div>
            <ul class="list">
            <#list zdlyList?sort_by(["releaseTime"])?reverse as info>
            	<#if info_index<5>
            	<#if (info.status)??&&info.status=="0">
                <li><a href="condetail${info.contentId?c}.html"><NOBR> ${info.title!}</NOBR></a></li>
                </#if>
                </#if>
            </#list>
            </ul>
        </div>
        <div class="box_border w325 f_r" style="height:186px">
        	<div class="tit1"><em><img src="images/tit_ico5.png" /></em><b>${channel_4!}</b><a href="content309_1.html" class="f_r">MORE</a></div>
            <ul class="list">
            <#list Listzcfg?sort_by(["releaseTime"])?reverse as con>
        	<#if Listzcfg??&&con??>
        	<#if con_index<5>
	         <#assign contentId="${con.contentId?c!}" lanmuName="sslmName_"+contentId n=lanmuName?eval>
                <li><a href="condetail${con.contentId?c}.html"><NOBR>[${n!}]${con.title!}</NOBR></a></li>
            </#if>
            </#if>
            </#list>
            </ul>
        </div>
    </div>
    <!--nr4 over-->
    <!--nr4 begin-->
    <div class="wrap mt10">
    	<table width="100%" class="ad_box">
        	<tr>
            	<td align="center"><a href="http://xxgk.sipac.gov.cn/sipacjcy/SipacJCY/default.aspx" target="_blank"><img src="images/ad1.png" /></a></td>
            	<td align="center"><a href="http://shixin.court.gov.cn/" target="_blank"><img src="images/ad2.png" /></a></td>
            </tr>
            <tr>
            	<td colspan="2" class="blue_bj" height="3"></td>
            </tr>
        </table>
    </div>
    <!--nr4 over-->
</div>
<!--content over-->


<div class="wrap mt10 clear">
	<div class="member mem_bj f_l clear">
    	<div class="member_t"><span></span>成员名单</div>
        <ul class="member_list">
        	<li><a href="#">成员名单</a></li>
        	<li><a href="#">成员名单</a></li>
        	<li><a href="#">成员名单</a></li>
        	<li><a href="#">成员名单</a></li>
        	<li><a href="#">成员名单</a></li>
        	<li><a href="#">成员名单</a></li>
        	<li><a href="#">成员名单</a></li>
        	<li><a href="#">成员名单</a></li>
        	<li><a href="#">成员名单</a></li>
        	<li><a href="#">成员名单</a></li>
        	<li><a href="#">成员名单</a></li>
        	<li><a href="#">成员名单</a></li>
        </ul>
    </div>
    
    <div class="link w325 gradient f_r">
    	<div class="link_t">友情链接</div>
        <ul>
        	<li><a href="#">中国苏州</a></li>
        	<li><a href="#">苏州工业园区</a></li>
        	<li><a href="#">诚信江苏</a></li>
        	<li><a href="#">诚信苏州</a></li>
        </ul>
    </div>

</div>

<!--footer begin-->
<div class="bottom mt10">
    <div class=" wrap tc">
        <p>主办单位：************** &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;承办单位：**************  </p>
        <p>技术支持：江苏中集科技有限公司</p>
    </div>
</div>
<!--footer over-->
    
</body>
</html>
