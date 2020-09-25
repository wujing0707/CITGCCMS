	<div class=" tit1 right_tit"><b>社会法人信用查询</b></div>
        <div class="pad10 pad_t50">
              <ul class="forminfo">
                <li>
                  <label>企业名称</label>
                  <input name="" id="companyname" type="text" class="dfinput" />
                </li>
                <li>
                  <label>工商注册号</label>
                  <input id="gszch" name="" type="text" class="dfinput" />
                </li>
                <li>
                  <label>组织机构代码</label>
                  <input id="zzjgdm" name="" type="text" class="dfinput" value="" />
                </li>
                <li>
                  <label>验证码</label>
                  <input name="" type="text" id="validCode0" class="dfinput w200 f_l" value="" />
                  <input id="checkCodeID0" size="3" type="text" style="color: Red;font-family: Arial;font-style: italic;font-weight: bolder;letter-spacing: 3px;padding: 2px 3px;width:30;border:0;cursor:pointer; height:23; background-image: url('../html/images/QQ.jpg');font-size:18px" readonly="readonly" onclick="createCode(0)" >
                </li>
                <li>
                  <label>&nbsp;</label>
                  <input name="" onclick="validate(0,1);" type="button" class="btn" value="查 询"/>
                  <input name="" onclick="reset();" type="button" class="btn" value="重置"/>
                </li>
			</ul>
		 </div> 
