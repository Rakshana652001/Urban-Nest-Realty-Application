<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.chainsys.urbannestrealty.model.User" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Customer Profile</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="icon" type="image/x-icon" href="Images/Nest Realty.jpg">
<style>

    body {
        font-family: "Lora", serif;
        background-color: #D8CCC0;
        margin: 0;
        padding: 0;
    }
    h3 {
        text-align: center;
        margin-top: 30px;
        color: white;
        font-size: 25px;
    }
    .cardContainer {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        padding: 20px;
    }
    .card {
        background-color: white;
        border: 1px solid #ddd;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        margin: 15px;
        padding: 20px;
        width: 300px;
        box-sizing: border-box;
    }
    
    button, .btn-action, input {
    padding: 10px;
    border: none;
    border-radius: 12px;
    background-color: #818589;
    color: white;
    cursor: pointer;
    flex: 1;
    margin: 5px;
     font-family: "Lora", serif;
}
label{
	color: white;
}
button:hover, .btn-action:hover {
    background-color: #333;
}
.navbar {
    background-color: #818589;
    width: 100%;
    margin: 0;
    padding: 0;
    position: sticky;
    top:0;
  	left: 0;
  	}

.nav-item {
	position: relative;
	right: 5rem;
	margin-right: 25px;
}
 
 
.navbar-brand
{
	position: relative;
	right: 40px;
}
.dropdown-menu {
    background-color: #818589;
    border: none;
}

.dropdown-item{
     color: white;
     }


.dropdown-item:hover {
    background-color: #818589;
    border-radius: 12px;
}
.dropdown:hover .dropdown-menu {

   display: block;
   margin-top: 0;
}
.navbar-brand img {
    position: relative;
	right: 2rem;
    height: 90px;
    width: 100px;
}
#navbarSupportedContent a{
  font-size: 16.7px;
}
#navbarSupportedContent a:hover{
  border-bottom: 2.5px solid white;
}
.active:hover{
  color: black !important;
  border-radius: 12px;
}
#logout
{
	position: relative;
	left: 16rem;
}

</style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark">
 <div class="container">
     <a class="navbar-brand">
        <img src="Images/Nest Realty.png" alt="Logo">
    </a>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" href="CustomerWelcomePage.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="http://localhost:9000/PropertiesUnderReview">Properties Under Review</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="http://localhost:9000/RegisterBuyProperties">Ready-to-Purchase</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="http://localhost:9000/PurchasedProperties">Purchased Properties</a>
        </li>
         <li class="nav-item dropdown" id ="logout">
          <img src="Images/profile.png" alt="Cinque Terre" width="50" height="50" style="position: relative; left: 2rem;">
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="CustomerProfile">Profile</a>
            <a class="dropdown-item" href="LogOut">LogOut</a>
          </div>
        </li>
      </ul>
    </div>
  </div>
</nav>
<h3>Profile</h3>
<div class="cardContainer">
	<% 
    ArrayList<User> list = (ArrayList<User>)request.getAttribute("list");
    for (User object : list) { 
    %>
    <div class="card">
            	<p><strong>ID: </strong><%= object.getGeneratedUserID() %></p>
            	<p><strong>Name: </strong><%= object.getName() %></p>
            	<p><strong>Phone Number: </strong><%= object.getPhoneNumber() %></p>
            	<p><strong>Email ID: </strong><%= object.getEmailID() %></p>
            	<p><strong>Address: </strong><%= object.getAddress() %></p>
            	<p><strong>District: </strong><%= object.getDistrict() %></p>
            	<p><strong>State: </strong><%= object.getState() %></p> 
            	   
            	<form action="UpdateCustomerDetails.jsp">
            	<input type="hidden" value="<%=object.getName() %>" name="name">
            	<button>Update</button>
            	</form>
   	</div>
	<% 
    } 
    %>
</div>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
 
</body>
</html>
