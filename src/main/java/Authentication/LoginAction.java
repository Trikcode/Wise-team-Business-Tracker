package Authentication;
import com.project.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Signin")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
HttpServletResponse response)
		throws ServletException, IOException
	{
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		HttpSession session=request.getSession(); 
		if("admin@gmail.com".equals(email) && "admin".equals(password))
		{
			session.setAttribute("email", email);
			response.sendRedirect("admin/adminHome.jsp");
			
		}
		else {
			int z = 0;
			try {
				Connection con = DbConnection.getCon();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select * from users where email='"+email+"' and password='"+password+"'");
				
				while(rs.next()) {
					z=1;
					session.setAttribute("email", email);
					response.sendRedirect("home.jsp");
				}
				if(z==0) {
					response.sendRedirect("login.jsp?msg=notexist");
				}
			} catch(Exception e) {
				System.out.println(e);
				response.sendRedirect("login.jsp?msg=invalid");
			}
		}
	}
}
