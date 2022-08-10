<%@page import="com.project.DbConnection" %>
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>

<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<link rel="stylesheet" href="../css/bootstrap1.css">
<title>Add New Today's Specification</title>
<style type="text/css">
h3
{
	color: yellow;
	text-align: center;
	font-size:18px
}
.input-style{
  border-radius:20px;
   padding: 12px 15px;
}

table td{
color:black !important;
}
</style>
</head>
<body>
<% String msg = request.getParameter("msg");
if("success".equals(msg))
{
%>
<h3 class="alert">New Specification added!</h3>
<%}%>
<%
if("failed".equals(msg))
{
%>
<h3 class="alert">There was an error!</h3>
<%}%>
<%
if("tobig".equals(msg))
{
%>
<h3 class="alert">Number of sets of products can't exceed 4!</h3>
<%}%>
	
<form action="addNewSpecificationAction.jsp" method="post">
<div class="left-div">
 <h3>Enter Number of long-term products</h3>
 <input class="input-style" type="number" name="numoflongtermproducts" placeholder="Enter Number" required>
<hr>
</div>


<div class="right-div">
<h3>Enter Staff Number for mid-term</h3>
 <input class="input-style" type="number" name="midtermstaffnumber" placeholder="Enter Staff NUmber" required>
<hr>
</div>

 <input type="submit" class="button"  value="Save"/>
 </form>

</body>
<br><br><br>
</body>
</html>