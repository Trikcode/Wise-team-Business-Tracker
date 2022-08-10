<%@page import="com.project.DbConnection" %>
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../css/ordersReceived-style.css">
<link rel="stylesheet" href="../css/bootstrap1.css">
<title>Home</title>
<style>
.th-style
{ width: 25%;}
.input-style{
  border-radius:20px;
   padding: 12px 15px;
}
h3{
font-size:18px
}
table td{
color:black !important;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Delivered Orders <i class='fas fa-dolly'></i></div>


<table id="customers">
        <tr>
        
            <th scope="col">Product Name</th>
            <th scope="col">Quantity</th>
            <th scope="col">UGSHS: Sub Total</th>
            <th>Address</th>
             <th scope="col">Payment Method</th>
              <th scope="col">T-ID</th>
              <th scope="col">Status</th>
             
          </tr>
        <%
        try {
        	Connection con = DbConnection.getCon();
        	Statement st = con.createStatement();
        	ResultSet rs = st.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.status='delivered'");
        	while(rs.next())
        	{
        %>
        
          <tr>
         <td><%=rs.getString(12) %></td>
           <td><%=rs.getString(3) %></td>
            <td><%=rs.getString(5) %></td>
             <td><%=rs.getString(6) %></td>
              <td><%=rs.getString(8) %></td>
            <td><%=rs.getString(9) %></td>
             <td><%=rs.getString(10) %></td>
              </tr>
         <%}} catch(Exception e){
        	 System.out.println(e);
         } %>
        </table>
      <br>
      <br>
      <br>

</body>
</html>