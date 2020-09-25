function resize(){
	var width = 1000;
	var width1 = 1000;
	var height = 800;
	var height1 = 800;
	if ((navigator.userAgent.indexOf('MSIE') >= 0) && (navigator.userAgent.indexOf('Opera') < 0)) {//判断是否IE
		width = document.documentElement.clientWidth - 76;//75左栏+12右距+17滑轮
		width1 = document.documentElement.clientWidth - 87;//75+12
		height = document.documentElement.clientHeight - 42;//41top高+1边
		height1 = document.documentElement.clientHeight - 54;//41+1+12下距
	} else if ((navigator.userAgent.indexOf('Firefox') >= 0) || (navigator.userAgent.indexOf('Opera') >= 0) || (navigator.userAgent.indexOf('Chrome') >= 0)) {//判断是否FF或Opera或Chrome
//		alert("height="+window.innerHeight);
		width = window.innerWidth - 76;
		width1 = window.innerWidth - 87;
		height = window.innerHeight - 42;
		height1 = window.innerHeight - 54;
	}	
	//alert(window.innerHeight+"--------"+height);
	document.getElementById('leftmenu').style.height = height+"px";
	//document.getElementById('contain').style.height = height1+"px";
//	document.getElementById('menuBox1').style.height = height+"px";
//	document.getElementById('menuBox2').style.height = height+"px";
//	document.getElementById('menuBox3').style.height = height+"px";
//	document.getElementById('menuBox4').style.height = height+"px";
	document.getElementById('menuBox5').style.height = height+"px";
	document.getElementById('menuBox6').style.height = height+"px";
	document.getElementById('menuBox7').style.height = height+"px";
	document.getElementById('menuBox8').style.height = height+"px";
//	document.getElementById('menuTwo1').style.height = height+"px";
//	document.getElementById('menuTwo2').style.height = height+"px";
//	document.getElementById('menuTwo3').style.height = height+"px";
//	document.getElementById('menuTwo4').style.height = height+"px";
	document.getElementById('menuTwo5').style.height = height+"px";
	document.getElementById('menuTwo6').style.height = height+"px";
	document.getElementById('menuTwo7').style.height = height+"px";
	document.getElementById('menuTwo8').style.height = height+"px";
	
	document.getElementById('iframeCon').style.width = width+"px";
	document.getElementById('iframeCon').style.height = height+"px";
	//document.getElementById('contain').style.width = width1+"px";
	window.onresize = resize;
}
window.setInterval("resize()", 200);
