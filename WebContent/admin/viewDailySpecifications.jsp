<%@page import="com.project.DbConnection" %>
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="../css/bootstrap1.css">
<title>Home</title>
<style>
h3
{
	color: yellow;
	text-align: center;
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
<%
String message = request.getParameter("msg");
if("exists".equals(message)){
%>
<h3 class="alert">Short term staff updated!</h3>
	
<%} %>
<%

if("existm".equals(message)){
%>
<h3 class="alert">Mid term staff updated!</h3>
	
<%} %>

<%

if("existl".equals(message)){
%>
<h3 class="alert">Long term staff updated!</h3>
	
<%} %>

<div style="color: white; text-align: center; font-size: 30px;">Specifications</div>

<table>
        <thead>
          <tr>
             <th scope="col">Short term Products</th>
             <th scope="col">Mid term Products</th>
             <th scope="col">Long term Products</th>
           
            <th scope="col">short term staff</th>
            <th scope="col">mid term staff</th>
            <th scope="col">long term staff</th>
            <th scope="col"> Date</th>
              
            
          </tr>
        </thead>
        <tbody>
       <%
       try{
    	   Connection con = DbConnection.getCon();
    	   Statement st = con.createStatement();
    	   ResultSet rs = st.executeQuery("select * from specification");
    	   while(rs.next()){
    		   
       %>
          <tr>
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
          
            <td><%=rs.getString(4) %></td>
            <td><%=rs.getString(5) %></td>
             <td><%=rs.getString(6) %></td>
             <td><%=rs.getString(7) %></td>
                    
          </tr>
         <%}}
       catch(Exception e){
    	   System.out.println(e);
       }
       %>
         
        </tbody>
      </table>
      <br>
      <br>
      <div style="text-align:center">
      <a href="reallocate.jsp"><button style="padding:15px; background-color:red; color:white;">Reallocate Staff</button></a>
      </div>
      <br>

</body>
</html>