package Authentication;
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


@WebServlet("/Signup")
public class SignupAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
HttpServletResponse response)
		throws ServletException, IOException
	{
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String gender = request.getParameter("gender");
		String location = request.getParameter("location");
		String preference = request.getParameter("preference");
		try {
		
			// Initialize the database
			Connection con = DbConnection.getCon();
			PreparedStatement ps = con.prepareStatement("insert into users values(?, ?, ?, ?, ?, ?)");
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, gender);
			ps.setString(4, password);
			ps.setString(5, preference);
			ps.setString(6, location);
			
			ps.executeUpdate();

			// Close all the connections
			ps.close();
			con.close();
			response.sendRedirect("signup.jsp?msg=valid");

		
		}
		catch (Exception e) {
			System.out.println(e);
			response.sendRedirect("signup.jsp?msg=invalid");
		
		}
	}
}
