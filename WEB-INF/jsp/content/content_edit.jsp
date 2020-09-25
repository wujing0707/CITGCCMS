<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${sysBackTitle} </title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/ueditor/themes/default/css/ueditor.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/cStyle.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/ztree/zTreeStyle/zTreeStyle.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.3.4/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/ueditor/ueditor.all.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/ueditor/ue.image.upload.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/ztree/jquery.ztree.core-3.5.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/ztree/jquery.ztree.excheck-3.5.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/json2.js"></script>

<script type="text/javascript">
var nodes=null;
    function getCheckedNodes(){
        var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
        nodes = treeObj.getCheckedNodes(true);
        var nodesArr = new Array();
        for(var i = 0; i < nodes.length; i++){
        	nodesArr[i] = nodes[i].id;
        }
        return nodesArr.toString();
    }
</script>

<script type="text/javascript">
var contentId,contentTypeId,channelId;
var category = '1'; // 默认为1
$(function() {
	init();
    initCombobox();
	initImgUpload();
	//initzTree();
});

function initzTree(){
	var setting = {
	        check: {
	            enable: true,
	            chkboxType: {
	                Y: '',
	                N: ''
	            }
	        },
	        data: {
	            simpleData: {
	                enable: true
	            }
	        }
	    };
    $.post("${pageContext.request.contextPath}/channel/listAllChannels.action", {}, function(data){
	    var zNodes = eval(data);
    	 // 选中栏目
        for(var i = 0; i < zNodes.length; i++){
            for(var j = 0; j < channelId.length; j++){
                if("" != channelId[j] && zNodes[i].id == parseInt(channelId[j]))
                    zNodes[i].checked = true;
            }
        }
        $.fn.zTree.init($("#treeDemo"), setting, zNodes);
    });
}

function initImgUpload(){
	// 标题图片上传
	image.init("titleImg_ed","titleImg_img");
    image.show("titleImg");
    // 内容图片上传（多张）
    imageArray.init("contentImg_ed");
    imageArray.show("contentImg");
    // 内容图片上传后的修改
	var divs = $('#mainContent_img_div').find('div');
    for(i = 0; i < divs.length; i++){
        var imgId = $(divs[i]).children('img').attr('id');
        var scriptId = $(divs[i]).children('script').attr('id');
        var btnId = $(divs[i]).children('input').attr('id');
        image.init(scriptId, $(divs[i]).children('input'));
        image.show(btnId);
    }
}
function init(){
	contentId = $('#hid_contentId').val();
	contentTypeId = $('#hid_contentTypeId').val();
	//channelId = $('#hid_channelId').val();
	category = $('#hid_category').val();
	if(category == '1'){
		$('#mainContent').show();
		$('#mainContent_img').hide();
	}else if(category == '2'){
		$('#mainContent').hide();
        $('#mainContent_img').show();
	}else{
		// 没得到分类信息，默认为文章
		$('#mainContent').show();
        $('#mainContent_img').hide();
	}
	// 标记是修改内容还是审核内容
	var isApprove = $('#isApprove').val();
	if(isApprove == 'true'){
		$('#submit_tr').hide();
        $('#approve_table').show();
	}else{
		$('#submit_tr').show();
        $('#approve_table').hide();
	}
	$('#parentId').combotree({
		//选择树节点触发事件  
	    onSelect : function(node) {  
	        //返回树对象  
	        var tree = $(this).tree;  
	        //选中的节点是否为叶子节点,如果不是叶子节点,清除选中  
	        $.post("isTopChannel.action",{channelId:node.id},function(data){
	    		var data = eval('(' + data + ')');  // change the JSON string to javascript object
	    		if(data.result){
		            //清除选中  
		            $('#parentId').combotree('clear');  
	    			$.messager.alert("操作提示", "该级栏目不可发布内容!","warning");
	    		}else{
	    			if(data.message=="0"){
	    				contentTypeId='4';	
	    			  $("#img_gallery").show();
	    			}
	    			else{
	    				contentTypeId='1';
	    				$("#titleImg_img").attr("src", "");
	    				$("#img_gallery").hide();	
	    			}
	    		}
	        });
	    }  
	});
}

function initCombobox(){
    if(channelId != ''){
	    $('#channel').combotree('setValue', channelId);
    }
	// 内容类型
	$("#contentType").combobox({
		width: 200,
		editable: false,
		panelHeight: "auto",
		mode: "remote",
		url: "${pageContext.request.contextPath}/contenttype/queryExistSimpleList.action",
		valueField: "id",
		textField: "text",
		onSelect: function(record){
			if(record.text == '头条' || record.text == '焦点'){
				$("#img_gallery").show();
			}else{
				$("#img_gallery").hide();
			}
		},
		onLoadSuccess: function(r){
			if(contentTypeId != ""){
	            $('#contentType').combobox('setValue', contentTypeId);
			}
			var text = $("#contentType").combobox("getText");
			if(text == '头条' || text == '焦点'){
		        $("#img_gallery").show();
		    }else{
		        $("#img_gallery").hide();
		    }
        }
	});
	
	$("#category").combobox({
		width: 200,
        editable: false,
        panelHeight: "auto",
        valueField: 'label',
        textField: 'value',
        data: [{
        	label: '1', value: "普通内容", selected: true
        },{
        	label: '2', value: "图片集内容"
        }],
        onSelect: function(record){
        	category = record.label;
        	if(record.label == '1'){
        		$('#mainContent').show();
                $('#mainContent_img').hide();
        	}else if(record.label == '2'){
        		$('#mainContent').hide();
                $('#mainContent_img').show();
        	}else{
        		$('#mainContent').show();
                $('#mainContent_img').hide();
        	}
        },
        onLoadSuccess: function(){
        	$('#category').combobox('setValue', category);
        }
	});
}

function back() {
    window.location.href = "${pageContext.request.contextPath}/content/toContents.action";
}

/**
 * 将tag标签过滤，不能以逗号开始和结束
 */
function tagFilter(sObj){
	var filterFlag = false;
	var str = $.trim($(sObj).val());
	var strFirst = str.slice(0, 1);
	var strLast = str.slice(str.length-1, str.length);
	if(strFirst == ','){
		str = str.substring(1, str.length);
		filterFlag = true;
	}
	if(strLast == ','){
		str = str.substring(0, str.length-1);
		filterFlag = true;
	}
    $(sObj).val(str);
    if(filterFlag){
    	tagFilter(sObj);
    }
}

/**
 * 替换 video 元素为 object 元素
 */
function replaceVideo(){
    var hasVideo = false;
    var width,height,src;
    var j_content = $(editor.getContent());
    var videoArr = $(j_content).find('video');
    // 循环将 video 元素替换成 object
    for(i = 0; i < videoArr.length; i++){
        var video = videoArr[i];
        width = $(video).attr('width');
        height = $(video).attr('height');
        src = $(video).attr('src')
        var obj = "<object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0' width='"+width+"' height='"+height+"'>    <param name='movie' value='${pageContext.request.contextPath}/static/flvplayer.swf' />    <param name='quality' value='high' />    <param name='allowFullScreen' value='true' />    <param name='FlashVars' value='vcastr_file="+src+"&BufferTime=3' />    <embed src='${pageContext.request.contextPath}/static/flvplayer.swf' allowfullscreen='true'         flashvars='vcastr_file="+src+"'         quality='high' pluginspage='http://www.macromedia.com/go/getflashplayer' type='application/x-shockwave-flash'         width='"+width+"' height='"+height+"'></embed>    </object>";

        var p = $(video).parent();
        $(p).empty();
        $(p).html(obj);
        hasVideo = true;
    }
    if(hasVideo){
        var html = '';
        for(i = 0; i < j_content.length; i++){
            html += $("<p>").append($(j_content[i]).clone()).html();
        }
        editor.setContent(html);   // 设置文本框中的内容
    }
}
//$(document).ready(function(){
 //   $("#title").focus();
//});
function reset(){
	$('.easyui-combotree').combotree("clear");
	$("#contentType").combobox("setValue", "");
	$("#title").val("");
	$("#shortTitle").val("");
	$("#origin").val("");
    $("#author").val("");
	$("#summary").val("");
	$("#contentTags").val("");
	$("#originUrl").val("");
	 var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
     var nodes = treeObj.getCheckedNodes(true);
     for(var i=0;i<nodes.length;i++){
    	 treeObj.checkAllNodes(false);
     }
}
function getHtmlInfo(s){
	s = s.replace(/&amp;/g, "&");  
    s = s.replace(/&nbsp;/g, " ");  
    s = s.replace(/&#39;/g, "'");          
    s = s.replace(/&lt;/g, "<");  
    s = s.replace(/&gt;/g, ">");  
    s = s.replace(/"<br>"/g, "\n");  
    s = s.replace(/"?D"/g, "—");  
    return s;  
}	
/**
 * 提交内容
 */
 var imagePath="";
function submitForm(){
	/**	if(contentTypeId=='4'&&'${content.titleImg }'==''){
		var oFile = document.getElementById('file');
		if(oFile.value == ""){
			$.messager.alert("操作提示", "请选择图片!","warning");
			return;
		}
	}*/
//	replaceVideo();
//	channleId = getCheckedNodes();
	var channleId = $('#parentId').combotree('getValue');
//	contentTypeId = $("#contentType").combobox("getValue");
	var title = $.trim($("#title").val());
	var keyWords = $.trim($("#keyWords").val());
	var description = $.trim($("#description").val());
	var nr = editor.getContent();
/**	var shortTitle = $.trim($("#shortTitle").val());
	var origin = $.trim($("#origin").val());
	var author = $.trim($("#author").val());
	var summary = $.trim($("#summary").val());
	var contentTags = $.trim($("#contentTags").val());
	var text = $("#category").combobox("getText");
	var originUrl = $.trim($("#originUrl").val());*/
   	var str = null;
   	    str = title.replace(/<\/?[^>]*>/g,''); //去除HTML tag
   	if(str!=title){
   	    $.messager.alert("操作提示", "标题名称含有非法字符!","warning");
		return;
   	}
    title = title.replace(/[ | ]*\n/g,'\n'); //去除行尾空白
    title = title.replace(/\n[\s| | ]*\r/g,'\n'); //去除多余空行
    title = title.replace(/&nbsp;/ig,'');//去掉&nbsp;
    title = title.replace(/'/g,'');
    title = title.replace(/"/g,'');
    if(name.length==0){
  	    $.messager.alert("操作提示", "标题无效!","warning");
		return;
    }
	if (channleId == '') {
		$.messager.alert("操作提示", "请选择栏目!", "warning");
		return;
	}
	if (title == '') {
		$.messager.alert("操作提示", "标题不能为空!", "warning");
		return;
	}
	if (title.length > 100) {
		$.messager.alert("操作提示", "标题长度不能超过100个字符!", "warning");
		return;
	}
	if (nr == '' && category == '1') {
		$.messager.alert("操作提示", "内容不能为空!", "warning");
		return;
	}
	if (nr.length >100000) {
		$.messager.alert("操作提示", "内容输入过长,不能超过100000个字符串", "warning");
		return;
	} 
	var url;
	if (contentId == "")
		url = "${pageContext.request.contextPath}/content/addContent.action";
	else
		url = "${pageContext.request.contextPath}/content/updateContent.action";
	$("#submit").attr("disabled", "disabled"); // 提交按钮不可用
	$.post(url, {
		contentId : contentId,
		contentTypeId : contentTypeId,
		channleId : channleId,
		title : getHtmlInfo(title),
		keyWords : keyWords,
		description : description,
//		shortTitle : $.trim($("#shortTitle").val()),
		isTop : "0", //$("#isTop")[0].checked?"1":"0",
//		contentTags : $.trim($("#contentTags").val()),
//		origin : $.trim($("#origin").val()),
//		originUrl : $.trim($("#originUrl").val()),
//		summary : $.trim($("#summary").val()),
//		author : $.trim($("#author").val()),
		category : category,
		isTop:'${content.isTop}',
//		contentPics : bulidContentPics(), // 调用该方法获取页面上上传的图片路径及描述
		titleImg :$("#titleImg_img").attr("src"), // 上传文件后，在获取路径，titleImg路径
		txt : editContent()
	}, function(data) {
		$("#submit").removeAttr("disabled"); // 回复提交按钮可用
		if (data.result) {
			$.messager.alert("成功", data.message, "info", function(r) {
				back();
			});
		} else
			$.messager.alert('失败', data.message, "error", function(r) {});
	}, "json");
}

function submitFormYL(){
	var channleId = $('#parentId').combotree('getValue');
	var title = $.trim($("#title").val());
	var keyWords = $.trim($("#keyWords").val());
	var description = $.trim($("#description").val());
	var nr = editor.getContent();
   	var str = null;
   	    str = title.replace(/<\/?[^>]*>/g,''); //去除HTML tag
   	if(str!=title){
   	    $.messager.alert("操作提示", "标题名称含有非法字符!","warning");
		return;
   	}
    title = title.replace(/[ | ]*\n/g,'\n'); //去除行尾空白
    title = title.replace(/\n[\s| | ]*\r/g,'\n'); //去除多余空行
    title = title.replace(/&nbsp;/ig,'');//去掉&nbsp;
    title = title.replace(/'/g,'');
    title = title.replace(/"/g,'');
    if(name.length==0){
  	    $.messager.alert("操作提示", "标题无效!","warning");
		return;
    }
	if (channleId == '') {
		$.messager.alert("操作提示", "请选择栏目!", "warning");
		return;
	}
	if (title == '') {
		$.messager.alert("操作提示", "标题不能为空!", "warning");
		return;
	}
	if (title.length > 100) {
		$.messager.alert("操作提示", "标题长度不能超过100个字符!", "warning");
		return;
	}
	if (nr == '' && category == '1') {
		$.messager.alert("操作提示", "内容不能为空!", "warning");
		return;
	}
	if (nr.length >100000) {
		$.messager.alert("操作提示", "内容输入过长,不能超过100000个字符串", "warning");
		return;
	} 
	var url = "${pageContext.request.contextPath}/content/queryPreview.action";
	var title=getHtmlInfo(title);
	var titleImg =$("#titleImg_img").attr("src");
	var txt=editContent();
	//var url="${pageContext.request.contextPath}/content/queryPreview.action?contentId="+contentId+"&contentTypeId="+contentTypeId+"&channleId="+channleId+"&title="+title+"&keyWords="+keyWords+"&description="+description+"&category="+category+"&titleImg="+titleImg+"&txt="+txt;
	//url=encodeURI(url);
	//url=encodeURI(url);

	$('#contentIdH').val(contentId);
	$('#contentTypeIdH').val(contentTypeId);
	$('#channleIdH').val(channleId);
	$('#titleH').val(title);
	$('#keyWordsH').val(keyWords);
	$('#descriptionH').val(description);
	$('#categoryH').val(category);
	$('#titleImgH').val(titleImg);
	$('#txtH').val(txt);
	window
	.open(
			"about:blank",
			"ylFormNewWin",
			'height=900,width=1000,top='
					+ (window.screen.availHeight - 30 - 900)
					/ 2
					+ ',left='
					+ (window.screen.availWidth - 10 - 1000)
					/ 2
					+ ',toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no'); //hiddenFormNewWin 是上面form的target
	$("#ylForm").submit();
}

	/**
	 * 内容编辑时，增加预览功能
	 */
	function previewTemp() {
		var txt = editContent();
		
		var shortTitle = $.trim($("#shortTitle").val());
		var title = $.trim($("#title").val());
		var author = $.trim($("#author").val());
		if (title == '') {
			$.messager.alert("操作提示", "标题不能为空!", "warning");
			return;
		}
		if (txt == '') {
			$.messager.alert("操作提示", "内容不能为空!", "warning");
			return;
		}
		$('#hiddenFormTitle').val(title);
		$('#hiddenFormAuthor').val(author);
		$('#hiddenFormTxt').val(txt);
		window
				.open(
						"about:blank",
						"hiddenFormNewWin",
						'height=900,width=1000,top='
								+ (window.screen.availHeight - 30 - 900)
								/ 2
								+ ',left='
								+ (window.screen.availWidth - 10 - 1000)
								/ 2
								+ ',toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no'); //hiddenFormNewWin 是上面form的target
		$("#hiddenForm").submit();

	}

	/**
	 * 编辑内容里的首行缩进格式问题
	 */
	function editContent() {
		var nr = editor.getContent();
		var x = nr.toLowerCase();
		var start = x.indexOf("font-size");
		if (nr == "" || start < 0)
			return nr;

		var s = x.substring(start);
		var size = s.substring(s.indexOf(":") + 1, s.indexOf("px"));
		return "<div style='font-size:" + size + "px;'>" + nr + "</div>";
	}
</script>
<script type="text/javascript">
/**
 * 创建图片集中的数据，返回 String 类型 json
 */
function bulidContentPics(){
	var contentPics = new Array();
	var obj_div = $('#mainContent_img_div > div');
	for(i = 0; i < obj_div.length; i++){
		var childrens = obj_div[i].children;
		var path = $(childrens[0]).attr('src');
		var desc = $(childrens[1]).val();
		var contentPic = new ContentPic(path, desc);
		contentPics.push(contentPic);
	}
	return JSON.stringify(contentPics);
}

// 定义contentPic对象
var ContentPic = function(sImgPath, sDescription){
	this.sImgPath = sImgPath || '';
    this.sDescription = sDescription || '' ;
    return {imgPath: this.sImgPath, description: this.sDescription};
}
</script>
<script type="text/javascript">
// 内容审核
function submitFormApprove(){
	replaceVideo();    // 如果内容中有 video 标签，则先进行转义一下
    var approve;
    var flag = false;
    if($("#approvePass").attr("checked"))
        approve = '1';
    else{
        approve = '0';
        flag = true;
    }
    if(approve == '1'){
    	flag = updateContentOfApprove();
    }
    if(flag == undefined){
    	return;
    }
    if(!flag){
    	$.messager.alert("操作提示", "审核失败!","warning");
    	return;
    }
    $.post('${pageContext.request.contextPath}/content/approveContent.action',
            {contentId: contentId, approve: approve, summary: $('#summary_approve').val()},
            function(data){
                if(data.result){
                	$.messager.alert("成功", data.message,"info", function(r){
    			    		back();
    			    });
                }else
                	$.messager.alert('失败',data.message, "error");
            },'json');
}

function radioClick(p){
    if (p == 0) {
        $("#approveNotPass").attr("checked", true);
        $("#approvePass").attr("checked", false);
    } else {
        $("#approvePass").attr("checked", true);
        $("#approveNotPass").attr("checked", false);
    }
}

function updateContentOfApprove(){
	var flagB = false;
	channleId = $("#hid_channelId").val();
    contentTypeId = $("#contentType").combobox("getValue");
    var title = $.trim($("#title").val());
    var nr = editor.getContent();
    if(channleId == ''){
    	$.messager.alert("操作提示", "请选择栏目!","warning");
        return;
    }
    if(title == ''){
    	$.messager.alert("操作提示", "标题不能为空!","warning");
        return;
    }
    if(nr == '' && category == '1'){
    	$.messager.alert("操作提示", "内容不能为空!","warning");
        return;
    }
    var url = "${pageContext.request.contextPath}/content/updateContent.action"
    
    $.ajax({type:"post",url:url,async:false,
    	data:{
            contentId: contentId,
            contentTypeId: contentTypeId,
            channleId: channleId,
            title: title,
            shortTitle: $.trim($("#shortTitle").val()),
            isTop: "0",// $("#isTop")[0].checked?"1":"0",
            contentTags: $.trim($("#contentTags").val()),
            origin: $.trim($("#origin").val()),
            originUrl: $.trim($("#originUrl").val()),
            summary: $.trim($("#summary").val()),
            author: $.trim($("#author").val()),
            category: category,
            contentPics: bulidContentPics(),    // 调用该方法获取页面上上传的图片路径及描述
            titleImg: $("#titleImg_img").attr("src"),   // 上传文件后，在获取路径，titleImg路径
        //    titleImg: $("#imgFile").val()),  // 上传文件后，在获取路径，titleImg路径
            txt: editContent(),
            isApproveUpdate: '1'    // 标识为是否是审核时的内容更新，审核时内容更新不需要更新操作记录
          },
    	dataType:"json",
    	success:function(data){
    		if(data.result)
                flagB = true;
            else
                flagB = false;
        }  
    });
    
    return flagB;
}
//ajax 实现文件上传 
function ajaxFileUpload() {
	$.ajaxFileUpload({
		url:'${pageContext.request.contextPath}/content/upload.action',  
        secureuri:false,  
        fileElementId:'file',  
        dataType: 'json',  
        type : "post" ,
        success: function (data, status){
        	imagePath=data.filePath;
        	 $("#titleImg_img").attr("src", imagePath);
        },  
        error: function (data, status, e){  
        }  
	});
}
</script>
<title>内容管理</title>
</head>
<body class="bodyBG">
    <div class="con" id="con">
         <div class="containTit">
            <span class="position">
                <div class="posiCon">内容管理&nbsp;>>&nbsp;列表</div>
            </span>
            <span class="containTitext marB10">内容管理</span>
            <!-- 页面隐藏域 -->
            <c:choose>
                <c:when test="${content eq null}">
                    <input type="hidden" id="hid_category" value="${category}" />
                </c:when>
                <c:otherwise>
                    <input type="hidden" id="hid_category" value="${content.category}" />
                </c:otherwise>
            </c:choose>
            <input type="hidden" id="hid_contentId" value="${content.contentId}"/>
            <input type="hidden" id="hid_contentTypeId" value="${content.contentType.contentTypeId}"/>
            <input type="hidden" id="hid_channelId" value="${contentChannels}"/>
            <!-- 页面隐藏域 -->
       <div id="tab_zzjs_1">
                <span class="positon">
                    <h3 class="h3Auto"> <a class="tabBbg" href="javascript:void(0);"> <span>内容管理</span> </a> </h3>
                </span>
                <div class="padT23">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table4">
       <tr>
           <th align="right" nowrap="nowrap"><font color="red">*</font>栏目：</th>
           <td colspan="3">
           <input class="easyui-combotree" name="parentId" id="parentId" size="30" value="${contentChannels}" data-options=" url: ' ${pageContext.request.contextPath}/channel/listChannels.action' " >
            
<%--             <input id="channel" class="easyui-combotree" data-options="width:200,url:'${pageContext.request.contextPath}/channel/listChannels.action'" >&nbsp;（必填） --%>
           </td>
           <%-- <th align="right">是否置顶：</th>
           
           <td><input type="checkbox" id="isTop" 
            <c:if test="${content.isTop == 1 }">checked="checked"</c:if>
             />置顶</td> --%>
       </tr>
       <tr>
           <th align="right"><font color="red">*</font>标题：</th>
           <td colspan="3"><input name="title" id="title" type="text" size="50"  class="easyui-validatebox" validType="null" value="${content.title }" required="required" missingMessage="标题不能为空！" maxlength="40" onblur=""/>&nbsp;（必填）</td>
       </tr>
      <tr>
           <th align="right">关键字：</th>
           <td colspan="3"><input name="keyWords" id="keyWords" maxlength="50" value="${content.keyWords}" class="easyui-validatebox validatebox-text"/></td>
       </tr>
       <tr>
           <th align="right">描述：</th>
           <td colspan="3"><input name="description" id="description" maxlength="50" value="${content.description}" class="easyui-validatebox validatebox-text" /></td>
       </tr>
<%--        <tr style="display: none">
           <th align="right"><font color="red"></font>简短标题：</th>
           <td><input id="shortTitle" type="text" size="50" value="${content.shortTitle }"  maxlength="23"/></td>
           <th align="right"><font color="red"></font>Tag标签：</th>
           <td>
            <input id="contentTags" type="text" value="${contentTags }" class="easyui-validatebox" data-options="validType:'length[0,100]'" onchange="tagFilter(this);" size="32"/>注：每个tag请用英文“,”分隔
           </td>
       </tr>
       <tr style="display: none">
           <th align="right"><font color="red"></font>来源：</th>
           <td>
           <input id="origin" type="text" value="${content.origin }" maxlength="23" size="32"/>
           </td>
           <th align="right">URL：</th>
           <td><input id="originUrl" type="text" value="${content.originUrl }" maxlength="100" size="32"/></td>
       </tr>
       <tr style="display: none">
           <th align="right"><font color="red"></font>作者：</th>
           <td>
           <input id="author" type="text" value="${content.author }" maxlength="40" size="32"/>
           </td>
           <th align="right"><font color="red"></font>内容类别：</th>
           <td>
                <select id="category"></select>
           </td>
       </tr>
       <tr style="display: none">
           <th align="right">摘要：</th>
           <td colspan="3"><textarea id="summary" class="easyui-validatebox" data-options="validType:'length[0,500]'" rows="3" cols="80" >${content.summary }</textarea></td>
       </tr>--%>
       <tr style="display: none">
           <th align="right"><font color="red"></font>内容类型：</th>
           <td>
                <select id="contentType"></select>
           </td>
       </tr>
       <tr id="img_gallery" style="display: none" >
           <th style="display: none" align="right"><font color="red">*</font>标题图片：</th>
           <td style="display: none" colspan="3">
            <img id="titleImg_img" alt="" src="${content.titleImg }" width="100px" height="100px" />
            <script id="titleImg_ed"></script>
           <!-- <input type="button" id="titleImg" value="上传标题图片" /> 
             选择图片:<input name="file" id="imgFile" type="file" value="上传标题图片" /> -->
             <input type="file" id="file" name="file" value="" onchange="ajaxFileUpload();"/>
           </td>
       </tr>
       <tr id="mainContent" style="display: none;">
           <th align="right"><font color="red">*</font>内容：</th>
           <td colspan="3">
           <script id="container" name="content" type="text/plain"
                style="width:900px;height:240px;">${content.txt}</script>
           <script type="text/javascript">
               var editor;
               $(function(){
            	   editor = UE.getEditor('container',{
            	     textarea:'content',
            	     initialFrameHeight:320,
            	     autoHeightEnabled: true,
            	     autoFloatEnabled: true
            	   });
            	 });
           </script>&nbsp;（必填）</td>
       </tr>
       <tr>
       <c:if test="${addorUp!='1' }">
           <th align="right">审核备注：</th>
           <td>
                <textarea id="summary_approve" rows="3" cols="50" readonly="readonly">${content.summary}</textarea>
           </td>
           </c:if>
       </tr>
       <tr id="mainContent_img" >
           <th align="right"><font color="red">*</font>
                        内容图片：
           </th>
           <td colspan="3" >
           <script id="contentImg_ed"></script>
           <input type="button" id="contentImg" class="easyui-validatebox" class="easyui-validatebox" validType="fileType['BMP|GIF|JPG|JPEG|ICO|PNG|TIF']" required="true" invalidMessage="请选择(BMP|GIF|JPG|JPEG|ICO|PNG|TIF)等格式的图片" value="上传内容图片" />
           注：内容图片及描述请在弹出对话框中编辑。确认后，如要重新更换图片，会将之前的图片全部替换！
           <div id="mainContent_img_div">
           <c:forEach items="${content.contentPictures}" var="cp" varStatus="status">
	            <div>
	            <img id='changeImg_img${status.count }' src='${cp.imgPath }' width='100px' height='100px' />
	            <textarea rows='3' cols='30' >${cp.description }</textarea>
	            <script id='changeImg_ed${status.count }'></script>
	            <input type='button' id='changeImg${status.count }' value='更换此图片' />
	            </div>
           </c:forEach>
           </div>
           </td>
       </tr>
        <tr id="submit_tr">
                    <th colspan="4">
                    
                        <div style="padding:10px;">
                        	<input id="submit" type="button" value="预览" class="btnSearch" onmouseout="this.className='btnSearch'" onmouseover="this.className='btnSearch1'" onclick="submitFormYL();"/>&nbsp;&nbsp;
                            <input id="submit" type="button" value="提交" class="btnSearch" onmouseout="this.className='btnSearch'" onmouseover="this.className='btnSearch1'" onclick="submitForm();"/>&nbsp;&nbsp;
                            <input type="button" value="返回" class="btnSearch" onmouseout="this.className='btnSearch'" onmouseover="this.className='btnSearch1'" onclick="back();"/>
                        </div>
                    </th>
        </tr>
       </table>
       <table id="approve_table" style="display: none;" width="100%" border="0" cellspacing="0" cellpadding="0" class="table4">
	        <tr>
	            <th>审核：</th>
	            <td>
	            <input type="hidden" id="contentId" value="${contentId}" />
	                <input type="radio" id="approvePass" checked="checked" onclick="radioClick(1);"/>通过
	                <input type="radio" id="approveNotPass" onclick="radioClick(0);"/>拒绝
	            </td>
	        </tr>
	        <tr>
	        	
		            <th>审核备注：</th>
		            <td>
		                <textarea id="summary_approve" rows="3" cols="50">${addorUp}</textarea>
		            </td>
	        </tr>
	        <tr>
	            <th colspan="2">
	                <div style="padding:10px;">
	                    <input id="submit" type="button" value="提交" class="btnSearch" onmouseout="this.className='btnSearch'" onmouseover="this.className='btnSearch1'" onclick="submitFormApprove();"/>&nbsp;&nbsp;
	                    <input type="button" value="重置" class="btnSearch" onmouseout="this.className='btnSearch'" onmouseover="this.className='btnSearch1'" 
	                    onclick="javascript:window.location.href=window.location.href;"/>&nbsp;&nbsp;
	                    <input type="button" value="返回" class="btnSearch" onmouseout="this.className='btnSearch'" onmouseover="this.className='btnSearch1'" onclick="back();"/>
	                </div>
	            </th>
	        </tr>
	    </table>
                </div>
            </div>
        </div>
    </div>
<input type="hidden" id="isApprove" value="${isApprove}" />
<!-- 编辑时，预览提交form -->
<form id="hiddenForm" target="hiddenFormNewWin" method="post" style="display: none;" action="${pageContext.request.contextPath}/content/queryOfPreviewTemp.action">
    <input type="text" id="hiddenFormTitle" name="hiddenFormTitle" value="" />
    <input type="text" id="hiddenFormTime" name="hiddenFormTime" value="" />
    <input type="text" id="hiddenFormAuthor" name="hiddenFormAuthor" value="" />
    <textarea id="hiddenFormTxt" name="hiddenFormTxt" rows="" cols=""></textarea>
</form>

<form id="ylForm" target="ylFormNewWin" method="post" style="display: none;" action="queryPreview.action">
    <input type="text" id="contentIdH" name="contentIdH" value="" />
    <input type="text" id="contentTypeIdH" name="contentTypeIdH" value="" />
    <input type="text" id="channleIdH" name="channleIdH" value="" />
    <input type="text" id="titleH" name="titleH" value="" />
    <input type="text" id="keyWordsH" name="keyWordsH" value="" />
    <input type="text" id="descriptionH" name="descriptionH" value="" />
    <input type="text" id="categoryH" name="categoryH" value="" />
    <input type="text" id="titleImgH" name="titleImgH" value="" />
    <textarea id="txtH" name="txtH" rows="" cols=""></textarea>
</form>
</body>
</html>