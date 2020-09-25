<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
    
    <!--center begin-->
    <div class="wrap mt10">
        <!--left begin-->
        <div class="leftbox f_l">
            <div class="left_menu">
                <h2>信用异议申诉</h2>
                <ul>
                    <li><a href="#" class="current">企业异议申诉</a></li>
                    <li><a href="qycomplainlist.html">企业异议申诉列表</a></li>
                    <li><a href="#">个人异议申诉</a></li>
                    <li><a href="#">个人异议申诉列表</a></li>
                </ul>
            </div>
            
        	<div class="left_link mt10">
                <a href="seach.html" target="_blank"><img src="images/icon1.png" /><br />信用查询</a>
            </div>
            
        </div>
        <!--left over-->
        <!--right begin-->
        <div class="right f_r">
            <div class="right_tit"><span>当前位置：<a href="#" target="_blank">首页</a> > 信用异议申诉 > <em>企业异议申诉</em></span></div>
            <div class="pad10">
                <ul class="forminfo">
                <li>
                <label>申诉人姓名</label>
                <input name="" type="text" class="dfinput color_grey" value="自动获取用户账号" />
                </li>
                <li>
                <label><b>*</b>申诉人电话</label>
                <input type="text" class="dfinput" value="必填" onclick="this.value='';" style="color:#c9c9c9;" id="" onfocus="if(this.value=='必填') {this.value='';}this.style.color='#333';" onblur="if(this.value=='') {this.value='必填';this.style.color='#c9c9c9';}">
                </li>
                <li>
                <label><b>*</b>申诉人Email</label>
                <input type="text" class="dfinput" value="必填" onclick="this.value='';" style="color:#c9c9c9;" id="" onfocus="if(this.value=='必填') {this.value='';}this.style.color='#333';" onblur="if(this.value=='') {this.value='必填';this.style.color='#c9c9c9';}">
                </li>
                <li>
                <label><b>*</b>申诉人单位</label>
                <input type="text" class="dfinput" value="必填" onclick="this.value='';" style="color:#c9c9c9;" id="" onfocus="if(this.value=='必填') {this.value='';}this.style.color='#333';" onblur="if(this.value=='') {this.value='必填';this.style.color='#c9c9c9';}">
                </li>
                <li>
                <label><b>*</b>申诉人地址</label>
                <input type="text" class="dfinput" value="必填" onclick="this.value='';" style="color:#c9c9c9;" id="" onfocus="if(this.value=='必填') {this.value='';}this.style.color='#333';" onblur="if(this.value=='') {this.value='必填';this.style.color='#c9c9c9';}">
                </li>
                <li>
                <label><b>*</b>申诉主题</label>
                <input type="text" class="dfinput" value="必填" onclick="this.value='';" style="color:#c9c9c9;" id="" onfocus="if(this.value=='必填') {this.value='';}this.style.color='#333';" onblur="if(this.value=='') {this.value='必填';this.style.color='#c9c9c9';}">
                </li>
                <li>
                <label><b>*</b>申诉内容</label>
                <textarea name="" cols="" rows="" class="textinput"></textarea>
                </li>
                <li>
                <label><b>*</b>上传材料</label>
                <input type="button" value="选择文件" class="fileinput">
                <i>附件大小不得超过2M，提供证明材料</i>
                <span>模板</span><a href="#" class="ml10">异议信息申请表.docx</a>
                </li>
                <li>
                <label>&nbsp;</label>
                <div class="in">
                <ul>
                    <li>经办人身份证.jpg<a href="#"> 删除</a><a href="#">查看</a></li>
                </ul>
                </div>
                </li>
                <li>
                <label>上传所需材料</label>
                <div class="in">
                1.异议信息申请表。<br />
                2.经办人身份证扫描件。（原件备查）<br />
                3.企业工商营业执照扫描件。（原件备查）<br />
                4.组织机构代码证扫描件。（原件备查）<br />
                5.相关证明材料扫描件。（原件备查）
                </div>
                </li>
                <li>
                <input name="" type="button" class="btn" value="提 交"/>
                <input name="" type="button" class="btn ml20" value="重 置"/>
                </li>
                </ul>
            </div> 
            
    
        </div>
        <!--right over-->
    </div>
    <!--center over-->
        
    <!--footer begin-->
    <div class="wrap mt10">
        <div class="link">
            <h1>友情链接</h1>
            <ul class="l_list">
                <li><a href="http://www.creditchina.gov.cn/" target="_blank">信用中国</a></li>
                <li><a href="http://www.js.gov.cn/jsxy/index.htm" target="_blank">诚信江苏</a></li>
                <li><a href="http://www.njcredit.gov.cn/" target="_blank">诚信南京</a></li>
                <li><a href="http://www.szcredit.gov.cn/" target="_blank">诚信苏州</a></li>
                <li><a href="http://credit.zjg.gov.cn/toIndex.action" target="_blank">诚信张家港</a></li>
            </ul>
        </div>
        
        <div class="foot">
            <p><span>主办单位：苏州工业园区信用办 </span><span>技术支持：江苏中集科技有限公司</span><span><script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1256639142'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s4.cnzz.com/z_stat.php%3Fid%3D1256639142' type='text/javascript'%3E%3C/script%3E"));</script></span></p>
        </div>
        
    </div>
    <!--footer over-->
</div>
<!--content over-->

<!--登录窗口begin -->
<div class="tip" style="display:block">
    <div class="tiptop"><span>登录</span><a></a></div>
    
    <div class="tipnr tc">
        <p>请先登录再进行申诉！</p>
          <ul class="forminfo">
            <li>
              <label>用户名</label>
              <input name="" type="text" class="dfinput w200" />
            </li>
            <li>
              <label>密码</label>
              <input name="" type="text" class="dfinput w200" />
            </li>
            <li>
            <input name="" type="button"  class="sure" value="确定" />&nbsp;
            <input name="" type="button"  class="cancel" value="取消" />
            </li>
          </ul>
    </div>
</div>
<!--登录窗口over -->
<!--提示窗口begin -->
<div class="tip">
    <div class="tiptop"><span>提示信息</span><a></a></div>
    
    <div class="tipnr tc">
        <p>您的申诉已提交成功！请耐心等待！</p>
    </div>
</div>
<!--提示窗口over -->
    
</body>
</html>
