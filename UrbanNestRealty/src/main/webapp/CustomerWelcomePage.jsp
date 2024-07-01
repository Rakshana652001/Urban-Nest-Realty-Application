<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="xml:lang">
<head>
<meta charset="ISO-8859-1">
<title>Customer Welcome Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: grey;
        background-position: center;
        margin: 0;
        padding: 0;
        height: 100%;
        overflow: hidden;
    }
    .navbar {
        display: flex;
        justify-content: center;
        align-items: center;
        background-color: #333;
        padding: 10px;
    }
    .navbar a {
        color: white;
        text-align: center;
        padding: 13px 13px;
        text-decoration: none;
        font-size: 18px;
        margin: 0 10px;
    }
    .navbar a:hover {
        background-color: #ddd;
        color: black;
    }
    .dropdown {
        position: relative;
        display: inline-block;
    }
    .dropdown-content {
        display: none;
        position: absolute;
        background-color: #f9f9f9;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 1;
    }
    .dropdown-content a {
        color: white;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
    }
    .dropdown:hover .dropdown-content {
        display: block;
        background: #333;
    }
    .dropdown:hover .dropbtn {
        background-color: #ddd;
        color: black;
    }
    .content {
        display: flex;
        justify-content: center;
        align-items: center;
        height: calc(100vh - 50px); 
    }
    h2 {
        font-family: "Times New Roman", Times, serif;
        color: white;
        display: flex;
        justify-content: center;
        align-items: initial;
        font-size: 2rem;       
    }
    
</style>
</head>
<body>
    
	<div class="navbar">
	<h2 class="text-center">Urban Nest Realty</h2>
		<a href="CustomerProfileServlet">Profile</a>
		<a href="WelcomePage.jsp">Home</a>
		<a href="RegisterdPropertiesServlet">Properties Under Review</a>
		<a href="RegisterBuyPropertiesServlet">Ready-to-Purchase</a>
		<a href="BuyedPropertiesServlet">Purchased Properties</a>
		<a href="WelcomePage.jsp">Log Out</a>
	</div>
    <div class="content">
    	<h2>Welcome to Customer Dashboard</h2>
    </div>
</body>
</html>