<%@page import="com.chainsys.urbannestrealty.model.Sales"%>
<%@page import="java.util.Base64"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.chainsys.urbannestrealty.model.Property" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Authorized Properties</title>
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
    width: 140%;
}

h3 {
    text-align: center;
    position: relative;
    top: 8rem;
    color: white;
    }

.table-container {
    margin: 10px;
}

table {
    width: 200%;
    max-width: 1000px;
    border-collapse: collapse;
    background-color: white;
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    margin-top: 10rem;
    margin-bottom: 10rem;
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
     font-family: "Lora", serif;
    cursor: pointer;
    margin: 5px;
}

button:hover, .btn-action:hover, input[type="submit"]:hover {
    background-color: #333;
     font-family: "Lora", serif;
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
    position: fixed;
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

.navbar-brand img {
    position: relative;
	right: 2rem;
    height: 90px;
    width: 100px;
}
#navbarSupportedContent a{
  font-size: 16px;
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
	left: 12rem;
}
.dropdown-menu {
    background-color: gray;
    border: none;
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
          <a class="nav-link active" href="AdminWelcomePage.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="AdminProfile">Profile</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link active dropdown-toggle" href="#" id="navbarDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Clients
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="SellerCustomerDetails">Seller</a>
            <a class="dropdown-item" href="CustomerDetails">Customer</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link active dropdown-toggle" href="#" id="navbarDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Seller Properties
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="PendingProperty">Pending</a>
            <a class="dropdown-item" href="Authorized">Authorized</a>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href=ApproveToBuy>Payment Approval</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href=ClosedDeals>Closed Deals</a>
        </li>
        <li class="nav-item" id="logout">
          <a class="nav-link active"  href="LogOut">Logout</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<h3>Authorized Properties</h3>
<table border="1">
    <thead>
        <tr>
                <th>Seller ID</th>
                <th>Property Name</th>
                <th>Property ID</th>
                <th>Approval Status</th>
                <th>Property Images</th>
                <th>Property Documents Photo Copy</th>
                <th>Property Price</th>
                <th>Property Address</th>
                <th>Property District</th>
                <th>Property State</th>
                <th>Registered Date</th>
                <th>Purchased Date</th>
                <th>Customer ID</th>
                <th>Registered Status</th>
                <th>Payment Status</th>
            </tr>
    </thead>
    <tbody>
        <% 
        ArrayList<Property> list = (ArrayList<Property>) request.getAttribute("list");
        if(list!=null && !list.isEmpty())
        {
        	for (Property object : list) {
                byte[] images = object.getPropertyImages();
                String getImage = Base64.getEncoder().encodeToString(images);
                
                byte[] document = object.getPropertyDocument();
                String getdocument = Base64.getEncoder().encodeToString(document);
            %>
                 <tr>
                     <td><%= object.getSellerId() %></td>
                     <td><%= object.getPropertyName() %></td>
                     <td><%= object.getPropertyId() %></td>
                     <td><%=object.getApproval() %></td>
                     <td> 
                    	<img alt="Residential" src="data:image/jpeg;base64,<%= getImage %> ">      
                     </td>
                     <td> 
                    	<img alt="documents" src="data:image/jpeg;base64,<%= getdocument %> ">      
                     </td>
                     <td><%= object.getPropertyPrice() %></td>
                     <td><%= object.getPropertyAddress() %></td>
                     <td><%= object.getPropertyDistrict() %></td>
                     <td><%=object.getPropertyState() %></td>
                     <td><%=object.getRegisteredDate() %></td>
                     <td><%=object.getPurchasedDate() %></td>
                     <td><%=object.getCustomerId() %></td>
                     <td>
                     	<form action="RegisterStatus" method="get">
                     	<input type="hidden" name="address" value="<%=object.getPropertyAddress() %>">
                     		<select name="registerStatus">
                     		
                                 <option value="Select">Select</option>
                                 <option value="Registered">Registered</option>
                                 <option value="Not Registered">Not Registered</option>
                             </select>
                             <input type="submit" value="Submit">
                     	</form>
                     </td>
                     <td><%=object.getPaymentStatus() %></td>
                 </tr>
                 
             <% }
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

</body>
</html>
