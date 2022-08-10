<%@page import="com.project.DbConnection" %>
<%@page import="java.sql.*" %>
<%@include file="header.jsp" %>
<%@include file="/footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>
<table>
        <thead>
           <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col"> Price</th>
            <th scope="col">Like</th>
             <th scope="col">Dislike</th>
            <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
          </tr>
        </thead>
        <tbody>
		<%
		int z=0;
		try{
			String search = request.getParameter("search");
		
			Connection con = DbConnection.getCon();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from product where name like '%"+search+"%' or category like '%"+search+"%' and active='Yes'");
			while(rs.next())
			{
				z=1;
			
		%>	
            <tr>
            <td><%=rs.getString(1) %></td>
              <td><%=rs.getString(2) %></td>
                 <td><%=rs.getString(3) %></td>    
            <td><%=rs.getString(4) %></td>
           
              <td>
                   <a href="LikeProduct.jsp?id=<%=rs.getString(1)%>&num=increment"><button><i class="fa-solid fa-thumbs-up"></i><span><%=rs.getString(7) %></span></button></a>
                   
                 </td>
                          <td><a href="AddToCartAction.jsp?id=<%=rs.getString(1) %>">Add to cart <i class='fas fa-cart-plus'></i></a></td>
          </tr>
         <% }} catch(Exception e) {
	System.out.println(e);
}%>
    
        </tbody>
      </table>
      <%
      if(z==0){
          %>
          
	<h1 style="color:white; text-align: center;">Nothing to show</h1>
    <%} %>  
      	
	
      <br>
      <br>
      <br>
      <div class="footer">
      </div>

</body>
</html>