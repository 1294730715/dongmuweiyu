<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
        <%@page import="com.minajiale.database.*" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	 		<div class="order">
		<h1 class="page-header">订单管理</h1>
                    <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>客户名称</th>
                  <th>订单日期</th>
                  <th>订单金额</th>
                  <th>订单状态</th>
                  <th>操作</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>张三</td>
                  <td>2016-12-4</td>
				  <td>￥20000</td>
				  <td>完结</td>
				   <td><a href="#">详情</a></td>
				   <td><a href="#">删除</a></td>
                </tr>
                <tr>
                    <td>刘娜</td>
                  <td>2016-12-6</td>
				  <td>￥2000000</td>
				  <td>待付款</td>
				   <td><a href="#">详情</a></td>
				   <td><a href="#">删除</a></td>
                </tr>
                <tr>
                     <td>李四</td>
                  <td>2016-11-0</td>
				  <td>￥543000</td>
				  <td>预付</td>
				   <td><a href="#">详情</a></td>
				   <td><a href="#">删除</a></td>
                </tr>
                               <%
          		Connection conn = DBConnection.getConnection();
		String updateSQL = "select * from productsorder";
		PreparedStatement pstmt = null;

		try{
			pstmt = conn.prepareStatement(updateSQL);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
			out.println("gvfcdxs");
			    int id= rs.getInt(1);
				out.println("<tr><td>"+rs.getString(3)+"</td><td>"+rs.getString(2)+"</td><td>￥"+ rs.getString(4)+ "</td><td>"+rs.getString(7)+
				"<td><a href='./Resolve/ProductsReslove.jsp?name=details&id=" + id + "'>详情</a></td>"+
				"<td><a href='./Resolve/ProductsReslove.jsp?name=delete&id=" + id + "'>删除</a></td></tr>");
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DBConnection.close(pstmt);
			DBConnection.close(conn);
		}
           %> 
              </tbody>
            </table>
          </div>  
		</div>  	
</body>
</html>