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
		<h1 class="page-header">店员管理</h1>
         <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>店员姓名</th>
                  <th>总的销售额（元）</th>
                  <th>操作</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>张三</td>
                  <td>￥7865432</td>
				   <td><a href="#">详情</a></td>
				   <td><a href="#">删除</a></td>
                </tr>
               <%
          		Connection conn = DBConnection.getConnection();
		String updateSQL = "select * from people where power =2";
		PreparedStatement pstmt = null;
		try{
			pstmt = conn.prepareStatement(updateSQL);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
			    int id= rs.getInt(1);
			    String assistantName = rs.getString(2);
			    Double allmount =0.0;
			     
			     
			    //根据店员ID查询订单表，计算该店员的总的销售额
				String processSQL = "select * from productsorder where owner= "+id+"";
			    PreparedStatement pstmtP = null;
			    pstmtP = conn.prepareStatement(processSQL);
			    ResultSet rsP = pstmtP.executeQuery();
			    while(rsP.next()){
			    	allmount+= rsP.getDouble(4);
			    }
			    
			    
				out.println("<tr><td>"+assistantName+"</td><td>￥"+allmount+
				"<td><a href='./Resolve/peopleResolve.jsp?assistant="+ assistantName+"&name=details&id=" + id + "'>详情</a></td>"+
				"<td><a href='./Resolve/peopleResolve.jsp?name=delete&id=" + id + "'>删除</a></td></tr>");
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
</body>
</html>