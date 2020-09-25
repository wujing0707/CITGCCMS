/*
 * 配置：
 * 1. 修改ueditor.config.js 中的路径
 * 2. 添加ueditor.jar 和commons-fileupload-1.2.2.jar 到lib更好
 * 3. 如果为strut2集成，则需要添加过滤器继承原有的过滤器，对imageUp.jsp进行过滤
 * 4. 如果单独使用工具类，则建议使用script的方式，不要使用input
 * 	  如下：
 *  <input id="upload" type="text" value=""/>
	<script id="myeditor"></script>
	<span  id="image">ddd</span>
	 单独使用时，不用渲染，获取editor即可。否则在ie会出问题。
   5. 如果只需要渲染，则直接调用render方法即可。
 * UEditor单独图片上传工具类
 */
//(function($){
	// 单张图片
	var image = {
		editor:null,
		init:function(editorid,keyid){
			var _editor =this.getEditor(editorid);
			_editor.ready(function () {
			    _editor.setDisabled();
			    _editor.hide();
			    _editor.addListener('beforeInsertImage', function (t, args) {
			    	if(typeof keyid == 'string')
			    		$("#"+keyid).attr("src", args[0].src);
			    	else{
			    		var _img = $(keyid).parent().find('img');
			    		$(_img).attr("src", args[0].src);
			    		$(keyid).parent().find('textarea').val(args[0].title);
			    	}
			    });
			});
		},
		getEditor:function(editorid){
			this.editor = UE.getEditor(editorid);
			return this.editor;
		},
		show:function(id){
			var _editor = this.editor;
           //注意这里只需要获取编辑器，无需渲染，如果强行渲染，在IE下可能会不兼容（切记）
           //和网上一些朋友的代码不同之处就在这里
			$("#"+id).click(function(){
				var image = _editor.getDialog("insertimage");
				image.render();
				image.open();
			});
		},
		render:function(editorid){
			var _editor = this.getEditor(editorid);
			_editor.render();
		}
	};
	
	// 多张图片
	var imageArray = {
		editor:null,
		init:function(editorid,keyid){
			var _editor =this.getEditor(editorid);
			_editor.ready(function () {
			    _editor.setDisabled();
			    _editor.hide();
			    _editor.addListener('beforeInsertImage', function (t, args) {
			    	$('#mainContent_img_div').find('div').remove();
					for(i = 0; i < args.length; i++)
						$('#mainContent_img_div').append("<div><img id='changeImg_img"+i+"' src='"+args[i].src+"' width='100px' height='100px' /><textarea rows='3' cols='30' >"+args[i].title+"</textarea><script id='changeImg_ed"+i+"'></script><input type='button' id='changeImg"+i+"' value='更换此图片' /></div>");
					// 添加图片后，增加修改功能
					var divs = $('#mainContent_img_div').find('div');
					//console.info(divs);
					for(i = 0; i < divs.length; i++){
						var imgId = $(divs[i]).children('img').attr('id');
						var scriptId = $(divs[i]).children('script').attr('id');
						var btnId = $(divs[i]).children('input').attr('id');
						/*console.info("imgId:"+imgId);
						console.info("scriptId:"+scriptId);
						console.info("btnId:"+btnId);*/
						image.init(scriptId, $(divs[i]).children('input'));
				        image.show(btnId);
					}
			    });
			});
		},
		getEditor:function(editorid){
			this.editor = UE.getEditor(editorid);
			return this.editor;
		},
		show:function(id){
			var _editor = this.editor;
           //注意这里只需要获取编辑器，无需渲染，如果强行渲染，在IE下可能会不兼容（切记）
           //和网上一些朋友的代码不同之处就在这里
			$("#"+id).click(function(){
				var image = _editor.getDialog("insertimage");
				image.render();
				image.open();
			});
		},
		render:function(editorid){
			var _editor = this.getEditor(editorid);
			_editor.render();
		}
	};
//})(jQuery);