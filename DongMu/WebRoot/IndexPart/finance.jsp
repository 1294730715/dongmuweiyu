<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@page import="com.minajiale.database.*" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<div class="finance">

			 <h1 class="page-header">欠款买家详情</h1>
                    <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>买家姓名</th>
                  <th>买家电话</th>
                  <th>欠款金额</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1,001</td>
                  <td>Lorem</td>
                  <td>ipsum</td>

                </tr>
                <tr>
                  <td>1,002</td>
                  <td>amet</td>
                  <td>consectetur</td>

                </tr>
                <%
          		Connection conn = DBConnection.getConnection();
				String updateSQL = "select * from productsorder";
				PreparedStatement pstmt = null;
				try{
					pstmt = conn.prepareStatement(updateSQL);
					ResultSet rs = pstmt.executeQuery();
					while(rs.next()){
					    int id= rs.getInt(1);
						out.println("<tr><td>"+rs.getString(2)+"</td><td>￥"+rs.getString(4)+"</td><td>"+ rs.getString(8)+ "</td><td>"+rs.getString(9)+
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