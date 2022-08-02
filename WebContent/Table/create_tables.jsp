<%@page import="com.project.DbConnection" %>
<%@page import="java.sql.*" %>

<%
try {
	Connection con = DbConnection.getCon();
	Statement st =  con.createStatement();
	String query1 = "create table users(name varchar(100), email varchar(100)primary key, gender varchar(100), password varchar(100), preference varchar(100), location varchar(200))";
	System.out.print(query1);
	st.execute(query1);
	System.out.print(query1);
	con.close();
}
catch(Exception e){
	System.out.print(e);
}
%>
