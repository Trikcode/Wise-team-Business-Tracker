package Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import com.project.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/specify")
public class AddNewSpecification  extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
HttpServletResponse response)
		throws ServletException, IOException
	{
		String numoflongtermproducts = request.getParameter("numoflongtermproducts");
				
		int numofmidtermproducts = 2 * Integer.parseInt(numoflongtermproducts) ;
		int numofshorttermproducts = 5 * numofmidtermproducts;
		
		String midtermstaffnumber = request.getParameter("midtermstaffnumber");
		String shortstaff = request.getParameter("staff");
		String category = request.getParameter("category");
		
		int longtermstaffnumber;
		int shorttermstaffnumber;
		longtermstaffnumber = 2 * Integer.parseInt(midtermstaffnumber);
		shorttermstaffnumber = (1/4) * longtermstaffnumber;
		
		
	     PrintWriter pw = response.getWriter();

         java.util.Date date = new java.util.Date();
         pw.println("<h2>"+"Current Date & Time: " +date.toString()+"</h2>");
         pw.println("Numof pro"+ numofproducts);
         pw.println("short"+shortstafftime);
         pw.println("cat"+category);
         pw.println("longterm" + longtermstaff);
         pw.println("mid"+ midtermstaff);
		
		try {
		
			// Initialize the database
			Connection con = DbConnection.getCon();
			PreparedStatement ps = con.prepareStatement("insert into specification values(?, ?, ?, ?, ?, ?)");
			ps.setString(1, numofproducts);
			ps.setString(2, category);
			ps.setString(3, shortstafftime);
			ps.setInt(4, midtermstaff);
			ps.setInt(5,longtermstaff);
						
			ps.executeUpdate();

			// Close all the connections
			ps.close();
			con.close();
			response.sendRedirect("./admin/addNewSpecification.jsp?msg=success");

		
		}
		catch (Exception e) {
			System.out.println(e);
			response.sendRedirect("./admin/addNewSpecification.jsp?msg=failed");
		
		}
	}
}
