<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <base href="<%=basePath%>">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	

	<title>东牧卫浴管理系统</title>
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	  <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="./assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
       <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="./assets/js/ie-emulation-modes-warning.js"></script>
    
	    <link rel="icon" href="./favicon.ico">
	<link href="./css/bootstrap.min.css" rel="stylesheet">
	<link href="./css/dashborad.css" rel="stylesheet">
  </head>
  
	 <frameset rows="80,*" cols="*" frameborder="No" border="0"  
        framespacing="1">  
        <frame  
            src="./IndexPart/top.jsp"  
            name="topFrame" scrolling="No" noresize="noresize" id="topFrame"  
            title="topFrame" />  
          
        <frameset cols="270,*" frameborder="No" border="0" framespacing="1">  
            <frame  
                src="./IndexPart/menu.jsp"  
                name="leftFrame" scrolling="No" noresize="noresize" id="leftFrame"  
                title="leftFrame" />  
            <frame  
                src="./IndexPart/nanlyse.jsp"  
                name="content" noresize="noresize" id="content" title="content" /> 
        </frameset>  
    </frameset> 
   <body>

    
         <script src="./js/echarts.js"></script> <!--echart图表-->
	     <script src="./js/index.js"></script> <!--idnexjs文件-->
         <script src="./js/jquery-3.2.1.min.js"></script> <!--idnexjs文件-->
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="./js/jquery-3.2.1.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="./js/bootstrap.min.js"></script><!--boostrap 标准库-->
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="../../assets/js/vendor/holder.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
