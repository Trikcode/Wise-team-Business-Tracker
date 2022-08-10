<%@page import="com.project.DbConnection" %>
<%@page import="java.sql.*" %>
<%@include file="/footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="css/bootstrap.css">
<style>
.input-style{
  border-radius:20px;
   padding: 12px 15px;
}
h3{
font-size:18px;
color:yellow
}
table th{
color:black !important;
}
table td{
color:#262829 !important;
}
</style>
<head>
<link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script type="text/javascript">
if(window.history.forward(1) != null)
	window.history.forward(1);
</script>
<title>Home</title>

</head>
<body>
<br>
<table>
<thead>
<%
String email = session.getAttribute("email").toString();
int total = 0;
int sno = 0;

try {
	Connection con = DbConnection.getCon();
	Statement st = con.createStatement();
	ResultSet rs= st.executeQuery("select sum(total) from cart where email='"+email+"'  and address is NULL");
	while(rs.next()){
			
		total=rs.getInt(1);
		
	}%>

          <tr>
          <th scope="col"><a href="" style="color:blue"><i class='fas fa-arrow-circle-left'> Back</i></a></th>
            <th scope="col" style="background-color: yellow;">Total:UGSHS<%out.println(total);%> </th>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
          </tr>
        </thead>
        <tbody>
        <%
        ResultSet rs1 = st.executeQuery("select * from product inner join cart on product.id=cart.product_id and cart.email='"+email+"' and cart.address is NULL");
        while(rs1.next()){
               
        %>
        	
       
          <tr>
          <%sno=sno+1;%>
          
           <td><%out.println(sno); %></td>
            <td><%=rs1.getString(2) %></td>
            <td><%=rs1.getString(3) %></td>
            <td>UGSH: <%=rs1.getInt(4) %></td>
             <td><%=rs1.getString(10) %></td>
             <td>UGSH:<%=rs1.getString(12) %></td>
            </tr>
            <%}
        ResultSet rs2 =st.executeQuery("select * from users where email='"+email+"'");
        while(rs2.next()){
              %>
         
        </tbody>
      </table>
      
<hr style="width: 100%">
<form action="./orders" method="post">
 <div class="left-div">
 <h3>Enter Address</h3>
<input type="text" class="input-style" name="address" value="<%=rs2.getString(6) %>" placeholder="Enter address">
 </div>
 
 <div class="right-div">
 <h3>Enter City</h3>
<input type="text" class="input-style" name="city" value="<%=rs2.getString(7) %>"  placeholder="Enter city" required>
 </div>
<hr style="width: 100%">
<div class="left-div">
<h3> Payment Mode</h3>
<input type="text" class="input-style" name="paymentMethod" value="Online Payment">
 </div>
<div class="right-div">
<h3> Transaction ID</h3>
<input type="text" class="input-style" value="TIS-3553536" name="transactionId" placeholder="Enter transactionId">
 </div>
<hr style="width: 100%">

<div class="center-div">
<button class="button" type="submit">Generate Bill<i class='far fa-arrow-alt-circle-right'></i></button>
<h3 style="color: red">*Fill form correctly</h3>
</div>
</form>
<%
        }
} catch(Exception e){
	System.out.println(e);
}
%>
      <br>
      <br>
      <br>

</body>
</html>