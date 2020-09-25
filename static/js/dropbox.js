

var mySel = document.getElementById("mySel");
var mySelInput = document.getElementById("mySelInput");
var mySelButton = document.getElementById("mySelButton");
var mySelList = document.getElementById("mySelList");
var mySelOpts = mySelList.getElementsByTagName("a");
for(i=0,l=mySelOpts.length;i<l;i++){
    mySelOpts[i].onclick = function(){
        mySelInput.value = this.innerHTML;
        window.location=this.href;
        hideOptions();
        return false;
    }
}
function showOptions () {
 mySelList.style.display='block';
}
function hideOptions () {
 mySelList.style.display='none';
}
document.onclick = function(e){
 var evt = e?e:window.event;
 var ele = evt.srcElement || evt.target;
 if(ele.id == 'mySelInput' || ele.id == 'mySelButton'){
  showOptions();
 }else{
  hideOptions();
 }
}// JavaScript Document