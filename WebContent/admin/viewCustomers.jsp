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
<div style="color: white; text-align: center; font-size: 30px;"> Our Customers <i class='fab fa-elementor'></i></div>

<table>
        <thead>
          <tr>
             <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col"> Gender</th>
            <th scope="col"> preference</th>
            <th scope="col">Address</th>
        
            
          </tr>
        </thead>
        <tbody>
       <%
       try{
    	   Connection con = DbConnection.getCon();
    	   Statement st = con.createStatement();
    	   ResultSet rs = st.executeQuery("select * from users");
    	   while(rs.next()){
    		   
       %>
          <tr>
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
          
            <td><%=rs.getString(5) %></td>
            <td><%=rs.getString(6) %></td>
                    
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
      <br>

</body>
</html>