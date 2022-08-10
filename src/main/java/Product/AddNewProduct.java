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

@WebServlet("/addNewProduct")
public class AddNewProduct  extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
HttpServletResponse response)
		throws ServletException, IOException
	{
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String category = request.getParameter("category");
		String price = request.getParameter("price");
		String staff = request.getParameter("staff");
		String active = request.getParameter("active");
		try {
		
			// Initialize the database
			Connection con = DbConnection.getCon();
			PreparedStatement ps = con.prepareStatement("insert into product values(?, ?, ?, ?, ?, ?, ?)");
			ps.setString(1, id);
			ps.setString(2, name);
			ps.setString(3, category);
			ps.setString(4, price);
			ps.setString(5, staff);
			ps.setString(6, active);
			ps.setInt(7, 0);
			
			ps.executeUpdate();

			// Close all the connections
			ps.close();
			con.close();
			response.sendRedirect("./admin/addNewProduct.jsp?msg=success");

		
		}
		catch (Exception e) {
			System.out.println(e);
			response.sendRedirect("./admin/addNewProduct.jsp?msg=failed");
		
		}
	}
}
