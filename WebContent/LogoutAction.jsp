<%@page import="com.project.DbConnection" %>
<%@page import="java.sql.*" %>

        <%
        session.invalidate();
        response.sendRedirect("login.jsp?msg=logout");
        %>

        


 