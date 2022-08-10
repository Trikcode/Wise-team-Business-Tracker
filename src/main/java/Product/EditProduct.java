package Product;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import com.project.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/editProduct")
public class EditProduct extends HttpServlet {
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
			Statement st = con.createStatement();
			st.executeUpdate("update product set name='"+name+"', category='"+category+"', price='"+price+"', staff='"+staff+"', active='"+active+"' where id ='"+id+"'");
			if(active.equals("No")) {
				st.executeUpdate("delete from cart where product_id='"+id+"' and address is Null");
				response.sendRedirect("./admin/allProductEditProduct.jsp?msg=success");
			}
			else {
				response.sendRedirect("./admin/allProductEditProduct.jsp?msg=success");
			}
					
		}
		catch (Exception e) {
			System.out.println(e);
			response.sendRedirect("./admin/allProductEditProduct.jsp?msg=failed");
		
		}
	}
}
