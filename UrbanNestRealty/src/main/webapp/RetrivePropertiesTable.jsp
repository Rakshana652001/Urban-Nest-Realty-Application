<%@page import="java.time.LocalDate"%>
<%@page import="com.chainsys.urbannestrealty.model.Sales"%>
<%@page import="java.util.Base64"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.chainsys.urbannestrealty.model.Property" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Closed Deals</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<style>
body {
    font-family: "Lora", serif;
    background-color: #818589;
    margin: 0;
    padding: 20px;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    color: #333;
    width: 105%;
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

button, .btn-action,label {
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
#search
{
  	position: relative;
	right: 29rem;
	top: 2.5rem;
}
.fromDate
{
	position: relative;
	left: 20rem;
}
.actions {
    display: flex;
    gap: 10px;
    justify-content: center;
}
</style>
</head>
<%
	LocalDate date = LocalDate.now();
%>
<body>
<h3>Closed Deals</h3>
<a href="AdminWelcomePage.jsp"><button>Back to home</button></a>
<form class="form-inline my-2 my-lg-0" action="PropertySearch" id="search">
   <input class="form-control mr-sm-2" type="search" name="propertyName" placeholder="Search..(Plot, showroom, PG, complex floor)" aria-label="Search">
   
</form>
<form action="Date" class="fromDate">
<label>From Date: <input type="date" name="fromDate" id="fromDate" min="2013-01-01" max=<%=date %> ></label>
<label>To Date: <input type="date" name="toDate" id="toDate" value=<%=date%>></label>
<button>Submit</button>
</form>
<table border="1">
    <thead>
        <tr>
                <th>Seller ID</th>
                <th>Property Name</th>
                <th>Property Images</th>
                <th>Property Price</th>
                <th>Property Address</th>
                <th>Property District</th>
                <th>Property State</th>
                <th>Registered Date</th>
                <th>Purchased Date</th>
                <th>Customer ID</th>
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
                
               %>
                 <tr>
                     <td><%= object.getSellerId() %></td>
                     <td><%= object.getPropertyName() %></td>
                     <td> 
                    	<img alt="Residential" src="data:image/jpeg;base64,<%= getImage %> ">      
                     </td>
                    
                     <td><%= object.getPropertyPrice() %></td>
                     <td><%= object.getPropertyAddress() %></td>
                     <td><%= object.getPropertyDistrict() %></td>
                     <td><%=object.getPropertyState() %></td>
                     <td><%=object.getRegisteredDate() %></td>
                     <td><%=object.getPurchasedDate() %></td>
                     <td><%=object.getCustomerId() %></td>
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
</body>
</html>
