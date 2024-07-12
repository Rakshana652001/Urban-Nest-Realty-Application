<%@page import="java.util.Base64"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.chainsys.urbannestrealty.model.Sales" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="xml:lang">
<head>
<meta charset="ISO-8859-1">
<title>Properties Under Review</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="icon" type="image/x-icon" href="Images/Nest Realty.jpg">
<style>
body {
    font-family: "Lora", serif;
    background-color: #D8CCC0;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    color: #333;
}

h3 {
    text-align: center;
    margin-bottom: 20px;
    color: white;
}

.table-container {
    margin: 10px;
}

table {
    width: 100%;
    max-width: 1000px;
    border-collapse: collapse;
    background-color: white;
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

th, td {
    padding: 10px;
    text-align: left;
    border: 1px solid #ddd;
}

th {
    background-color: #f4f4f4;
}

td img {
    max-width: 100px;
    height: auto;
    display: block;
}

button, .btn-action, input[type="submit"] {
    padding: 10px;
    border: none;
    border-radius: 4px;
    background-color: #818589;
    color: white;
    cursor: pointer;
    margin: 5px;
}

button:hover, .btn-action:hover, input[type="submit"]:hover {
    background-color: #333;
}

.actions {
    display: flex;
    gap: 10px;
    justify-content: center;
}
.navbar {
    background-color: #818589;
    width: 100%;
    margin: 0;
    padding: 0;
    position: sticky;
    top:0;
  	left: 0;
  	margin-bottom: 25px;
  	}

.nav-item {
	position: relative;
	right: 5rem;
	margin-right: 25px;
}
.nav-item.active {
	 border-radius: 12px; 
  color: #111;
  transform: scale(1.2);
  text-shadow: none;
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

  border-radius: 12px; 
  color: #111;
  transform: scale(1.2);
  text-shadow: none;
}
#logout
{
	position: relative;
	left: 5rem;
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

<table border="1">
    <thead>
        <tr>
            <th>Customer ID</th>
            <th>Seller ID</th>
            <th>Government Id</th>
            <th>Property Address</th>
            <th>Property Total Amount</th>
            <th>Payable Amount</th>
            <th>Payment Method</th>
            <th>Approval Status</th>
            <th>Payment Status</th>
        </tr>
    </thead>
    <tbody>
        <% 
        ArrayList<Sales> list = (ArrayList<Sales>) request.getAttribute("list");
        if(list!=null && !list.isEmpty())
        {
        	for (Sales object : list)
            {
                byte[] images = object.getGovernmentId();
                String getImage;
                getImage = Base64.getEncoder().encodeToString(images);  
        %>
            <tr>
                <td><%= object.getCustomerId() %></td>
                <td><%=object.getSellerId() %></td>
                <td> 
               	<img alt="House" src="data:image/jpeg;base64,<%= getImage %> ">      
                </td>
                <td><%=object.getPropertyAddress() %></td>
                <td><%= object.getTotalAmount() %></td>
                <td><%=object.getPayableAmount() %></td>
                <td><%= object.getPaymentMethod() %></td>
                <td><%= object.getApproval() %></td>
                <td><%=object.getPaidStatus() %></td>
            </tr>             
        <%
            }
        }
        else
        {
        	%>
				<tr>
					<td colspan="15">No Records found</td>
				</tr>
			<%
        }
       	%>
     
    </tbody>
</table>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
document.addEventListener('DOMContentLoaded',
	    function () {
	        const navItems = document
	            .querySelectorAll('.nav-item');
	 
	        navItems.forEach(item => {
	            item.addEventListener('click',
	                function () {
	                    navItems.forEach(navItem => navItem
	                        .classList.remove('active'));
	                    this.classList.add('active');
	                });
	        });
	    });
</script>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>
