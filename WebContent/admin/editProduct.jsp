<%@page import="com.project.DbConnection" %>
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<link rel="stylesheet" href="../css/bootstrap1.css">
<title>Edit Product</title>
<style>
.back
{
  color: white;
  margin-left: 2.5%
}
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
 <h2><a class="back" href="allProductEditProduct.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></h2>


<% String id = request.getParameter("id");
try {
	Connection con = DbConnection.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from product where id='"+id+"'");
	while(rs.next())
	{
%>
<form action="../editProduct" method="post">
 <input type="hidden" name="id" value="<% out.print(id);%>">

<div class="left-div">
 <h3>Enter Name</h3>
 <input class="input-style" type="text" name="name" value="<%=rs.getString(2)%>">

<hr>
</div>

<div class="right-div">
<h3>Enter Category</h3>
<select class="input-style" name="category" required>
<option value="Long-term">Long Term</option>
<option value="Mid-term">Mid Term</option>
<option value="Short-term">Short Term</option>
</select>
<hr>
</div>

<div class="left-div">
<h3>Enter Price</h3>
  <input class="input-style" type="number" name="price" value="<%=rs.getString(4)%>">
<hr>
</div>

<div class="right-div">
<h3>Enter staff</h3>
  <input class="input-style" type="number" name="staff" value="<%=rs.getString(5)%>">
<hr>
</div>

<div class="right-div">
<h3>Active</h3>
<select class="input-style" name="active">
<option value="Yes">Yes</option>
<option value="No">No</option>
</select>
<hr>
</div>
 <input type="submit" class="button"  value="Update"/>
</form>

<% } } catch(Exception e)
{ 
	System.out.println(e);
} %>

</body>
<br><br><br>
</body>
</html>