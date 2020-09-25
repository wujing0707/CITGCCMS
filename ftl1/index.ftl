<#include "/html1/top.html">
<!--content begin-->
<div class="wrap mt5">
	<div class="wrap">
    	<!--焦点图 begin-->
        <div class="yx-rotaion f_l">
            <ul class="rotaion_list">
            <#if sonChannelList_1??>
           		<#list sonChannelList_1?sort_by(["releaseTime"])?reverse as info>
                <#if info??&&info_index<4>
	            <li><a href="condetail${info.contentId?c}.html"><img src="${info.titleImg!}" alt="${info.title!}"></a></li>
                </#if>
                </#list>
            </#if>
            </ul>
        </div>
        <script type="text/javascript" src="js/jquery.yx_rotaion.js"></script>
        <script type="text/javascript">
        $(".yx-rotaion").yx_rotaion({auto:true});
        </script>
        <!--焦点图 over-->
        <div class="box ml5 f_l inbox1">
        	<h1>${fChannelName_2!} 
        	<#if sonChannleSize_2??>
	        	<#if sonChannleSize_2 lt 1&&sonChannleSize_2!=0>
	        		<a href="" class="arrow" title="更多"></a>
	        		<#else>
	        		<a href="content${fChannelId_2!}_1.html" class="arrow" title="更多"></a>
	        	</#if>
        	</#if>
        	</h1>
            <ul class="list pad10">
            <#if sonChannelList_2??>
            	<#list sonChannelList_2 as info>
            	  <#if info??>
            	  	<#if info_index<4>
	            	  	<#if sonChannleSize_2=1||sonChannleSize_2=0>
	            	  		<#if info.isTop==1>
	            			<li width="200px;"><a href="condetail${info.contentId?c}.html" title=""><font color="red">${info.title!}</font></a></li>
	            			<#else>
	            			<li width="200px;"><a href="condetail${info.contentId?c}.html" title="">${info.title!}</a></li>
	            			</#if>
	            		</#if>
		            	<#if sonChannleSize_2 gt 1>
			            	  <#assign contentId="${info.contentId?c!}" lanmuName="sslmName_2_"+contentId n=lanmuName?eval>
			            	  <#if info.isTop==1>
			                    <li width="200px;"><a href="condetail${info.contentId?c}.html" title=""><font color="red">[${n!}]${info.title!}</font></a></li>
			                    <#else>
			                    <li width="200px;"><a href="condetail${info.contentId?c}.html" title="">[${n!}]${info.title!}</a></li>
			                  </#if>
			            </#if>
			 	    </#if>
                  </#if>
                 </#list>
              </#if>
            </ul>
        </div>
        
        <div class="box f_r inbox1 sxjs">
        	<h1>${fChannelName_3!} 
        	<#if sonChannleSize_3??>
	        	<#if sonChannleSize_3 lt 1&&sonChannleSize_3!=0>
	        		<a href="" class="arrow" title="更多"></a>
	        		<#else>
	        		<a href="content${fChannelId_3!}_1.html" class="arrow" title="更多"></a>
	        	</#if>
        	</#if>
        	</h1>
            <ul class="list pad10">
            <#if sonChannelList_3??>
            	 <#list sonChannelList_3 as info>
            	  <#if info??>
            	  <#if info_index<4>
	        			<#if sonChannleSize_3=1||sonChannleSize_3=0>
	        			<#if info.isTop==1>
	            			<li><a href="condetail${info.contentId?c}.html" title=""><font color="red">${info.title!}</font></a></li>
	            			<#else>
	            			<li><a href="condetail${info.contentId?c}.html" title="">${info.title!}</a></li>
	            		</#if>
	            		</#if>
		            	<#if sonChannleSize_3 gt 1>
			            	  <#assign contentId="${info.contentId?c!}" lanmuName="sslmName_3_"+contentId n=lanmuName?eval>
			            	  <#if info.isTop==1>
			                    <li><a href="condetail${info.contentId?c}.html" title=""><font color="red">[${n!}]${info.title!}</font></a></li>
			                    <#else>
			                    <li><a href="condetail${info.contentId?c}.html" title="">[${n!}]${info.title!}</a></li>
			                  </#if>
			            </#if>
				 </#if>
                  </#if>
                 </#list>
            </#if>
            </ul>
        </div>
    </div>
    
    <div class="wrap mt5 in_menu">
        <a href="seach.html"><img src="images/icon1.png" /><br />信用查询</a>
        <a href="http://shixin.court.gov.cn/" class="bg_co2" target="_blank"><img src="images/icon2.png" /><br />法院失信被执行</a>
        <a href="http://xxgk.sipac.gov.cn/sipacjcy/SipacJCY/default.aspx" class="bg_co3" target="_blank"><img src="images/icon3.png" /><br />行贿犯罪档案</a>
        <a href="qycomplain.html" class="bg_co4"><img src="images/icon4.png" /><br />异议申诉</a>
        <a href="service.html" class="bg_co5" target="_blank"><img src="images/icon5.png" /><br />信用服务</a>
        <a href="#" class="bg_co6 none" target="_blank"><img src="images/icon6.png" /><br />中小企业信用服务网</a>
    </div>
    
    <div class="wrap mt5">
    	<div class="f_l">
            <div class="box inbox2 news">
                <h1>${fChannelName_4!}
                <#if sonChannleSize_4??>
		            <#if sonChannleSize_4 lt 1&&sonChannleSize_4!=0>
		        		<a href="" class="arrow" title="更多"></a>
		        		<#else>
		        		<a href="content${fChannelId_4!}_1.html" class="arrow" title="更多"></a>
		        	</#if>
	        	</#if>
        	</h1>
                <ul class="list pad10">
                <#if sonChannelList_4??>
	                  <#list sonChannelList_4 as info>
	            	  <#if info??>
	            	  <#if info_index<2>
				  		  <#if sonChannleSize_4=1||sonChannleSize_4=0>
			                 <#if info.isTop==1>
			                 <li><a style="width:230px;" href="condetail${info.contentId?c}.html"><font color="yellow">${info.title!}</font></a></li>
			                 <#else>
			                 <li><a style="width:230px;" href="condetail${info.contentId?c}.html">${info.title!}</a></li>
	            			 </#if>
			              </#if>
		            	  <#if sonChannleSize_4 gt 1>
			            	  <#assign contentId="${info.contentId?c!}" lanmuName="sslmName_4_"+contentId n=lanmuName?eval>
			            	  <#if info.isTop==1>
			                    <li><a style="width:230px;" href="condetail${info.contentId?c}.html" title=""><font color="yellow">[${n!}]${info.title!}</font></a></li>
			                    <#else>
			                    <li><a style="width:230px;" href="condetail${info.contentId?c}.html" title="">[${n!}]${info.title!}</a></li>
		                  	  </#if>
		                  </#if>
	                  </#if>
	                  </#if>
	                </#list>
                </#if>
                </ul>
            </div>
            <div class="box inbox2 mt5 policy">
                <h1>${fChannelName_7!}
                <#if sonChannleSize_7??>
	                <#if sonChannleSize_7 lt 1&&sonChannleSize_7!=0>
	        		<a href="" class="arrow" title="更多"></a>
	        		<#else>
	        		<a href="content${fChannelId_7!}_1.html" class="arrow" title="更多"></a>
	        		</#if>
        		</#if>
        	</h1>
                <ul class="list pad10">
                <#if sonChannelList_7??>
                <#list sonChannelList_7 as con>
		        	<#if con??>
		        		<#if con_index<2>
	        				<#if sonChannleSize_7=1||sonChannleSize_7=0>
	        				<#if con.isTop==1>
			                	<li><a style="width:230px;" href="condetail${con.contentId?c}.html"><font color="red">${con.title!}</font></a></li>
			                	<#else>
			                	<li><a style="width:230px;" href="condetail${con.contentId?c}.html">${con.title!}</a></li>
			                </#if>
			                </#if>
				            <#if sonChannleSize_7 gt 1>
			        			<#assign contentId="${con.contentId?c!}" lanmuName="sslmName_7_"+contentId n=lanmuName?eval>
			        			<#if con.isTop==1>
			                    <li><a style="width:230px;" href="condetail${con.contentId?c}.html" title=""><font color="red">[${n!}]${con.title!}</font></a></li>
			                    <#else>
			                    <li><a style="width:230px;" href="condetail${con.contentId?c}.html" title="">[${n!}]${con.title!}</a></li>
		                    	</#if>
		                    </#if>
		              	</#if>
		            </#if>
            	</#list>
            	</#if>
                </ul>
            </div>
        </div>
        <!--失信黑名单 begin-->
        <div class="box ml5 f_l blacklist">
        	<h1>${fChannelName_5!} 
        	<#if sonChannleSize_5??>
	        	<#if sonChannleSize_5 lt 1&&sonChannleSize_5!=0>
	        		<a href="" class="arrow" title="更多"></a>
	        		<#else>
	        		<a href="content${fChannelId_5!}_1.html" class="arrow" title="更多"></a>
	        	</#if>
        	</#if>
        	</h1>
            <ul class="list pad10">
            <#if sonChannelList_5??>
             <#list sonChannelList_5 as info>
            	<#if info??&&info_index<5>
    				<#if sonChannleSize_5=1||sonChannleSize_5=0>
    					<#if info.isTop==1>
                    	<li><a style="width:250px;" href="condetail${info.contentId?c}.html" title=""><font color="red">${info.title!}</font></a></li>
                    	<#else>
                    	<li><a style="width:250px;" href="condetail${info.contentId?c}.html" title="">${info.title!}</a></li>
	                    </#if>
                    </#if>
                    <#if sonChannleSize_5 gt 1>
                        <#assign contentId="${info.contentId?c!}" lanmuName="sslmName_5_"+contentId n=lanmuName?eval>
                        <#if info.isTop==1>
           				<li><a style="width:250px;" href="condetail${info.contentId?c}.html" title=""><font color="red">[${n!}]${info.title!}</font></a></li>
           				<#else>
           				<li><a style="width:250px;" href="condetail${info.contentId?c}.html" title="">[${n!}]${info.title!}</a></li>
           				</#if>
		            </#if>
            	</#if>
             </#list>
        	</#if>
            </ul>
        </div>
        <!--失信黑名单 over-->
        <div class="f_r">
        	<div class="box inbox3 fund">
                <h1>${fChannelName_6!}
                <#if sonChannleSize_6??>
	                <#if sonChannleSize_6 lt 1&&sonChannleSize_6!=0>
	        		<a href="" class="arrow" title="更多"></a>
	        		<#else>
	        		<a href="content${fChannelId_6!}_1.html" class="arrow" title="更多"></a>
	        		</#if>
        		</#if>
        	</h1>
                <ul class="list pad10">
                <#if sonChannelList_6??>
                    <#list sonChannelList_6 as info>
            			<#if info_index<2>
	            			<#if sonChannleSize_6=1||sonChannleSize_6=0>
	            			<#if info.isTop==1>
	                        	<li><a style="width:350px;" href="condetail${info.contentId?c}.html" title=""><font color="red">${info.title!}</font></a></li>
	                        	<#else>
	                        	<li><a style="width:350px;" href="condetail${info.contentId?c}.html" title="">${info.title!}</a></li>
	                        </#if>
	                        </#if>
	                        <#if sonChannleSize_6 gt 1>
		                        <#assign contentId="${info.contentId?c!}" lanmuName="sslmName_6_"+contentId n=lanmuName?eval>
		                        <#if info.isTop==1>
	               				<li><a style="width:350px;" href="condetail${info.contentId?c}.html" title=""><font color="red">[${n!}]${info.title!}</font></a></li>
	               				<#else>
	               				<li><a style="width:350px;" href="condetail${info.contentId?c}.html" title="">[${n!}]${info.title!}</a></li>
				            	</#if>
				            </#if>
                        </#if>
           			</#list>
           		</#if>
                </ul>
            </div>
        	<div class="mt5 clear">
                <div class="box inbox4 f_l">
                    <h1>${fChannelName_8!} 
                    <#if sonChannleSize_8??>
	                    <#if sonChannleSize_8 lt 1&&sonChannleSize_8!=0>
			        		<a href="" class="arrow" title="更多"></a>
			        		<#else>
			        		<a href="content${fChannelId_8!}_1.html" class="arrow" title="更多"></a>
			        	</#if>
		        	</#if>
		        	</h1>
                    <ul class="list pad10">
                    <#if sonChannelList_8??>
                    <#list sonChannelList_8 as info>
            			<#if info_index<2>
	            			<#if sonChannleSize_8=1||sonChannleSize_8=0>
	            			<#if info.isTop==1>
	                        	<li><a style="width:150px;" href="condetail${info.contentId?c}.html" title="">${info.title!}</a></li>
	                        	<#else>
	                        	<li><a style="width:150px;" href="condetail${info.contentId?c}.html" title="">${info.title!}</a></li>
	                        </#if>
	                        </#if>
			                <#if sonChannleSize_8 gt 1>
				              <#assign contentId="${info.contentId?c!}" lanmuName="sslmName_8_"+contentId n=lanmuName?eval>
				              <#if info.isTop==1>
           						<li><a style="width:150px;" href="condetail${info.contentId?c}.html" title=""><font color="red">[${n!}]${info.title!}</font></a></li>
           						<#else>
           						<li><a style="width:150px;" href="condetail${info.contentId?c}.html" title="">[${n!}]${info.title!}</a></li>
           					  </#if>
			                </#if>	
                        </#if>
           			</#list>
           			</#if>
                    </ul>
                </div>
                <div class="box inbox4 areas f_r">
                    <h1>${fChannelName_9!}
                    <#if sonChannleSize_9??>
			            <#if sonChannleSize_9 lt 1&&sonChannleSize_9!=0>
			        		<a href="" class="arrow" title="更多"></a>
			        		<#else>
			        		<a href="content${fChannelId_9!}_1.html" class="arrow" title="更多"></a>
			        	</#if>
		        	</#if>
		        	</h1>
                    <ul class="list pad10">
                    <#if sonChannelList_9??>
                        <#list sonChannelList_9 as info>
			            	<#if info_index<2>
			            		<#if sonChannleSize_9=1||sonChannleSize_9=0>
				            		<#if info.isTop==1>
					                	<li><a style="width:150px;" href="condetail${info.contentId?c}.html"><font color="red">${info.title!}</font></a></li>
					                	<#else>
					                	<li><a style="width:150px;" href="condetail${info.contentId?c}.html">${info.title!}</a></li>
					                </#if>
				                </#if>
				                <#if sonChannleSize_9 gt 1>
					              <#assign contentId="${info.contentId?c!}" lanmuName="sslmName_9_"+contentId n=lanmuName?eval>
					              <#if info.isTop==1>
               						<li><a style="width:150px;" href="condetail${info.contentId?c}.html" title=""><font color="red">[${n!}]${info.title!}</font></a></li>
               						<#else>
               						<li><a style="width:150px;" href="condetail${info.contentId?c}.html" title="">[${n!}]${info.title!}</a></li>
				                  </#if>
				                </#if>
			                </#if>
			            </#list>
			         </#if>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!--content over-->

<!--footer begin-->
<div class="wrap mt5">
	<div class="pad10 member f_l">
        <h1>成员单位</h1>
        <ul class="m_list pad10">
            <li><a href="#" target="_blank">成员单位成员单位成员单位</a></li>
            <li><a href="#" target="_blank">成员单位</a></li>
            <li><a href="#" target="_blank">成员单位</a></li>
            <li><a href="#" target="_blank">成员单位</a></li>
            <li><a href="#" target="_blank">成员单位</a></li>
            <li><a href="#" target="_blank">成员单位</a></li>
            <li><a href="#" target="_blank">成员单位</a></li>
            <li><a href="#" target="_blank">成员单位</a></li>
            <li><a href="#" target="_blank">成员单位</a></li>
            <li><a href="#" target="_blank">成员单位</a></li>
        </ul>
    </div>
	<div class="pad10 f_r link">
        <h1>友情链接</h1>
        <ul class="l_list pad10">
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
