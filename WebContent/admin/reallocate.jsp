<%@page import="com.project.DbConnection" %>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>

<%
try {
	Connection con = DbConnection.getCon();
	Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from product inner join cart on product.id=cart.product_id inner join specification");
         while(rs.next()){ 
        	 String category = rs.getString(3);
        	 int quantity = rs.getInt(10);
        	 int shorttermstaff = rs.getInt(21);
        	 int midtermstaff = rs.getInt(22);
        	 int longtermstaff = rs.getInt(23);
        	 int shortquantity=0;
        	 int longquantity=0;
        	 int midquantity=0;
        	 int shortfinalstaff = midtermstaff + longtermstaff;
        	 int midfinalstaff = shorttermstaff + longtermstaff;
        	 int longfinalstaff = shorttermstaff + midtermstaff;
        	
        	 if(category == "Short-term"){
        		 shortquantity = quantity;
        	        		 
        	 }
        	 else if (category == "Long-term"){
        		 longquantity = quantity;
        	 }else{
        		 midquantity = quantity; 
        	 }
        	 if (shortquantity > longquantity || shorttermstaff > midquantity){
        		 PreparedStatement ps = con.prepareStatement("update specification set shortstafft='"+shortfinalstaff+"' where shortstafft='"+shorttermstaff+"'");
        		 ps.executeUpdate();
        			response.sendRedirect("viewDailySpecifications.jsp?msg=exists"); 
        	 } else if (  midquantity > longquantity || midtermstaff > shortquantity){
        		 PreparedStatement ps = con.prepareStatement("update specification set midtermstaff='"+ midfinalstaff+"' where midtermstaff='"+midtermstaff+"'");
        		 ps.executeUpdate();
        		response.sendRedirect("viewDailySpecifications.jsp?msg=existm");  
        	 }else if (longquantity > shortquantity || longtermstaff > midquantity) {
        		 PreparedStatement ps = con.prepareStatement("update specification set longtermstaff='"+longfinalstaff+"' where longtermstaff='"+longtermstaff+"'");
        		 ps.executeUpdate();
      			response.sendRedirect("viewDailySpecifications.jsp?msg=existl");
        	 }else{
        	 
        	 System.out.println("nothing to update");
        	 } 
       
        }

} catch(Exception e){
	System.out.println(e);
	  System.out.println("No000");
}
%>
     