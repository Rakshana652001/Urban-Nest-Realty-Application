<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Customer Welcome Page</title>
<link rel="icon" type="image/x-icon" href="Images/Nest Realty.jpg">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<style>
@import url('https://fonts.googleapis.com/css2?family=Lora:ital,wght@0,400..700;1,400..700&display=swap');
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Lora", serif;
}

section {
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}

.navbar {
    background-color: #818589;
    width: 100%;
    margin: 0;
    padding: 0;
    position: sticky;
  	top: 0;
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

#home {
    background: url('Images/Customer.jpg') no-repeat center;
    background-size: cover;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    background-attachment: fixed;
}
#logout
{
	position: relative;
	left: 3rem;
}

.dropdown:hover .dropdown-menu {

   display: block;
   margin-top: 0;
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
          <a class="nav-link active" href="Home.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="PropertiesUnderReview">Properties Under Review</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="RegisterBuyProperties">Ready-to-Purchase</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="PurchasedProperties">Purchased Properties</a>
        </li>
         <li class="nav-item">
          <a class="nav-link active" href="http://localhost:9000/CustomerHistory">Transaction History</a>
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
<section id="home">
    
</section>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>