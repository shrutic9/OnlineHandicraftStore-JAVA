<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Kalā - Profile</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<link rel="stylesheet" type="text/css" href="bootstrap-4.5.3-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="profile.css">
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
.butt
{
	text-decoration: none;
	border: 2px solid wheat;
	padding:20px 30px;
	margin-top: 40px;
	color: wheat;
	border-radius: 10px;
}
.butt:hover
{
	background-color: wheat;
	color: black;
}
.cart{
    background-color: #fff;
    padding: 4vh 5vh;
    border-bottom-left-radius: 1rem;
    border-top-left-radius: 1rem;
}
@media{
    .cart{
        padding: 4vh;
        border-bottom-left-radius: unset;
        border-top-right-radius: 1rem;
    }
    
    body{
	background-color: lightgray;
}
.main{
	padding: 20px;
	font-family: Arial, Helvetica, sans-serif ;
}
.topbar{
	background-color: teal;
	overflow: hidden;
}
.topbar a{
	float: right;
	color:whitesmoke;
	text-align: center;
	padding: 20px 26px;
    text-decoration: none;
    font-size: 26px;
}
.sidebar{
	background-color: white;
	color: black;
	padding:97px;
	/*height: 100%;*/
}
.sidebar a{
	margin-left:10px;
	display: block;
	color: white;
	font-size: 30px;
	text-decoration: none;
}
.card{
	position: relative;
	display: flex;
	flex-direction: column;
}
.content{
	background-color: whitesmoke;
	padding:0 40px;
}
}
</style>
 
 </head>
<body>

<%@page import="java.sql.Statement"%>
	<%@page import="java.sql.Connection"%>
	<%@page import="java.sql.DriverManager"%>
	<%@page import="java.sql.ResultSet"%>

<% if(session.getAttribute("uname")!=null){ %>
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
        <li class="nav-item" style="font-size:25px;">
        <a class="nav-link" href="cart.jsp"><i class="fa fa-shopping-cart"></i></a>
      </li>
    </ul>
  </div>
</nav>
    <!-- Profile Picture -->
    <div class="row" style="margin:auto;padding:60px 120px 0;">
      <div class="col-md-4 mt-1">
        <div class="card text-center sidebar shadow">
          <div class="card-body">
            <img src="https://t4.ftcdn.net/jpg/04/83/90/95/360_F_483909569_OI4LKNeFgHwvvVju60fejLd9gj43dIcd.jpg" width="150">
            <div class="mt-3">
             <h3> <%= session.getAttribute("uname") %> </h3>
          </div>
        </div>
        </div>
        </div>
        <%
        String mail=String.valueOf(session.getAttribute("email"));
				try
				{
					Class.forName("com.mysql.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/handicraft","root","123789");
					Statement stmt=con.createStatement();
					%>
					
        <!-- About Section -->
        <div class="col-md-8 mt-1">
         <div  class="card mb-3 content shadow">
           <h1 class="m-3 pt-3">About</h1>
            <div class="card-body" >
             <%
				
					ResultSet rs=stmt.executeQuery("select * from regi where email='"+mail+"';");
					if(rs.next())
					{	
	%>
                  <hr>
                  <div class="row" >
                    <div class="col-md-4">
                          <h5>Email</h5>
                    </div>
                    <div class="col-md-7 text-secondary">
                          <%= mail %>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-md-4">
                     <h5>Phone</h5>
                    </div>
                    <div class="col-md-6 text-secondary">
                           <%= rs.getString(4) %>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-md-4">
                          <h5>Address</h5>
                    </div>
                    <div class="col-md-7 text-secondary">
                           <%= rs.getString(3) %>
                    </div>
                  </div> <% } %>
                  <hr>
                </div>
                <form action="logout" method="post" style="margin:auto;padding:20px;">
              <input type="submit" class="btn btn-success" value="Logout">
              </form>
              </div>              
           </div>
           
           <div class="row" style="padding-top:25px;">
           <div class="card shadow" style="padding:30px 90px;">
          		<h1 class="m-3 pt-3 text-center">Order History</h1><br>
           		<hr>
           		<% ResultSet nrs=stmt.executeQuery("select * from consumer where cname='"+mail+"';");
           		int cnt=1;
				while(nrs.next())
				{	 %> 
				
				<div class="row" >
				<div class="col-2 text-center" ><b><%=cnt %></b>
				</div>
				<div class="col-6" style="padding-left:50px;"><b><%=nrs.getString("pname") %></b><br>
				<%=nrs.getString("pdesc") %>
				</div>
				<div class="col-4"><b><%=nrs.getDouble("pamt") %></b></div>
				</div>
				<hr>
			<% cnt++;	}%>
           </div>
           
           </div>
           
        </div>
        <br><br>
        
    
  <%
				}
				catch(Exception e){}
				} else { response.sendRedirect("login1.jsp"); } %>
<!--  <button type="button" class="btn btn-success"><% //session.setAttribute("uname",null); session.invalidate(); %>Logout</button>-->
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