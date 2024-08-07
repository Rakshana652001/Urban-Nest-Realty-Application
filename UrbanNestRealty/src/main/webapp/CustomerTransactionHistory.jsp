<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Base64"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.chainsys.urbannestrealty.model.Sales" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="xml:lang">
<head>
<meta charset="ISO-8859-1">
<title>Transaction History</title>
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
    position: relative;
    top: 8rem;
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
    border-radius: 12px;
    background-color: #818589;
    color: white;
    cursor: pointer;
    flex: 1;
    margin: 5px;
     font-family: "Lora", serif;
}

button:hover, .btn-action:hover, input[type="submit"]:hover {
    background-color: #333;
}

.actions {
    display: flex;
    gap: 10px;
    justify-content: center;
}
.fromDate
{
	position: relative;
	left: 16rem;
	color: white;
	position: relative;
    top: 8rem;
}
.back
{
	position: relative;
	right: 28rem;
	top: 45px;
}
.navbar {
    background-color: #818589;
    width: 100%;
    margin: 0;
    padding: 0;
    position: fixed;
    top:0;
  	left: 0;
  	margin-bottom: 25px;
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
<%
LocalDate date = LocalDate.now();
%>
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
<form action="customerDate" class="fromDate">
<label>From Date: <input type="date" name="fromDate" id="fromDate" min="2013-01-01" max=<%=date %> ></label>
<label>To Date: <input type="date" name="toDate" id="toDate" value=<%=date%>></label>
<button>Submit</button>
</form>
<table border="1">
    <thead>
        <tr>
            <th>Your Account Number</th>
            <th>Sender Account Number</th>
            <th>Seller ID</th>
            <th>Transaction Date</th>
            <th>Amount</th>
        </tr>
    </thead>
    <tbody>
        <% 
        ArrayList<Sales> list = (ArrayList<Sales>) request.getAttribute("list");
        if(list!=null && !list.isEmpty())
        {
        	for (Sales object : list)
            {
                %>
            <tr>
                <td><%= object.getCustomerAccount()%></td>
                <td><%=object.getSellerAccount() %></td>
                <td><%=object.getSellerId() %></td>
                <td><%=object.getPurchasedDate() %></td>
                <td><%=object.getPayableAmount() %></td>
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
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>
