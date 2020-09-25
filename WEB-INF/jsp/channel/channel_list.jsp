<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/cStyle.css"/>
<title>${sysBackTitle}</title>
<script type="text/javascript">
$(function() {
    $("#channelList").treegrid({
        height:450,
        nowrap: false,
        singleSelect: false,
        checkOnSelect: true,
        striped: true,
        fitColumns: true,
    	animate:"true",
    	onLoadSuccess:function(){},
        url: "${pageContext.request.contextPath}/channel/listChannels.action?channelId=${channel.channelId}",
        toolbar : [ {
			text : "新增",
			iconCls : "icon-add",
			handler : function() {
				gotoPage('/channel/channelDetail.action');
			}
		}
/* 		,{
			text : "删除",
			iconCls : "icon-remove",
			handler : function() {
				var checkItems = $('#channelList').datagrid('getChecked');
				var channelIds = "";
				$.each(checkItems, function (index, item) {
					channelIds +=  item.channelId + ",";
					alert(item.channelId);
				});
				channelIds = channelIds.substring(0, channelIds.length-1) ;
			}
		} */
		],
        loadMsg: "载入中...请等待.",
        idField: "channelId",
        treeField:"name",
        columns:[[
             {field: 'channelId', title:'ID', hidden: true,width:20}, 
            {field:"name",title:"栏目名称",width:90,
/*             	 formatter: function(value, rowData, index){
            		var path = "/channel/channelShow.action?channelId=" + rowData.channelId;
                 	var a = "<a href='javascript: gotoPage(\""  + path + "\")'>" + rowData.name + "</a>";
                   return a;
                 } */
            },
            {field:"priority",title:"优先级",width:20,align:"left"},
            {field:"description",title:"描述",width:50,align:"left"},
            {field:"keyword",title:"关键字",width:30,align:"left"},
        /**    {field:"isDisplay",title:"显示",width:10,
            	formatter:function(value) {
            	 if (value == 0) {
            			return "是";
            		} else {
            			return "否";
            		}
            	}	
            },*/
            {field:"edit",title:"操作选项",width:40,align:"left",
                formatter: function(value, rowData, index) {
                	if(rowData.channelId!=1){
                		var path = "/channel/channelDetail.action?channelId=" + rowData.channelId;
                		var str="";
                		if(rowData.islock==0)
                		//str = "<a  href='javascript:gotoPage(\""  + path + "\")' style='color: red;cursor:pointer;'>修改</a>&nbsp;&nbsp;"
                			str = "<a href='javascript:lock("+rowData.channelId+");' style='color: blue;cursor:pointer;'>解锁</a>";
                		else
                    	str = "<a  href='javascript:gotoPage(\""  + path + "\")' style='color: blue;cursor:pointer;'>修改</a>&nbsp;&nbsp;"
                    			+ "<a href='javascript:removeChannel(\"" + rowData.channelId + "\")' style='color: blue;cursor:pointer;'>删除</a>&nbsp;&nbsp;"
                    			+ "<a href='javascript:unLock("+rowData.channelId+");' style='color: blue;cursor:pointer;'>加锁</a>";
                    	return str;
                	}
                }
            }
        ]] ,
    });
    $(".treegrid-header-check").attr("disabled","disabled"); 
});

function gotoPage(path) {
	window.location.href = "${pageContext.request.contextPath}"  + path ;
}
function lock(channelid){
	$.messager.confirm("提示信息","确认解锁栏目吗？",function(r){
		if(r){
			$.post("${pageContext.request.contextPath}/channel/lockChannel.action",{channelid:channelid},function(data){
				if(data.result){
					$.messager.alert("成功", "栏目解锁成功！","info", function(r){
						window.location.reload();
			    	});
				}else{
					$.messager.alert('失败',"栏目解锁失败","error", function(r){});
				}
			},"json"); 
		}
	});
}
function unLock(channelid){
	$.messager.confirm("提示信息","确认加锁栏目吗？",function(r){
		if(r){
			$.post("${pageContext.request.contextPath}/channel/unlockChannel.action",{channelid:channelid},function(data){
				if(data.result){
					$.messager.alert("成功", "栏目加锁成功！","info", function(r){
						window.location.reload();
			    	});
				}else{
					$.messager.alert('失败',"栏目加锁失败","error", function(r){});
				}
			},"json");
		}
	});
}
function removeChannel(channelIds) {
	$.messager.confirm("提示信息","确认删除栏目吗？", function(r){
		if(r){
			$.post("${pageContext.request.contextPath}/channel/removeChannel.action",  {"channelIds" : channelIds},
				function(data) {
				if (data.result == true) {
					$.messager.alert("成功", "栏目删除成功！","info", function(r){
						window.location.reload();
				    });
				} else {
					if(data.message=="has")
					$.messager.alert('失败','请先删除子栏目!',"info", function(r){});
					else
					$.messager.alert('失败',data.message,"error", function(r){});
				}
			}, "json");
		}
	}); 
}

</script>
</head>
<body id="homepage" class="bodyBG">
	<div class="con" id="con">
		<div class="containTit">
			<span class="position">
				<div class="posiCon">栏目管理&nbsp;>>&nbsp;列表</div>
			</span> <span class="containTitext marB10">栏目管理</span>
		</div>	
			<div  style="padding: 10px;">
				<div class="cleardiv"></div>
				<div id="tab_zzjs_1">
					<span class="positon">
						<h3 class="h3Auto">
							 <a class="tabBbg" href="javascript:void(0);"><span>栏目列表</span>	</a>
						</h3>
					</span>
					<div class="padT23">
						<table id="channelList"></table>
					</div>
				</div>
			</div>
		
	</div>
</body>
</html>

