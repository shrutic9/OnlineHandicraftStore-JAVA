<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Kalā - Cart</title>
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
@media(max-width:767px){
    .cart{
        padding: 4vh;
        border-bottom-left-radius: unset;
        border-top-right-radius: 1rem;
    }
}
.summary{
    background-color: #ddd;
    border-top-right-radius: 1rem;
    border-bottom-right-radius: 1rem;
    padding: 4vh;
    color: rgb(65, 65, 65);
}
@media(max-width:767px){
    .summary{
    border-top-right-radius: unset;
    border-bottom-left-radius: 1rem;
    }
}
.summary .col-2{
    padding: 0;
}
.summary .col-10
{
    padding: 0;
}.row{
    margin: 0;
}
.title b{
    font-size: 1.5rem;
}
.main{
    margin: 0;
    padding: 2vh 0;
    width: 100%;
}
.col-2, .col{
    padding: 0 1vh;
}
a{
    padding: 0 1vh;
}
.close{
    margin-left: auto;
    font-size: 0.7rem;
}
img{
    width: 3.5rem;
}
.back-to-shop{
    margin-top: 4.5rem;
}
h5{
    margin-top: 4vh;
}
hr{
    margin-top: 1.25rem;
}
form{
    padding: 2vh 0;
}
select{
    border: 1px solid rgba(0, 0, 0, 0.137);
    padding: 1.5vh 1vh;
    margin-bottom: 4vh;
    outline: none;
    width: 100%;
    background-color: rgb(247, 247, 247);
}
input{
    border: 1px solid rgba(0, 0, 0, 0.137);
    padding: 1vh;
    margin-bottom: 4vh;
    outline: none;
    width: 100%;
    background-color: rgb(247, 247, 247);
}
input:focus::-webkit-input-placeholder
{
      color:transparent;
}
.btnn{
    background-color: #000;
    border-color: #000;
    color: white;
    width: 100%;
    font-size: 0.7rem;
    margin-top: 4vh;
    padding: 1vh;
    border-radius: 0;
}
.btnn:focus{
    box-shadow: none;
    outline: none;
    box-shadow: none;
    color: white;
    -webkit-box-shadow: none;
    -webkit-user-select: none;
    transition: none; 
}
.btnn:hover{
    color: white;
}
 #code{
    background-image: linear-gradient(to left, rgba(255, 255, 255, 0.253) , rgba(255, 255, 255, 0.185)), url("https://img.icons8.com/small/16/000000/long-arrow-right.png");
    background-repeat: no-repeat;
    background-position-x: 95%;
    background-position-y: center;
}
a
{
text-decoration:none;
}
</style>

</head>
<%@page import="java.util.*" %>
<%@ page import="cart.*" %>

<body>
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
        <a class="nav-link" href="blog.html">Blog</a>
      </li>
        <li class="nav-item" style="font-size:22px;">
        <a class="nav-link" href="#"><i class="fa fa-shopping-cart"></i></a>
      </li>
       <li class="nav-item" style="font-size:22px;">
    <a class="nav-link" <% if(session.getAttribute("uname")!=null){ %>href="profile.jsp" <% } else { %>href="login1.jsp" <%} %> ><i class="fa fa-user"></i></a>
  </li>
    </ul>
  </div>
</nav>
<br><br>
<div class="card shadow" style="margin: auto;max-width: 950px;width: 90%;border-radius: 1rem;border: transparent;">
            <div class="row">
                <div class="col-md-8 cart">
                    <div class="title">
                        <div class="row"><%if(session.getAttribute("uname")!=null){ %>
                            <div class="col"><h5><b><%=session.getAttribute("uname")%>'s Shopping Cart</b></h5></div>
                            <div class="col-2 align-self-center text-right text-muted"> item(s)</div>
                        </div>
                    </div>   
                   
                <%
                     List<Product> cart = (List<Product>) session.getAttribute("cart");
               		 int cnt=0;double sum=0; 
                 if (cart != null) { 
                		       for (Product product : cart) {
                  %>
                  		<div class="row border-top border-bottom">
                        <div class="row main align-items-center">
                            <!-- div class="col-2"><img class="img-fluid" src="https://i.imgur.com/1GrakTl.jpg"></div> -->
                            <div class="col">
                                <div class="row text-muted"><%=product.getName()%></div>
                                <div class="row"><%=product.getDescription()%></div>
                            </div>
                            <div class="col-2">
                                <a href="#">-</a><a href="#" class="border">1</a><a href="#">+</a>
                            </div>
                            <div class="col-2"><%= product.getAmount()%> </div>
                            <div class="col-1">
                            <form method="post" action="Addtocart">
                   			<input type="hidden" name="prodId" value="<%= product.getId() %>">
                   			<input type="hidden" name="action" value="remove">
                   			<input type="submit" value="X" style="border:none;font-size:15px;">
               				</form></div>
                        </div>
                    </div>
                    <% cnt++; sum=sum+product.getAmount(); 
                   
                		       }
                    %>
                    
                    <div class="back-to-shop"><a href="product.html">&leftarrow;</a><span class="text-muted">Back to shop</span></div>
                </div>
                <div class="col-md-4 summary">
                    <div><h5><b>Summary</b></h5></div>
                    <hr>
                    <div class="row">
                        <div class="col" style="padding-left:0;">ITEMS <%=cnt %></div>
                        <div class="col text-right">₹ <%=sum  %></div>
                    </div><hr>
                    <form>
                        <p>SHIPPING:</p>
                        <select><option class="text-muted">Standard-Delivery- ₹50.00</option></select>
                        
                    </form>
                    <div class="row" style="border-top: 1px solid rgba(0,0,0,.3); padding: 2vh 0;">
                        <div class="col"><b>TOTAL PRICE :</b></div>
                        <div class="col text-right">₹ <%=sum+50  %></div>
                    </div>
                    <form method="post" action="checkout">
			  <input type="submit" class="btnn" value="CHECKOUT">
		  </form>
                </div>
            </div>
            
        </div>



<% 
request.setAttribute("cart", cart);

        }     
   }
   else
   	out.println("<script>alert('Please login first')</script>");
%>
</body><br><br>

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

  <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
    © 2023
    <a style="color: wheat;" href="index.php">Kalā - Online Handicraft Store</a>
  </div>

</footer> 

</html>