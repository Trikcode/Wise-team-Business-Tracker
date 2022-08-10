<%@page import="com.project.DbConnection" %>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>

<%

String numoflongtermproducts = request.getParameter("numoflongtermproducts");

int numofmidtermproducts = 2 * Integer.parseInt(numoflongtermproducts) ;
int numofshorttermproducts = 5 * numofmidtermproducts;

String midtermstaffnumber = request.getParameter("midtermstaffnumber");


int longtermstaffnumber;
double shorttermstaffnumber;
longtermstaffnumber = 2 * Integer.parseInt(midtermstaffnumber);
shorttermstaffnumber = (0.25) * longtermstaffnumber;
int finalshorttermstaffnumber = (int)shorttermstaffnumber;

if (Integer.parseInt( numoflongtermproducts) > 4){
	response.sendRedirect("specifyNumberOfProducts.jsp?msg=tobig");
}else{

try {

	// Initialize the database
	Connection con = DbConnection.getCon();
	PreparedStatement ps = con.prepareStatement("insert into specification(shorttermproducts,midtermproducts, longtermproducts, shortstafft, midtermstaff, longtermstaff, currentdate) values(?,?,?,?,?,?, NOW())");
	ps.setInt(1,  numofshorttermproducts);
	ps.setInt(2, numofmidtermproducts);
	ps.setInt(3, Integer.parseInt( numoflongtermproducts));
	ps.setInt(4,finalshorttermstaffnumber);
	ps.setInt(5, Integer.parseInt(midtermstaffnumber));
	ps.setInt(6,longtermstaffnumber);
	
				
	ps.executeUpdate();

	// Close all the connections
	ps.close();
	con.close();
	response.sendRedirect("specifyNumberOfProducts.jsp?msg=success");


}
catch (Exception e) {
	System.out.println(e);
	response.sendRedirect("specifyNumberOfProducts.jsp?msg=failed");

}}
%>