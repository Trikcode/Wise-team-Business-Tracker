<%-- 
    Document   : Customerpreferences
    Created on : Aug 8, 2022, 7:07:52 PM
    Author     : emmao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "java.sql.*"%>
<%@ page import = "jakarta.servlet.*"%>
<%@ page import = "Realcw2.customersession, java.util.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer preferences</title>
    </head>
    <body>
       <h1>Hello World!</h1>
      
        <table border="1" width="50%">
            <tr>
                <th> customer email</th>
                <th>customer location</th>
                <th>gender</th>
                <th>product name</th>
                <th>price</th>
                
            </tr>
        <%
           // String email="nsm@gmail.com";
            try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/businesstracker","root","");
              
               Statement tt=con.createStatement();
             ResultSet tm=tt.executeQuery("select*from orders");
             
             ArrayList<String> mail = new ArrayList<String>();
            
             
//             Statement countSt = con.createStatement();
//             ResultSet countRs = countSt.executeQuery("SELECT COUNT(email) FROM orders");
//             countRs.next();
//             
//             String mail[] = new String[countRs.getInt("COUNT(email)")];
             
             
             while(tm.next()){
             
              mail.add(tm.getString("email"));
            }
              
            for(int i=0;i<mail.size();i++){
                 Statement st = con.createStatement();
                 ResultSet res=st.executeQuery("select gender,location from users where email='"+mail.get(i)+"'");
            
                      while(res.next()){
            
              %>
              <tr>
                  <td><a href=""><%=mail.get(i)%></a></td>
            <td><%=res.getString("location")%> </td>
            <td><%=res.getString("gender")%></td>
              
            <%
            }
            
            

                Statement mt=con.createStatement();
             ResultSet rem=mt.executeQuery("select price,name from orders where email='"+mail.get(i)+"'");
            while(rem.next()){
            %>
            
           <td><%=rem.getString("name")%></td>
            <td><%=rem.getInt("price")%></td>
            </tr>
            <%
            }
            
             %>
             
            
             
             <%
}
            // String gend=;
            // String locatn=
             
           ///  int px =;
             //String nem=;
        
 }catch(Exception e){
             out.println(e.getMessage());
            }
            %>
      
           
            
        
        </table>
    </body>
</html>
