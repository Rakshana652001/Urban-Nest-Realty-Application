<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Urban Nest Realty</title>
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

h1, p {
    color: #343a40;
}

.navbar {
    background-color: #FF9999;
    width: 100%;
    margin: 0;
    padding: 0;
}

.navbar-brand img {
    height: 80px;
}

#navbarSupportedContent a{
  font-size: 19px;
}
#navbarSupportedContent a:hover{
  border-bottom: 3px solid white;
  
}
.active:hover{
  color: black !important;
  border-radius: 12px;
}

.dropdown-menu {
    background-color: #FF9999;
    border: none;
}

.dropdown-item{
     color: white;
}

.dropdown-item:hover {
    background-color: #FF9999;
    border-radius: 12px;
}

.form-control {
    border-radius: 5px;
    border: 1px solid #ced4da;
    padding: 8px 15px;
}

.card img {
    height: 200px;
    object-fit: cover;
}

.btn-outline-dark {
    border-color:  !important;
}



#footer {
    color: white;
    background-color: #FDDFDF;
    padding: 10px 0;
    text-align: center;
}

#home {
    background: url('Images/home.png') no-repeat center center;
    background-size: cover;
    color: white;
    text-align: center;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
}

.card {
    background: #FF9999 !important;
    box-shadow: 5px 5px 20px rgb(19, 19, 21);
    border-radius: 20px !important;
    overflow: hidden;
    justify-content: center;
    align-items: center;
    margin: 15px;
}

#contact h2 {
    margin-bottom: 20px;
}

#contact .form-group {
    margin-bottom: 20px;
}
</style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark">
 <div class="container">
     <a class="navbar-brand" href="#">
        <img src="Images/Nest Realty.jpg" alt="Logo">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <a class="navbar-brand" href="javascript:history.back()">Back</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" href="#home">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="#realties">Realties</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="#about">About Us</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="#contact">Contact</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link active dropdown-toggle" href="#" id="navbarDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Account
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="UserRegistration.jsp">Register</a>
            <a class="dropdown-item" href="AdminLogin.jsp">Login</a>
          </div>
        </li>
      </ul>
      <form class="form-inline my-2 my-lg-0" action="Search">
        <input class="form-control mr-sm-2" type="search" name="propertyName" placeholder="Search..(Plot, showroom, PG, complex floor)" aria-label="Search">
      </form>
    </div>
  </div>
</nav>
<section id="home">
    
</section>
<section id="realties" class="container mt-5">
    <div class="row justify-content-around">
        <div class="col-lg-3 col-md-4 col-12 mb-4">
            <div class="card">
                <img src="Images/House.jpg" class="card-img-top" alt="House">
                <div class="card-body text-center">
                  <h5 class="card-title">Residential</h5>
                  <a href="Residential" class="btn btn-outline-dark">See More</a>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-4 col-12 mb-4">
            <div class="card">
                <img src="Images/Land.jpg" class="card-img-top" alt="Land">
                <div class="card-body text-center">
                  <h5 class="card-title">Land</h5>
                  <a href="Land" class="btn btn-outline-dark">See More</a>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-4 col-12 mb-4">
            <div class="card">
                <img src="Images/Flat.webp" class="card-img-top" alt="Industrial">
                <div class="card-body text-center">
                  <h5 class="card-title">Industrial</h5>
                  <a href="Industrial" class="btn btn-outline-dark">See More</a>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-4 col-12 mb-4">
            <div class="card">
                <img src="Images/Shop.webp" class="card-img-top" alt="Commercial">
                <div class="card-body text-center">
                  <h5 class="card-title">Commercial</h5>
                  <a href="Commercial" class="btn btn-outline-dark">See More</a>
                </div>
            </div>
        </div>
    </div>
</section>
<section id="about" class="container mt-5">
    <div class="row">
        <div class="col-lg-6 mb-4">
            <img src="Images/quality.jpg" alt="About Us">
        </div>
        <div class="col-lg-6">
            <h1>About Urban Nest Realty</h1>
            <p>Welcome to Urban Nest Realty, your trusted partner in real estate transactions. Our mission is to provide exceptional service and help you find your dream property. Whether you are buying, selling, or investing, we are here to guide you every step of the way.</p>
            <p>With years of experience in the real estate industry, our team of professionals is committed to delivering outstanding results. We pride ourselves on transparency, integrity, and customer satisfaction.</p>
            <p>Explore our website to discover a wide range of properties, from residential homes to commercial spaces. Feel free to contact us for any inquiries or assistance. We look forward to serving you!</p>
        </div>
    </div>
</section>
<section id="contact" class="container mt-5">
    <div class="text-center">
        <h2>Contact Us</h2>
        <p>If you have any questions, please feel free to reach out to us at rakshana@gmail.com or call us at 7339263883.</p>
        <form action="ContactServlet" method="post">
            <div class="form-group">
                <label for="email">Email address:</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
            </div>
            <div class="form-group">
                <label for="query">Your Query:</label>
                <textarea class="form-control" id="query" name="query" rows="4" placeholder="Enter your query" required></textarea>
            </div>
            <button type="submit" class="btn btn-outline-dark">Submit</button>
        </form>
    </div>
</section>
<footer id="footer">
    <p>&copy; 2024 Urban Nest Realty. All rights reserved.</p>
</footer>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
