

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.*;

/**
 * Servlet implementation class register
 */
public class register extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String name=request.getParameter("nm");
		String pass=request.getParameter("pass");
		String add=request.getParameter("addr");
		int num=Integer.parseInt(request.getParameter("cno"));
		String mail=request.getParameter("email");
		
		String create="create table if not exists regi(name varchar(25),pass varchar(25),address varchar(25),num int(10),email varchar(50) primary key);";
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/handicraft","root","123789");
			Statement stmt=con.createStatement();
			stmt.executeUpdate(create);
			int i=stmt.executeUpdate("insert into regi values('"+name+"','"+pass+"','"+add+"',"+num+",'"+mail+"');");
			if(i>0)
			{
				out.println("<script>alert('Registration Successful!');</script>");
			}
			else
				response.sendRedirect("register.html");
			con.close();
		}
		catch(Exception e)
		{
			
		}
	}
}
