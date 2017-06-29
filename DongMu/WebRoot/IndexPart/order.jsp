<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="com.minajiale.database.*" %>
<%@page import="java.sql.*" %>
  <%@  page import = "javax.swing.JOptionPane" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
  <style type="text/css">
    .top-nav
    {
      font-size: 12px;
      font-weight: bold;
      list-style: none;
    }
    .top-nav li
    {
      float: left;
      list-style: none;
      margin-right: 1px;
    }
    .top-nav li a
    {
      line-height: 20px;
      text-decoration: none;
      background: #DDDDDD;
      color: #666666;
      display: block;
      width: 80px;
      text-align: center;
    }
    .top-nav li a:hover
    {
      background: #900;
      color: #FFF;
    }
    .top-nav ul
    {
      list-style: none;
      display: none;
      width: 80px;
      padding: 0;
      position: relative;
    }
    .top-nav li ul li ul
    {
      position: absolute;
      top: 0;
      left: 80px;
    }
  </style>
</head>
<body>
		<div class="finance">
			
		<h1 class="page-header">订单管理</h1>
		
		<!-- 分类菜单 -->
		<div class="classify">
		<ul class="venus-menu top-nav">  
       		 <li>  
            	<a href="#"><i class="icon-thumbs-up"></i>分类</a>  
            	<ul>  
                <li><a href="#">门</a></li>  
                <li><a href="#">水桶头</a></li>  
                <li>  
                    <a href="#">卫生间用品</a>  
                    <ul>  
                        <li><a href="#">花洒</a></li>  
                        <li><a href="#">蹲便器</a></li>  
                        <li>  
                            <a href="#">Photoshop</a>  
                            <ul>  
                                <li><a href="#">Photo editing</a></li>  
                                <li><a href="#">Business cards</a></li>  
                                <li><a href="#">Websites</a></li>  
                                <li><a href="#">Flyers</a></li>  
                            </ul>  
                        </li>  
                        <li><a href="#">Fonts</a></li>  
                    </ul>  
                </li>  
                <li><a href="#">Consulting</a></li>  
            </ul>  
        </li>  
        <li class="search">  
            <form method="get">  
                <input type="text" name="search" class="search" placeholder="搜索" />  
            </form>  
        </li>  
    </ul>  
		</div>
		
		<!-- 中间产品表格 -->
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
         <%
         Connection conn = DBConnection.getConnection();
		String updateSQL = "select * from productsorder";
		PreparedStatement pstmt = null;

		try{
			pstmt = conn.prepareStatement(updateSQL);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				 int id= rs.getInt(1);
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
			    
			    
				out.println("<tr><td>"+Customer+"</td><td>"+rs.getString(2)+"</td><td>￥"+ rs.getString(4)+ "</td><td>"+progress+
				"<td><a href='./Resolve/OrderReslove.jsp?name=details&id=" + id + "'>详情</a></td>"+
				"<td><a href='./Resolve/OrderReslove.jsp?name=delete&id=" + id + "'>删除</a></td></tr>");
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
<script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
   $(function(){
    $(".top-nav li").hover(function(){
      $(this).has("ul").children("ul").fadeIn();
    },function(){
      $(this).has("ul").children("ul").hide();
    });
   }) 
</script>
</html>