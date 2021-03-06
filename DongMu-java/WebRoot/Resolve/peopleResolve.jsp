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
    
    <title>My JSP 'peopleResolve.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="./css/bootstrap.min.css" rel="stylesheet">
  </head>
  
  <body>
  <% 
    
    String  idString = request.getParameter("id");
     String  name = (String)request.getParameter("name");
     String  assistantname = (String)request.getParameter("assistant");
      int id = Integer.parseInt(idString);
       
       if(name.equals("delete")){
       
		Connection conn = DBConnection.getConnection();
		String deleteSQL="delete from people where id=?";
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
      out.println("<h1 class=\"page-header\">店员"+assistantname+"的订单统计</h1>" +
      "<div class=\"table-responsive\"><table class=\"table table-striped\"><thead><tr><th>订单编号</th><th>该订单顾客</th><th>订单日期</th><th>订单金额</th><th>订单状态</th><th>操作</th></tr></thead><tbody>"
      );
      
      
         Connection conn = DBConnection.getConnection();
		String updateSQL = "select * from productsorder";
		PreparedStatement pstmt = null;

		try{
			pstmt = conn.prepareStatement(updateSQL);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				 int orderid= rs.getInt(1);
				 int costomerid = rs.getInt(3);
				 int progressId = rs.getInt(7);
				 String Customer = null;
				 String progress = null;
				 
				 //根据顾客ID查找顾客姓名
				String customerSQL = "select * from customer where id= "+costomerid+"";
			    PreparedStatement pstmtC = null;
			    pstmtC = conn.prepareStatement(customerSQL);
			    ResultSet rsC = pstmtC.executeQuery();
			    while(rsC.next()){
			    	Customer= rsC.getString(2);
			    }
			  
			    //根据订单状态ID查找订单状态
				String processSQL = "select * from progess where id= "+progressId+"";
			    PreparedStatement pstmtP = null;
			    pstmtP = conn.prepareStatement(processSQL);
			    ResultSet rsP = pstmtP.executeQuery();
			    while(rsP.next()){
			    	progress= rsP.getString(3);
			    }
			    
			    
				out.println("<tr><td>"+orderid+"</td><td>"+Customer+"</td><td>"+rs.getString(2)+"</td><td>￥"+ rs.getString(4)+ "</td><td>"+progress+
				"<td><a href='./Resolve/OrderReslove.jsp?name=details&id=" + orderid + "'>详情</a></td>");
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DBConnection.close(pstmt);
			DBConnection.close(conn);
		}
		
		out.println("</tbody></table></div> </div>");
	}

  %>
  <!-- 
              <div class="table-responsive">
            <table class="table table-striped">
               <thead>
                <tr>
                  <th>订单编号</th>
                   <th>该订单顾客</th>
                  <th>订单日期</th>
                  <th>订单金额</th>
                  <th>订单状态</th>
                   <th>操作</th>
                </tr>
              </thead>
               <tbody>
                <tr>
                  <td>786543</td>
                   <td>大荒</td>
                  <td>2016-12-4</td>
				  <td>￥20000</td>
				  <td>完结</td>
				   <td><a href="#">详情</a></td>
				   <td><a href="#">删除</a></td>
                </tr>
              </tbody>
            </table>
          </div> 
		</div>
	 -->		   
  </body>
  <script src="./js/jquery-3.2.1.min.js"></script>
<script src="./js/bootstrap.min.js"></script><!--boostrap 标准库-->
</html>
