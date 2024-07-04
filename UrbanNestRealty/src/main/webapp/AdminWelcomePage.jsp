<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Admin Welcome Page</title>
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
        padding: 13px 15px;
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
<a class="nav-link active" href="http://localhost:9000/#home">Home</a>
    <a href="AdminProfile">Profile</a>
    <div class="dropdown">
        <a href="javascript:void(0)" class="dropbtn">Clients</a>
        <div class="dropdown-content">
        <nav class="navbar navbar-dark bg-dark">
    
  </nav>
            <a href="SellerCustomerDetails">Seller</a>
            <a href="CustomerDetails">Customer</a>
        </div>
    </div>
   
    <div class="dropdown">
        <a href="javascript:void(0)" class="dropbtn">Seller Properties</a>
        <div class="dropdown-content">
        	<a href="PendingProperty">Pending</a>
            <a href="Authorized">Authorized</a>
        </div>
    </div>
    <a href="ApproveToBuyServlet">Payment Approval</a>
    <a href="RegisteredPropertiesServlet">Closed Deals</a>
    <a href="http://localhost:9000/#home">Logout</a>
     <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>      
    </button>
</div>
<div class="content">
    <h2>Welcome to the Admin Dashboard</h2>
</div>
</body>
</html>
