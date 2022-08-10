<%@page import="com.project.DbConnection" %>
<%@page import="java.sql.*" %>

<% 
String email = session.getAttribute("email").toString();
String id = request.getParameter("id");
String incdec = request.getParameter("quantity");

int price=0;
int total=0;
int quantity=0;
int final_total=0;

try {
	Connection con = DbConnection.getCon();
	Statement st = con.createStatement();
	ResultSet rs= st.executeQuery("select * from cart where email='"+email+"' and product_id='"+id+"' and address is NULL");
	while(rs.next()){
		price=rs.getInt(4);
		total=rs.getInt(5);
		quantity=rs.getInt(3);
	}
	if(quantity==1 && incdec.equals("decrement"))
		response.sendRedirect("myCart.jsp?msg=notPossible");
	else if(quantity !=1 && incdec.equals("decrement")){
		total=total-price;
		quantity=quantity-1;
		st.executeUpdate("Update cart set total='"+total+"', quantity='"+quantity+"' where email='"+email+"' and product_id='"+id+"' and address is NULL ");
		response.sendRedirect("myCart.jsp?msg=decrement");
	}
	else {
		total=total+price;
		quantity=quantity+1;
		st.executeUpdate("Update cart set total='"+total+"', quantity='"+quantity+"' where email='"+email+"' and product_id='"+id+"' and address is NULL ");
		response.sendRedirect("myCart.jsp?msg=increment");
	}
} catch(Exception e){
	System.out.println(e);
}

%>