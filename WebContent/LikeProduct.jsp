<%@page import="com.project.DbConnection" %>
<%@page import="java.sql.*" %>

<% 
String id = request.getParameter("id");
String increment = request.getParameter("num");


int num=0;


try {
	Connection con = DbConnection.getCon();
	Statement st = con.createStatement();
	ResultSet rs= st.executeQuery("select * from product where id='"+id+"'");
	while(rs.next()){
		num=rs.getInt(7);
	}
	if(num == 0 || num > 0 && increment.equals("increment")){
				num = num+1;
		st.executeUpdate("Update product set liked='"+num+"' where id='"+id+"'");
		response.sendRedirect("home.jsp?msg=increment");
	}
	
} catch(Exception e){
	System.out.println(e);
}

%>