<%@page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.minajiale.database.*" %>
<%@page import="object.Product" %>
<html>
<head>
<tittle>test</tittle>
</head>
<body>
<%
ProductsDAO commodityDAO = ProductsDAOFactory.getcommodityDAOInstance();
List<Product>commodityList = commodityDAO.findAllCommodity();
pageContext.setAttribute("commodityList",commodityList);
 %>
 <table width="700" border="1">
 <tr>
 <td>产品ID</td>
  <td>产品名称</td>
   <td>产品价格</td>
 </tr>
 <c:forEach var="comodity" items="${pageScope.commodityList}">
 	<tr>
 		<td>${commodity.calss}</td>
 		<td>${commodity.name}</td>
 		<td>${commodity.buyprice}</td>
 	</tr>
 </c:forEach>
 <tr>
 <td>查看购物车</td>
 
 </tr>
 </table>

</body>

</html>























