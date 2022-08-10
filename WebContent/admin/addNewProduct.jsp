<%@page import="com.project.DbConnection" %>
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>

<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<link rel="stylesheet" href="../css/bootstrap1.css">
<title>Add New Product</title>
<style>
.input-style{
  border-radius:20px;
   padding: 12px 15px;
}
h3{
font-size:18px
}
</style>
</head>
<body>
<% String msg = request.getParameter("msg");
if("success".equals(msg))
{
%>
<h3 class="alert">Product Added Successfully!</h3>
<%}%>
<%
if("failed".equals(msg))
{
%>
<h3 class="alert">Something went wrong !</h3>
<%}%>
	


<%
int id =1;
try {
	Connection con = DbConnection.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select max(id) from product");
	while(rs.next())
	{
		id = rs.getInt(1);
		id = id +1;
	}
}
catch(Exception e){
	
}
%>
<form action="../addNewProduct" method="post">
<h3 style="color: yellow;">Product ID: <%out.print(id); %> </h3>
<input type="hidden" name="id" value="<%out.print(id); %>">


<div class="left-div">
 <h3>Enter Product Name</h3>
 <input class="input-style" type="text" name="name" placeholder="Enter Name" required>
 
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
 <input class="input-style" type="number" name="price" placeholder="Enter Price" required>
<hr>
</div>
<div class="right-div">
<h3>Enter Long term Staff Number</h3>
 <input class="input-style" type="number" name="staff" placeholder="Enter Staff NUmber" required>
<hr>
</div>

<div class="left-div">
<h3>Active</h3>
<select class="input-style" name="active" required>
<option value="Yes">Yes</option>
<option value="No">No</option>
</select>
   
<hr>
</div>
 <input type="submit" class="button"  value="Save"/>
 </form>

</body>
<br><br><br>
</body>
</html>