package Product;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import com.project.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/orders")
public class ProcessOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession session=request.getSession();
		String email = session.getAttribute("email").toString();
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String paymentMethod = request.getParameter("paymentMethod");
		String status="bill";
		String transactionId="";
		transactionId = request.getParameter("transactionId");
		
		try {
		
			// Initialize the database
			Connection con = DbConnection.getCon();
		
			
			PreparedStatement ps1 = con.prepareStatement("update cart set address=?, city=?, paymentMethod=?, transactionid=?, status=? where email=? and address is NULL");
			ps1.setString(1, address);
			ps1.setString(2, city);	
			ps1.setString(3, paymentMethod);
			ps1.setString(4, transactionId);
			ps1.setString(5, status);
			ps1.setString(6, email);
			
			ps1.executeUpdate();
			// Close all the connections
			ps1.close();
			con.close();
			response.sendRedirect("bill.jsp?msg=success");

		
		}
		catch (Exception e) {
			System.out.println(e);
			
		
		}
	}
}
