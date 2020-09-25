<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${content.title!}</title>
<meta content="中集,网络发布,管理平台" name="keywords">
	<link type="text/css" rel="stylesheet" href="/html/css/cStyle.css">
		<script type="text/javascript" src="/html/js/Conheight.js"></script>
		<script type="text/javascript">
			/**
			 * 幻灯片播放
			 */
			(function($) {
				$.fn
						.extend({
							yx_rotaion : function(options) {
								//默认参数
								var defaults = {
									/**轮换间隔时间，单位毫秒*/
									during : 3000,
									/**是否显示左右按钮*/
									btn : true,
									/**是否显示焦点按钮*/
									focus : true,
									/**是否显示标题*/
									title : true,
									/**是否自动播放*/
									auto : true
								}
								var options = $.extend(defaults, options);
								return this
										.each(function() {
											var o = options;
											var curr_index = 0;
											var $this = $(this);
											var $li = $this.find("li");
											var li_count = $li.length;
											$this
													.css({
														position : 'relative',
														overflow : 'hidden',
														width : $li.find("img")
																.width(),
														height : $li
																.find("img")
																.height()
													});
											$this.find("li").css({
												position : 'absolute',
												left : 0,
												top : 0
											}).hide();
											$li.first().show();
											$this
													.append('<div class="yx-rotaion-btn"><span class="left_btn"><\/span><span class="right_btn"></span><\/div>');
											if (!o.btn)
												$(".yx-rotaion-btn").css({
													visibility : 'hidden'
												});
											if (o.title)
												$this
														.append(' <div class="yx-rotation-title"><\/div><a href="" class="yx-rotation-t" target="blank"><\/a>');
											if (o.focus)
												$this
														.append('<div class="yx-rotation-focus"><\/div>');
											var $btn = $(".yx-rotaion-btn span"), $title = $(".yx-rotation-t"), $title_bg = $(".yx-rotation-title"), $focus = $(".yx-rotation-focus");
											//如果自动播放，设置定时器
											if (o.auto)
												var t = setInterval(function() {
													$btn.last().click()
												}, o.during);
											$title.text($li.first().find("img")
													.attr("alt"));
											$title.attr("href", $li.first()
													.find("a").attr("href"));

											// 输出焦点按钮
											for (i = 1; i <= li_count; i++) {
												$focus.append('<span>' + i
														+ '</span>');
											}
											// 1.8版本及之前版本，兼容IE6透明图片（jQuery1.8版可以用“$.browser” jQuery1.9版以后改成了“$.support”）
											/*if($.browser.msie && $.browser.version == "6.0" ){
											   $btn.add($focus.children("span")).css({backgroundImage:'url(images/ico.gif)'});
											}*/
											// 1.9版本之后兼容IE6透明图片
											if ('undefined' == typeof (document.body.style.maxHeight)) {
												$btn
														.add(
																$focus
																		.children("span"))
														.css(
																{
																	backgroundImage : 'url(images/ico.gif)'
																});
											}
											var $f = $focus.children("span");
											$f.first().addClass("hover");
											// 鼠标覆盖左右按钮设置透明度
											$btn.hover(function() {
												$(this).addClass("hover");
											}, function() {
												$(this).removeClass("hover");
											});
											//鼠标覆盖元素，清除计时器
											$btn
													.add($li)
													.add($f)
													.hover(
															function() {
																if (t)
																	clearInterval(t);
															},
															function() {
																if (o.auto)
																	t = setInterval(
																			function() {
																				$btn
																						.last()
																						.click()
																			},
																			o.during);
															});
											//鼠标覆盖焦点按钮效果
											$f
													.bind(
															"mouseover",
															function() {
																var i = $(this)
																		.index();
																$(this)
																		.addClass(
																				"hover");
																$focus
																		.children(
																				"span")
																		.not(
																				$(this))
																		.removeClass(
																				"hover");
																$li
																		.eq(i)
																		.fadeIn(
																				300);
																$li
																		.not(
																				$li
																						.eq(i))
																		.fadeOut(
																				300);
																$title
																		.text($li
																				.eq(
																						i)
																				.find(
																						"img")
																				.attr(
																						"alt"));
																curr_index = i;
															});
											//鼠标点击左右按钮效果
											$btn
													.bind(
															"click",
															function() {
																$(this).index() == 1 ? curr_index++
																		: curr_index--;
																if (curr_index >= li_count)
																	curr_index = 0;
																if (curr_index < 0)
																	curr_index = li_count - 1;
																$li
																		.eq(
																				curr_index)
																		.fadeIn(
																				300);
																$li
																		.not(
																				$li
																						.eq(curr_index))
																		.fadeOut(
																				300);
																$f
																		.eq(
																				curr_index)
																		.addClass(
																				"hover");
																$f
																		.not(
																				$f
																						.eq(curr_index))
																		.removeClass(
																				"hover");
																$title
																		.text($li
																				.eq(
																						curr_index)
																				.find(
																						"img")
																				.attr(
																						"alt"));
																$title
																		.attr(
																				"href",
																				$li
																						.eq(
																								curr_index)
																						.find(
																								"a")
																						.attr(
																								"href"));
															});

										});
							}
						});

			})(jQuery);

			$(function() {
				$(".yx-rotaion").yx_rotaion({
					auto : true
				});
			})
		</script>
</head>

<body>
	<div class="con" id="con">
		<div class="containTit">
			<span class="position">
				<div class="posiCon">
					<a href="标签页列表.html">各种格式</a> >> <a href="正文.html">正文</a>
				</div>
			</span> <span class="containTitext">正文</span>
			<div class="cleardiv"></div>
		</div>
		<div id="tab_zzjs_1">
			<span class="positon">
				<h3 class="h3Auto">
					<a href="#" class="tabBbg"> <span>正文</span>
					</a>
				</h3>
			</span>
			<div class="padT23">
				<div class="writings_box">
					<table class="writings_boxTop" width="100%" cellspacing="6"
						cellpadding="0" border="0" style="border-collapse: inherit;">
						<tbody>
							<tr nowrap="nowrap">
								<th class="bold font18" nowrap="nowrap" align="center"
									colspan="6">${content.title!}</th>
							</tr>
							<tr nowrap="nowrap" class="font12">
								<td width="44%"></td>
								<td width="3%" nowrap="nowrap" align="center">作者：${content.author!}</td>
								<td width="3%" nowrap="nowrap" align="center">${content.releaseTime!}</td>
								<td width="3%" nowrap="nowrap" align="center">字号： <a
									href="#">大</a> <a href="#">中</a> <a href="#">小</a></td>
								<td width="44%"></td>
							</tr>
						</tbody>
					</table>
					<div class="writings_con">
						<div class="yx-rotaion">
							<ul class="rotaion_list">
								<#list pictures as picture>
								<li><img src="${picture.imgPath!}" width="324" height="315"
									alt="${picture.description!}" /></li> </#list>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>