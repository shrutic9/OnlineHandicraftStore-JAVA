<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement,java.sql.Statement, java.sql.SQLException"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Insert title here</title>
</head>
<body>
    <%
        String name = request.getParameter("name");
        String lastname = request.getParameter("surname");
        String email = request.getParameter("email");
        String need = request.getParameter("need");
        String message = request.getParameter("message");

        Connection conn = null;
        PreparedStatement pstmt = null;
        
        String create="create table if not exists feedback(form_name varchar(25),last_name varchar(25),form_email varchar(30),form_need varchar(25),form_message varchar(100));";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String jdbcURL = "jdbc:mysql://localhost:3306/handicraft";
            String dbUsername = "root";
            String dbPassword = "123789";

            conn = DriverManager.getConnection(jdbcURL, dbUsername, dbPassword);
            Statement stmt=conn.createStatement();
            stmt.executeUpdate(create);
            
            String sql = "INSERT INTO feedback VALUES (?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, lastname);
            pstmt.setString(3, email);
            pstmt.setString(4, need);
            pstmt.setString(5, message);

            int rowsAffected = pstmt.executeUpdate();
            
            if (rowsAffected > 0) {
            	%>
            	<script>alert("Your query has been succesfully submitted! We'll reach back to you soon.")</script>
            	<jsp:forward page="index.html"></jsp:forward>
            <%  } else {
                out.println("<h2>Failed to submit feedback.</h2>");
            }


            // ... existing code ...
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    %>
</body>
</html>