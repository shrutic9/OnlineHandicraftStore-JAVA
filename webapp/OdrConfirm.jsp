<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Kalā - Order Confirmation</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  
  <style>
  .navbar
	{
		padding: 5px 60px;
	}
	.navbar-brand
	{
		color: wheat;
		font-size: 50px;
		font-weight: bold;
	}
	.navbar-brand:hover
	{
		color:whitesmoke;
	}
	.nav-item
	{
		margin:0 20px;
		color: wheat;
	}
	.nav-link
	{
		color: wheat;
	}
	.jumbotron
{
	height: 650px;
	background:linear-gradient( rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url(https://img.freepik.com/premium-photo/colorful-vase-with-red-yellow-pattern-yellow-bowl-with-rice-it_948735-151165.jpg?size=626&ext=jpg&ga=GA1.1.386372595.1697846400&semt=ais);
	background-repeat: no-repeat;
	background-size: cover;
	padding: 250px;
	margin: 20px 0;
}

.btn-success:hover
{
background-color:wheat;
color:black;
}
  </style>
</head>
<body>

<%@ page import="java.util.List" %>
<%@ page import="cart.Product" %>
	<%@page import="java.sql.Statement"%>
	<%@page import="java.sql.Connection"%>
	<%@page import="java.sql.DriverManager"%>
	<%@page import="java.sql.ResultSet"%>
	<%@ page import="java.util.Calendar" %>
	<%@ page import="java.text.SimpleDateFormat" %>

	<nav class="navbar navbar-expand-lg" style="background-color: darkslategray;">
  <a class="navbar-brand" href="index.html">कला</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav ms-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.html">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="product.html">Products</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Blog</a>
      </li>
        <li class="nav-item" style="font-size:22px;">
        <a class="nav-link" href="cart.jsp"><i class="fa fa-shopping-cart"></i></a>
      </li>
       <li class="nav-item" style="font-size:22px;">
    <a class="nav-link" <% if(session.getAttribute("uname")!=null){ %>href="profile.jsp" <% } else { %>href="login1.jsp" <%} %> ><i class="fa fa-user"></i></a>
  </li>
    </ul>
  </div>
</nav>
</body>	
<br><br>

<div class="card shadow" style="width:50%;margin:auto;padding:30px;">
<img src="https://tlr.stripocdn.email/content/guids/CABINET_75694a6fc3c4633b3ee8e3c750851c02/images/67611522142640957.png" alt style="display: block;margin:auto;" width="120"></a></td>
 <br>
 <div class="esd-block-text es-p10b" align="center">
      <h2>Thank You For Shopping with us!</h2>
 </div>
  
    <p class="text-center" style="font-size: 16px; color: #777777;">Yay! Your Order has been confirmed! We cannot wait to deliver your order to you. Stay tuned.</p>
<hr>
 <div class="title" style="background-color:lightgray;">
       <div class="row" style="padding:13px;">
             <div class="col"> <h5><b>Order Summary #</b></h5></div>
       </div>
 </div>   
		<% List<Product> cart=(List<Product>) request.getSession().getAttribute("cart");
			double sum=0;
			if(cart!=null)
			{
				for(Product prod:cart)
				{
		%>                    <p>
<div class="row" style="padding-left:12px;">
<div class="col-9"><b><%= prod.getName() %></b>
<div ><%= prod.getDescription() %></div>
</div>
<div class="col-3"><b>₹ <%= prod.getAmount() %></b></div>
</div>
      <% sum=sum+prod.getAmount();
 } %>
<p>
<div class="row"  style="padding-left:12px;">
	<div class="col-9"><b>Shipping Charges</b>
	</div>
	<div class="col-3"><b>₹ 50</b></div>
	</div>

<hr>
<div class="row" style="padding-left:12px;">
<div class="col-9"><b>TOTAL: </b></div>
<div class="col-3"><b>₹ <%= sum+50%></b></div>
<% } %>
</div>
<hr>

<%
String mail=String.valueOf(session.getAttribute("email"));
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/handicraft","root","123789");
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from regi where email='"+mail+"';");
	if(rs.next())
	{
		String add=rs.getString(3);
	
	%>
	
	   
    <div class="row" style="padding-left:12px;">
    <div class="col-7"><b>Shipping Address: </b><br>
    <p><%= add %></p>
    <% 		}
	con.close();
	}
		catch(Exception e){}%>
    </div>
    <div class="col-5"><b>Delivery by:</b><br>
    <p><%Calendar calendar = Calendar.getInstance();

		 calendar.add(Calendar.DAY_OF_MONTH, 7);
		 SimpleDateFormat sdf = new SimpleDateFormat("EEEE, MMMM dd, yyyy");
		 String newdate = sdf.format(calendar.getTime());
		 out.print(newdate);
    %> </p>
    </div>
    </div>
<hr><br>
<div class="row">
<button class="btn btn-success" style="background-color:darkslategray;width:50%;height:60px;margin:auto;"><a href="product.html" style="color:white;text-decoration:none;">Continue Shopping</a></button>
</div>
</div>

    
 <br><br>
</body>

<footer class=" text-center" style="background-color:darkslategray;color:wheat;">
  <div class="container p-4 pb-0">
    <h6>Follow us:</h6><p>
    <section class="mb-4">
      <a class="btn btn-outline-light btn-floating m-2" href="https://www.facebook.com/" role="button">
		  <i class="fa fa-facebook-f"></i></a>

      <a class="btn btn-outline-light btn-floating m-2" href="https://twitter.com/" role="button">
		  <i class="fa fa-twitter"></i></a>

      <a class="btn btn-outline-light btn-floating m-2" href="https://www.google.com/" role="button">
		  <i class="fa fa-google"></i></a>

      <a class="btn btn-outline-light btn-floating m-2" href="https://www.instagram.com/" role="button">
        <i class="fa fa-instagram"></i></a>
    </section>
  </div>

  <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);"> © 2023
    <a style="color: wheat;" href="index.php">Kalā - Online Handicraft Store</a>
  </div>

</footer> 
</html>