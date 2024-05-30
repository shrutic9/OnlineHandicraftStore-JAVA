<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Kalā - Login</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
 
 <style>
	 section
	 {
		 min-height:739px;
	 }
 </style>
</head>
<body>
	<%@page import="java.sql.Statement"%>
	<%@page import="java.sql.Connection"%>
	<%@page import="java.sql.DriverManager"%>
	<%@page import="java.sql.ResultSet"%>
	<%@page session="false" %>

<%
String mail=request.getParameter("mail");
String pass=request.getParameter("pass");

try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/handicraft","root","123789");
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from regi where email='"+mail+"' and pass='"+pass+"';");
	if(rs.next())
	{
		String name=rs.getString(1);
		request.getSession().setAttribute("uname",name);
		request.getSession().setAttribute("email",mail);
		out.println("<script>alert('Login Successful!');</script>");%>
		<jsp:forward page="profile.jsp" /><%
	}
	else
		out.println("<script>alert('User does not exists! Try again');</script>");
	con.close();
}
catch(Exception e){}
	
%>

</body>
</html>