<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import="com.minajiale.database.*" %>
<%@page import="java.sql.*" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ProductsReslove.jsp' starting page</title>
      	 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="./css/bootstrap.min.css" rel="stylesheet">
	<style type="text/css">
	.formmid{
	display:block;
	   width:800px;
		 margin:0 auto
	}
	
	</style>
  </head>
  
  <body>
    <%
 
		String time = null;
		int customerint = 0;
		Double totalmount = 0.0;
		int paywayint = 0;
		Double debt =0.0;
		int progressint =0;
		String products =null;
    
    String  idString = request.getParameter("id");
      String  name = (String)request.getParameter("name");
       int id = Integer.parseInt(idString);
       
       if(name.equals("delete")){
       
		Connection conn = DBConnection.getConnection();
		String deleteSQL="delete from productsorder where id=?";
		PreparedStatement pstmt = null;
		try{
			pstmt=conn.prepareStatement(deleteSQL);
			pstmt.setInt(1,id);
			pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DBConnection.close(pstmt);
			DBConnection.close(conn);
		}
       response.sendRedirect("../index.jsp");
      }
      
      
      if(name.equals("details")){
      if(idString != null){
		 Connection conn = DBConnection.getConnection();
		String updateSQL = "select * from productsorder where id="+id+"";
		PreparedStatement pstmt = null;
		try{
		    //pstmt.setInt(1, id);
		    //pstmt.setString(1,idString);
			pstmt = conn.prepareStatement(updateSQL);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
			  time=rs.getString(2);
			   customerint = rs.getInt(3);
			  totalmount = rs.getDouble(4);
			  paywayint = rs.getInt(5);
			   debt = rs.getDouble(8);
			  progressint = rs.getInt(9);
			  products = rs.getString(10);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DBConnection.close(pstmt);
			DBConnection.close(conn);
		}
      }}

     %>
     <%
     //根据订单表中的 顾客姓名ID，付款方式ID，订单状态ID查询相应的表，得出人性化数字
     				 //根据顾客ID查找顾客姓名
     				 
     				 String Customer=null;
     				 String progress = null;
     				 String payway = null;
     				 
     		    Connection conn = DBConnection.getConnection();
				String customerSQL = "select * from customer where id= "+customerint+"";
			    PreparedStatement pstmtC = null;
			    pstmtC = conn.prepareStatement(customerSQL);
			    ResultSet rsC = pstmtC.executeQuery();
			    while(rsC.next()){
			    	Customer= rsC.getString(2);
			    }
			  
			    //根据订单状态ID查找订单状态
				String processSQL = "select * from progess where id= "+progressint+"";
			    PreparedStatement pstmtP = null;
			    pstmtP = conn.prepareStatement(processSQL);
			    ResultSet rsP = pstmtP.executeQuery();
			    while(rsP.next()){
			    	progress= rsP.getString(3);
			    }
			    
			    //根据订单状态ID查找订单状态
				String paywaySQL = "select * from payway where id= "+paywayint+"";
			    PreparedStatement pstmtPa = null;
			    pstmtPa = conn.prepareStatement(paywaySQL);
			    ResultSet rsPa = pstmtPa.executeQuery();
			    while(rsPa.next()){
			    	payway= rsPa.getString(3);
			    }
			    
     		DBConnection.close(pstmtC);
     		DBConnection.close(pstmtP);
     		DBConnection.close(pstmtPa);
			DBConnection.close(conn);
     
      %>
  </body>
  <div class="formmid">
	  <form action="" role="form"  class="form-horizontal">
	  <div class="form-group">
	  	<label  for="firstname" class="col-sm-2 control-label">订单号</label>
	  	 <div class="col-sm-10">
	    	<input type="text" class="form-control" id="firstname"value="<%= id %>"></input>
	    </div>
	   </div>
	   <div class="form-group" >
		    <label for="name"  class="col-sm-2 control-label">订单时间</label>
		     <div class="col-sm-10">
		    	<input type="text" class="form-control" id="name" value="<%= time %>"></input>
		    </div>
	    </div>
	   <div class="form-group" >
		    <label for="name"  class="col-sm-2 control-label">顾客姓名</label>
		     <div class="col-sm-10">
		    	<input type="text" class="form-control" id="name" value="<%= Customer%>"></input>
		    </div>
	    </div>
	   <div class="form-group" >
		    <label for="name"  class="col-sm-2 control-label">订单总金额</label>
		     <div class="col-sm-10">
		    	<input type="text" class="form-control" id="name" value="<%= totalmount %>"></input>
		    </div>
	    </div>
	   <div class="form-group" >
		    <label for="name"  class="col-sm-2 control-label">付款方式</label>
		     <div class="col-sm-10">
		    	<input type="text" class="form-control" id="name" value="<%= payway %>"></input>
		    </div>
	    </div>
		   <div class="form-group" >
		    <label for="name"  class="col-sm-2 control-label">订单状态</label>
		     <div class="col-sm-10">
		    	<input type="text" class="form-control" id="name" value="<%= progress %>"></input>
		    </div>
	    </div>
	    	   <div class="form-group" >
		    <label for="name"  class="col-sm-2 control-label">购买产品列表</label>
		     <div class="col-sm-10">
		    	<input type="text" class="form-control" id="name" value="<%= products %>"></input>
		    </div>
	    </div>
	    	<button type="submit " class="btn btn-default formmid" >提交</button>
	  </form>
 </div>
<script src="./js/jquery-3.2.1.min.js"></script>
<script src="./js/bootstrap.min.js"></script><!--boostrap 标准库-->
</html>
