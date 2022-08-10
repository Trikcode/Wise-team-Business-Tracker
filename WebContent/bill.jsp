<%@page import="com.project.DbConnection" %>
<%@page import="java.sql.*" %>
<%@include file="/footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/bill.css">
<title>Bill</title>
<style type="text/css">
body{
 background-color: #242345;
 
}
h3{
color:white;
font-size:18px;
}
</style>
</head>
<body>
<%
String email=session.getAttribute("email").toString();
try{
	int total=0;
	int sno=0;
	Connection con=DbConnection.getCon();
	Statement st = con.createStatement();
	ResultSet rs= st.executeQuery("select sum(total) from cart where email='"+email+"' and status='bill'");
	while(rs.next()){
		total=rs.getInt(1);
		
	}
	ResultSet rs1 = st.executeQuery("select * from users inner join cart where cart.email='"+email+"' and cart.status='bill'");
	while(rs1.next()){
		
%>

<h3>Wise Team Business Tracker</h3>
<hr>
<div class="left-div"><h3>Name:<%=rs1.getString(1) %>  </h3></div>
<div class="right-div-right"><h3>Email: <%out.println(email); %> </h3></div>
<div class="right-div-right"><h3>Payment Method: <%=rs1.getString(15) %> </h3></div>

<div class="left-div"><h3>Transaction Id:<%=rs1.getString(16) %>   </h3></div>
<div class="right-div-right"><h3>City:<%=rs1.getString(14) %>   </h3></div> 
<div class="right-div"><h3>Address: <%=rs1.getString(13) %>  </h3></div> 
<hr>
<%break;} %>


	
	<br>
	
<table id="customers">
<h3>Product Details</h3>
  <tr>
    <th>S.No</th>
    <th>Product Name</th>
    <th>category</th>
    <th>Price</th>
    <th>Quantity</th>
     <th>Sub Total</th>
  </tr>
  <%
  ResultSet rs2 = st.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.email='"+email+"' and cart.status='bill'");
	while(rs2.next()){
		
	
  %>
  <tr>
    <td><%out.println(sno); %></td>
    <td><%=rs2.getString(12) %></td>
    <td><%=rs2.getString(13) %></td>
   <td><%=rs2.getString(14) %></td>
   <td><%=rs2.getString(3) %></td>
   <td><%=rs2.getString(5) %></td>
  </tr>
  <tr>

</table>
<h3>Total: <%out.println(total); %> </h3>
<a href="continueShopping.jsp"><button class="button left-button">Continue Shopping</button></a>
<a onclick="window.print();"><button class="button right-button">Print</button></a>
<br><br><br><br>

<%}} catch(Exception e){
	System.out.println(e);
} %>
</body>
</html>