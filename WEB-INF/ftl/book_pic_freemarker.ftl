<html>
<head>
<#import "/common/app.ftl" as app>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>书画摄影作品赏析模板</title>  
<link href="${app.basePath}/html/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${app.basePath}/html/js/jquery-1.10.2.min.js"></script>
</head>
<body>
    <div id="container">
    	<#include "/common/top.ftl">
        <div class="detailPage">
            <div class="positionBg">
                <span class="txt">当前位置：${content.title}</span>
            </div>
            <div class="detailContent">
                <h1>${content.title}</h1>
                <div class="detailLine"></div>
                <div class="textM">
              <#if content.releaseTime??>【 发布日期：${(content.releaseTime)?if_exists} 】</#if>
              <#if content.originUrl??>【 出处：${content.originUrl} 】 </#if>    
                </div>
                <#if content.titleImg??>
                	<p class="textM">
	                	<img class="marginB9" src="${(content.titleImg)?if_exists}" width="640px" height="465px"/>
	               </p>
                </#if>	                   
                <!--     <p class="textM">

                </p>  -->             
            </div>
        </div>
        <#include "/common/foot.ftl">
    </div>
</body>
</html>
