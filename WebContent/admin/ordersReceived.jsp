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

<div style="color: white; text-align: center; font-size: 30px;">Orders Received <i class="fas fa-archive"></i></div>
<%
String msg= request.getParameter("msg");
if("cancel".equals(msg)){
%><h3 class="alert">Order Cancel Successfully!</h3>
	
	<%} %>
<%

if("delivered".equals(msg)){
%>
<h3 class="alert">Successfully Updated!</h3>

	
	<%} %>
<%
if("invalid".equals(msg)){
%><h3 class="alert">Some thing went wrong! Try Again!</h3>
	
	<%} %>



<table id="customers">
          <tr>
        
            <th scope="col">Product Name</th>
            <th scope="col">Quantity</th>
            <th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
            <th>Address</th>
             <th scope="col">Payment Method</th>
              <th scope="col">T-ID</th>
              <th scope="col">Status</th>
              <th scope="col">Cancel order <i class='fas fa-window-close'></i></th>
              <th scope="col">Order Delivered <i class='fas fa-dolly'></i></i></th>
          </tr>
        <%
        int serialno=0;
        try{
        	Connection con = DbConnection.getCon();
        	Statement st = con.createStatement();
        	ResultSet rs = st.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.status='processing'");
        	while(rs.next()){
        %>
        	             
          <tr>
          <td><%=rs.getString(12) %></td>
           <td><%=rs.getString(3) %></td>
            <td><%=rs.getString(5) %></td>
             <td><%=rs.getString(6) %></td>
              <td><%=rs.getString(8) %></td>
            <td><%=rs.getString(9) %></td>
             <td><%=rs.getString(10) %></td>
            
             
               <td><a href="cancelOrdersAction.jsp?id=<%=rs.getString(2) %>&email=<%=rs.getString(1) %>">Cancel <i class='fas fa-window-close'></i></a></td>
                <td><a href="deliveredOrdersAction.jsp?id=<%=rs.getString(2) %>&email=<%=rs.getString(1)%>">Delivered <i class='fas fa-dolly'></i></a></td>
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