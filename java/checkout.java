

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import cart.*;

/**
 * Servlet implementation class checkout
 */
public class checkout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkout() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession(true);
		 
		 if (session != null) {
		        List<Product> cart = (List<Product>) session.getAttribute("cart");
		        
		 try {
         	String create="create table if not exists consumer(cname varchar(50),pname varchar(50),pdesc varchar(50),pamt double);";
	            Class.forName("com.mysql.jdbc.Driver");
	            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/handicraft", "root", "123789");
	            Statement stmt = con.createStatement();
	            stmt.executeUpdate(create);
	            PreparedStatement ps=con.prepareStatement("insert into consumer(cname,pname,pdesc,pamt) values(?,?,?,?)");
	            
	            for(Product product:cart)
	            {
	            	ps.setString(1,(String)session.getAttribute("email"));
	            	ps.setString(2, product.getName());
	            	ps.setString(3, product.getDescription());
	            	ps.setDouble(4,product.getAmount());
        		
	            	ps.addBatch();
	            	
            	} 
	            int[] updateCounts = ps.executeBatch();
            		   con.close();
		 }
    		catch(Exception e){}
		 
		    
		       if (cart != null) {
		        	RequestDispatcher dispatcher = request.getRequestDispatcher("OdrConfirm.jsp");
		        	dispatcher.forward(request, response);
		        }
	}

}
}
