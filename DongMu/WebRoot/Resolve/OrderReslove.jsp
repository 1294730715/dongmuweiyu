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
	<link href="./css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
	
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
		String customerString = null;
		Double totalmount = 0.0;
		String paywayint = null;
		Double debt =0.0;
		String progressint =null;
		String products =null;
		int id =0;
		String owner=null;
    
    String  idString = request.getParameter("id");
      String  name = (String)request.getParameter("name");
      if(idString != null){
         id = Integer.parseInt(idString);
      
      }
       
       if(name.equals("delete")){
       
         session.setAttribute("label", "change");
       
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
			  customerString = rs.getString(3);
			  totalmount = rs.getDouble(4);
			  paywayint = rs.getString(5);
			   debt = rs.getDouble(6);
			  progressint = rs.getString(7);
			  products = rs.getString(8);
			  owner = rs.getString(9);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DBConnection.close(pstmt);
			DBConnection.close(conn);
		}
      }}
      	 
     if(name != null  &&  name.equals("add")){
	 session.setAttribute("label", "add");
	 } 
	

     %>
     <%--
     //根据订单表中的 顾客姓名ID，付款方式ID，订单状态ID查询相应的表，得出人性化数字
     				 //根据顾客ID查找顾客姓名
     				 
     				 String Customer=null;
     				 String progress = null;
     				 String payway = null;
     			//根据顾客ID查找顾客姓名 
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
			    
			    //根据付款方式ID查找付款方式
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
     
      --%>
  </body>
  <div class="formmid">
	  <form action="Resolve/OrderAddChange.jsp?id=<%= id %>" role="form"  class="form-horizontal">
	  <div class="form-group">
	  	<label  for="firstname" class="col-sm-2 control-label">订单号</label>
	  	 <div class="col-sm-10">
	    	<input type="text" class="form-control" id="firstname" name="orderId"placeholder="<%= id %>"></input><span>该ID自动生成无须改动</span>
	    </div>
	   </div>
	   
	   
	   <div class="form-group" >
		    <label for="name"  class="col-sm-2 control-label">订单时间</label>
		     <div class="col-sm-10">
			<div class="control-group">
                <div class="controls input-append date form_date" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                    <input size="16" type="text" value="" readonly name="orderTime">
                    <span class="add-on"><i class="icon-remove"></i></span>
					<span class="add-on"><i class="icon-th"></i></span>
                </div>
				<input type="hidden" id="dtp_input2" value="" /><br/>
            </div>		    </div>
	    </div>
	    
	    
	    
	   <div class="form-group" >
		    <label for="name"  class="col-sm-2 control-label">顾客姓名</label>
		     <div class="col-sm-10">
		    	<input type="text" class="form-control" id="name" time="customer" name="customerName"placeholder="<%= customerString%>"></input>
		    </div>
	    </div>
	    <div class="form-group" >
		    <label for="name"  class="col-sm-2 control-label">卖家姓名</label>
		     <div class="col-sm-10">
		    	<input type="text" class="form-control" id="name" time="dealer" name="dealer"placeholder="<%= owner%>"></input>
		    </div>
	    </div>
	   <div class="form-group" >
		    <label for="name"  class="col-sm-2 control-label">订单总金额</label>
		     <div class="col-sm-10">
		    	<input type="text" class="form-control" id="name" name="totalamount" placeholder="<%= totalmount %>"></input>
		    </div>
	    </div>
	    <div class="form-group" >
		    <label for="name"  class="col-sm-2 control-label">欠款金额</label>
		     <div class="col-sm-10">
		    	<input type="text" class="form-control" id="name" name="debt" placeholder="<%= debt %>"></input>
		    </div>
	    </div>
	    <div class="form-group">
   			 <label for="name" class="col-sm-2 control-label">付款方式</label>
    		<select class="form-control" id="name" class="col-sm-10" name="payway"> 
      			<option><%= paywayint %></option>
      			<option>现金</option>
     			 <option>微信</option>
      			<option>支付宝</option>
     			 <option>银行转账</option>
   			 </select>
  		</div>
  		<div class="form-group">
   			 <label for="name" class="col-sm-2 control-label">订单状态</label>
    		<select class="form-control" id="name" class="col-sm-10" name="progress"> 
      			<option><%= progressint %></option>
      			<option>预付定金</option>
     			 <option>欠款未完成</option>
      			<option>完结</option>
   			 </select>
  		</div>

	    <div class="form-group" >
		    <label for="name"  class="col-sm-2 control-label">购买产品列表</label>
		     <div class="col-sm-10">
		    	<input type="text" class="form-control" id="name" name="productsList" placeholder="<%= products %>"></input>
		    </div>
	    </div>
	    	<button type="submit " class="btn btn-default formmid" >提交</button>
	  </form>
 </div>
 <script type="text/javascript" src="./js/jquery-3.2.1.min.js" charset="UTF-8"></script>
<script src="./js/bootstrap.min.js"></script><!--boostrap 标准库-->
<script type="text/javascript" src="./js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="./js/locales/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
 <script type="text/javascript">

	$('.form_date').datetimepicker({
        language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
    });

</script>


</html>
