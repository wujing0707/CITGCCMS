<#include "/html1/top.html">
<!--content begin-->
<div class="wrap mt5">
    <!--left begin-->
    <div class="leftbox f_l">
        <div class="left_menu">
            <h2><em></em>信用查询</h2>
            <ul>
                <li><a href="seach.html">社会法人信用查询</a></li>
                <li style="display:none"><a href="fqyseach.html">非企业信用查询</a></li>
                <li><a href="personalseach.html">重点人群信用查询</a></li>
                <li><a href="creditcheck.html">信用核查码</a></li>
                <li><a href="http://172.25.106.6:8080/creditVerification/tocreditVerification.action?UTYPE=P&IDCODE=137810039">我的信用核查</a></li>
            </ul>
        </div>
        <div class="left_other mt5"><a href="qycomplain.html">异议申诉</a></div>
        <div class="left_other mt5 bg_co2"><a href="#" target="_blank">信用服务</a></div>
    </div>
    <!--left over-->
    <!--right begin-->
    <div class="right f_r">
    	<div class="tit1 right_tit"><b>信用核查</b></div>
        <div class="pad10 pad_t50">
              <ul class="forminfo">
                <li>
                  <label>信用核查码</label>
                  <input name="" id="checknumber" type="text" class="dfinput" />
                </li>
                <li style="display:none">
                  <label>验证码</label>
                 <input name="" type="text" id="validCode0" class="dfinput w200 f_l" value="" />
                  <input id="checkCodeID0" size="3" type="text" style="color: Red;font-family: Arial;font-style: italic;font-weight: bolder;letter-spacing: 3px;padding: 2px 3px;width:30;border:0;cursor:pointer; height:23; background-image: url('../html/images/QQ.jpg');font-size:18px" readonly="readonly" onclick="createCode(0)" >
                </li>
                <li>
                  <label>&nbsp;</label>
                  <input name="" onClick="query(0);" type="button" class="btn" value="查 询"/>
                  <input name="" onclick="checkReset();" type="button" class="btn" value="重置"/>
                </li>
              </ul>
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
