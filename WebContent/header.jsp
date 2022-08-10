<%@page import="com.project.DbConnection" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/home-style.css">
<link rel="stylesheet" href="css/bootstrap.css">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
    <!--Header-->
    <br>
    <div class="topnav sticky">
    
    		
            
            <div style="display:flex; justify-content:space-between; align-items:center; text-align:center;">
            <div><h2 style="padding-left:30px"><b> Wise Team Business Tracker </b></h2></div>
              <div> 
              <%
    		if (session.getAttribute("email") == null || session.getAttribute("email").equals("")){
    		%>
            <a href="login.jsp">Login <i class='fas fa-share-square'></i></a>
            <a href="signup.jsp">Sign Up <i class='fas fa-share-square'></i></a>  
            <%}
    		else{
            	 %> 
            	  <a href="LogoutAction.jsp">Logout <i class='fas fa-share-square'></i></a>
            	 <%} %>         
           	</div>
            	
            </div>
          
            <a href="home.jsp">Home<i class="fa fa-institution"></i></a>
            <a href="myCart.jsp">My Cart<i class='fas fa-cart-arrow-down'></i></a>
           
           
          
            
            <div class="search-container">
            <form action="searchHome.jsp" method="post">
            <input type="text" placeholder="search" name="search">
            <button type="submit"><i class="fa fa-search"></i></button>
            </form>
             
                      
            </div>
          </div>
           <br>
           <!--table-->
