import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;
import java.sql.*;
import java.util.*;

import cart.*;

public class Addtocart extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/html");
        try {
            int id = Integer.parseInt(request.getParameter("prodId"));

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/handicraft", "root", "123789");
            Statement stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("select * from product where pid=" + id + ";");

            if (rs.next()) {
                String pname = rs.getString(2);
                String pdesc = rs.getString(3);
                Double pamt = rs.getDouble(4);
                int pquant = rs.getInt(5);
                PrintWriter out=response.getWriter();
                
                Product  product = new Product(id, pname, pdesc, pamt,pquant);

                String action = request.getParameter("action");
                if (action != null && action.equals("remove")) {
                    // Remove product from cart
                    removeFromCart(request);
                } 
                else
                {
                	addToCart(request, product);
                }
				
	            response.sendRedirect("cart.jsp");
                
            }
            con.close();    
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    private void addToCart(HttpServletRequest request, Product product) {
    	
        HttpSession session = request.getSession(true);
        List<Product> cart = (List<Product>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        cart.add(product);

        session.setAttribute("cart", cart);
    }
    
    private void removeFromCart(HttpServletRequest request) {
        String productId = request.getParameter("prodId");
        HttpSession session = request.getSession(true);
        List<Product> cart = (List<Product>) session.getAttribute("cart");

        if (cart != null) {
        	for (Product prod : cart) {
        		if(productId.equals(String.valueOf(prod.getId()))) {

        	        cart.remove(prod);
        	        break; 
        	    }
        	}
            session.setAttribute("cart", cart);
        }
    }
} 