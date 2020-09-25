<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-type" content="text/html"  charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
    <title></title>
  </head>
  <body>
</body>
<script>
var myDate=new Date()
var year = myDate.getYear();
var month = myDate.getMonth();
month = month + 1;
var day = myDate.getDate();
var count = year.toString()+month.toString()+day.toString();
window.location.href= count+"html2/index.html";
</script>
</html>
