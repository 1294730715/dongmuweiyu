<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
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
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <%
    String  idString = request.getParameter("id");
      String  name = (String)request.getParameter("name");
       int id = Integer.parseInt(idString);
       
       if(name.equals("delete")){
            out.println(name);
		   // ProductsDAO commodityDAO = ProductsDAOFactory.getcommodityDAOInstance();
		    //commodityDAO.deleteProducts(id);
		    //response.sendRedirect("../index.jsp");
      }
      
      
      if(name.equals("details")){
      if(idString != null){
         Connection conn = DBConnection.getConnection();
		String updateSQL = "select * from products where id=?";
		PreparedStatement pstmt = null;
		out.println("gvfcdxsvfcdxs");
		try{
		    id = Integer.parseInt(idString);
		    pstmt.setInt(1,id);
			pstmt = conn.prepareStatement(updateSQL);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				out.println("<tr><td>"+rs.getString(2)+"</td><td>￥"+rs.getString(4)+"</td><td>"+ rs.getString(8)+ "</td><td>"+rs.getString(9)+
				"<td><a href='./Resolve/ProductsReslove.jsp?name=\"delete\"&id=" + id + "'>详情</a></td>"+
				"<td><a href='./Resolve/ProductsReslove.jsp?id=" + id + "'>删除</a></td></tr>");
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DBConnection.close(pstmt);
			DBConnection.close(conn);
		}
      }}

     %>
  </body>
</html>
