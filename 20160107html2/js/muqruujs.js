var oMarquee = document.getElementById("mq"); //�������� 
var iLineHeight = 30; //���и߶ȣ����� 
var iLineCount = 10; //ʵ������ 
var iScrollAmount = 2; //ÿ�ι����߶ȣ����� 
function run() { oMarquee.scrollTop += iScrollAmount; if ( oMarquee.scrollTop == iLineCount * iLineHeight ) oMarquee.scrollTop = 0; if ( oMarquee.scrollTop % iLineHeight == 0 ) { window.setTimeout( "run()", 3000 ); } else { window.setTimeout( "run()", 10 ); } } oMarquee.innerHTML += oMarquee.innerHTML; window.setTimeout( "run()", 3000 );