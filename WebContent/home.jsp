<%@page import="com.project.DbConnection" %>
<%@page import="java.sql.*" %>
<%@include file="header.jsp" %>
<%@include file="/footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://kit.fontawesome.com/4e28144f1f.js" crossorigin="anonymous"></script>
<title>Business Tracker</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
button{
border-radius:5px;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>

<%
String message = request.getParameter("msg");
if("added".equals(message)){
%>
<h3 class="alert">Product added successfully!</h3>
	
<%} %>
<%

if("exist".equals(message)){
%>
<h3 class="alert">Product already exist in you cart! Quantity  increased!</h3>
	
<%} %>

<%

if("invalid".equals(message)){
%>
<h3 class="alert" style="color:red;">There is a problem! Try again later</h3>
	
<%} %>


<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
                       <th scope="col"> Price</th>
            <th scope="col">Like</th>
            <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
          </tr>
        </thead>
        <tbody>
		<%
		try{
			Connection con = DbConnection.getCon();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from product where active='Yes'");
			while(rs.next()){
		%>		
          <tr>
            <td><%=rs.getString(1) %></td>
              <td><%=rs.getString(2) %></td>
                    
            <td><%=rs.getString(4) %></td>
           
              <td>
                   <a href="LikeProduct.jsp?id=<%=rs.getString(1)%>&num=increment"><button><i class="fa-solid fa-thumbs-up"></i><span><%=rs.getString(7) %></span></button></a>
                   
                 </td>
                          <td><a href="AddToCartAction.jsp?id=<%=rs.getString(1) %>"><i class='fas fa-cart-plus'></i></a></td>
          </tr>
<% }} catch(Exception e) {
	System.out.println(e);
}%>
        </tbody>
      </table>
      <br>
      <br>
      <br>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>