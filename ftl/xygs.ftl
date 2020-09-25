<#include "/html/top.html">
<!--nav over-->
<!--content begin-->
<div class="wrap mt10 clear">
    <!--left begin-->
    <div class="leftbox f_l">
        <div class="left_menu box_border ">
        <div class="left_tit"><em></em>信用公示</div>
        <ul>
            <li><a href="#" class="current">守信公示</a></li>
            <li><a href="#" >失信警告</a></li>
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
    	<div class="tit1 right_tit"><b>信用公示</b><span>当前位置：<a href="#" target="_blank">首页</a> > <a href="#" target="_blank">信用公示</a>  > 列表 </span></div>
        <div class="pad10">
            <table class="tablelist table">
                <thead>
                <tr>
                <th>序号</th>
                <th>企业名称</th>
                <th>表彰时间</th>
                <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                <td>1</td>
                <td>江苏中集科技有限公司</td>
                <td>XXXXXX</td>
                <td><a href="hblistdetail.html" class="tablelink">详细</a></td>
                </tr> 
                
                <tr class="odd">
                <td>2</td>
                <td>江苏中集科技有限公司</td>
                <td>XXXXXX</td>
                <td><a href="#" class="tablelink">详细</a></td>
                </tr> 
                </tbody>
            </table>
        </div> 
        <div class="page_all">
             <table width="100%" border="0" cellspacing="0" cellpadding="0" >
              <tr>
                 <td>
                 <div class="page">
                 首页&nbsp;&nbsp;上一页&nbsp;&nbsp;<a href="">下一页</a>&nbsp;&nbsp;<a  href="">末页</a>&nbsp;&nbsp;第&nbsp;<b>1</b>&nbsp;页&nbsp;&nbsp;共&nbsp;<b>20</b>&nbsp;页&nbsp;&nbsp;共&nbsp;<b>100</b>&nbsp;条&nbsp;&nbsp;到第
    <input type="text" size="1" id="textFooter">
    页&nbsp;&nbsp;<a style="text-decoration: none;color: #1c89e3;" href="">跳转</a>&nbsp;&nbsp;&nbsp;&nbsp;
    每页显示
    <select onchange="javascript:gotoPage(1)" name="page.pageSize">
      <option value="5">5</option>
      <option value="10">10</option>
      <option value="15">15</option>
      <option value="20">20</option>
      <option value="25">25</option>
      <option selected="" value="30">30</option>
    </select>
    条数据
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
