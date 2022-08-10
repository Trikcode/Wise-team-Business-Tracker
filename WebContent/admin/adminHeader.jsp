<%@page import="com.project.DbConnection" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/home-style.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
    <!--Header-->
    <br>
    <div class="topnav sticky">
   			  <div style="display:flex; justify-content:space-between; align-items:center; text-align:center;">
            <div><h2 style="padding-left:30px"><b> Wise Team Business Tracker - HR MANAGER </b></h2></div>
             <div> 
              <%
    		if (session.getAttribute("email") == null || session.getAttribute("email").equals("")){
    		%>
            <a href="../login.jsp">Login <i class='fas fa-share-square'></i></a>
            <a href="../signup.jsp">Sign Up <i class='fas fa-share-square'></i></a>  
            <%}
    		else{
            	 %> 
            	  <a href="../LogoutAction.jsp">Logout <i class='fas fa-share-square'></i></a>
            	 <%} %>         
           	</div>
            	
            </div>
             <a href="adminHome.jsp">Home <i class='fas fa-home'></i></a>
            <a href="addNewProduct.jsp">Add New Product <i class='fas fa-plus-square'></i></a>
            <a href="allProductEditProduct.jsp">All Products & Edit Products <i class='fab fa-elementor'></i></a>
            <a href="ordersReceived.jsp">Orders Received <i class="fas fa-archive"></i></a>
             <a href="deliveredOrders.jsp">Delivered Orders <i class='fas fa-dolly'></i></a>
          </div>
           <br>
           <!--table-->
