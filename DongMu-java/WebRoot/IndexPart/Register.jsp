<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import="com.minajiale.database.*" %>
<%@page import="java.sql.*" %>
  <%@  page import = "javax.swing.JOptionPane" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html lang="en">
  <head>
  	 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
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
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<link href="../css/dashborad.css" rel="stylesheet">
	  <link href="../css/signin.css" rel="stylesheet">
  </head>

  <body>

    <div class="container">

      <form class="form-signin" action="./Register.jsp" method="post">
        <h2 class="form-signin-heading">请注册</h2>
        <label for="name" class="sr-only" >请输入您真实姓名</label>
        <input type="name" id="inputEmail" class="form-control" placeholder="请输入您真实姓名" name="name" required autofocus><br>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" class="form-control"name="passwd" placeholder="密码" required>
          <label for="phone" class="sr-only">phone</label>
        <input type="phone" id="phone" class="form-control" placeholder="请输入您的电话" name="phone" required>
        <label for="power" class="sr-only">您的身份</label>
        <br>
        <select name="power">
            <option value ="2">店员</option>
  			<option value ="1">管理员</option>
		</select>
		<br><br>
        <button class="btn btn-lg btn-primary btn-block" type="submit">注册</button>
      </form>
      
      <%
      	request.setCharacterEncoding("utf-8");
		String username = request.getParameter("name");
		String pwd = request.getParameter("passwd");
		String phone = request.getParameter("phone");
		String power = request.getParameter("power");
		
        if((username!=null)&&(username!="")&&(pwd!=null)&&(pwd!="")&&(phone!=null)&&(phone!="")&&(power!=null)&&(power!="")){
       
			Connection conn = DBConnection.getConnection();
		   PreparedStatement pstmt = null;
			String SQLString="insert into people(name,power,password,phone) values(?,?,?,?)";//查询该用户是否曾经登陆过
		   try{
		      pstmt = conn.prepareStatement(SQLString);
		   	  pstmt.setString(1,username);
		   	  pstmt.setString(2,power);
		   	  pstmt.setString(3,pwd);
		   	  pstmt.setString(4,phone);
		   	  pstmt.executeUpdate();
		   	  //JOptionPane.showMessageDialog(null, "注册成功，请登录", "恭喜您", JOptionPane.ERROR_MESSAGE);
		   	  response.sendRedirect("login.jsp");
		   }catch(SQLException e){
		   		e.printStackTrace();
		   }finally{
		    DBConnection.close(conn);
			DBConnection.close(pstmt);
		   }
		   
		}
       %>
      

    </div> <!-- /container -->


        <script src="./js/echarts.js"></script> <!--echart图表-->
	     <script src="./js/index.js"></script> <!--idnexjs文件-->
         <script src="./js/jquery-3.2.1.min.js"></script> <!--idnexjs文件-->
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="./js/jquery-3.2.1.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="../js/bootstrap.min.js"></script><!--boostrap 标准库-->
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="../../assets/js/vendor/holder.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>

