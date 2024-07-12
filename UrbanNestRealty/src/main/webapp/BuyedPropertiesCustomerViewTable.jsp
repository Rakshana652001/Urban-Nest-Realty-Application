<%@page import="com.chainsys.urbannestrealty.model.Property"%>
<%@page import="java.util.Base64"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.chainsys.urbannestrealty.model.Property" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Purchased Properties</title>
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
    width: 120%;
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
.back
{
	position: relative;
	right: 35rem;
	top: 35px;
}
.history
{
	position: relative;
	left: 30rem;
	bottom: 10px;
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
          <a class="nav-link active" href="http://localhost:9000/CustomerProfile">Profile</a>
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
        <li class="nav-item" id="logout">
          <a class="nav-link active" href="LogOut">Logout</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<a href="CustomerHistory"><button class="history">Transaction History</button></a>
<table border="1">
    <thead>
        <tr>
            <th>Seller ID</th>
            <th>Customer ID</th>
            <th>Property Name</th>
            <th>Property Document</th>
            <th>Property Price</th>
            <th>Property Address</th>
            <th>Property District</th>
            <th>Registered Date</th>
            <th>Purchased Date</th>
            <th>Register Status</th>
            <th>Payment Status</th>
            <th>Download Receipt</th>
        </tr>
    </thead>
    <tbody>
        <% 
        ArrayList<Property> list = (ArrayList<Property>) request.getAttribute("list");
        if(list!=null && !list.isEmpty())
        {
        	 for (Property object : list) {
                 
                 byte[] documents = object.getPropertyDocument();
                 String getDocuments = Base64.getEncoder().encodeToString(documents);
             %>
                 <tr>
                     <td><%= object.getSellerId() %></td>
                     <td><%=object.getCustomerId() %></td>
                     <td><%= object.getPropertyName() %></td>
                     <td>
                         <img class="document-image" alt="documents" src="data:image/jpeg;base64,<%= getDocuments %> ">      
                     </td>
                     <td><%= object.getPropertyPrice() %></td>
                     <td><%= object.getPropertyAddress() %></td> 
                     <td><%= object.getPropertyDistrict() %></td>
                     <td><%=object.getRegisteredDate() %></td>
                     <td><%=object.getPurchasedDate() %></td>
                     <td><%=object.getRegisterStatus() %></td>
                     <td><%= object.getPaymentStatus() %></td>
                     <td>
                         <button onclick="generateReceipt('<%= object.getSellerId()%>', '<%= object.getCustomerId()%>', '<%= object.getPropertyName()%>', '<%= object.getPropertyPrice() %>' ,'<%= object.getPropertyAddress()%>', '<%= object.getPropertyDistrict() %>', '<%=object.getRegisteredDate() %>', '<%=object.getPurchasedDate() %>','<%=object.getRegisterStatus() %>','<%= object.getPaymentStatus() %>','<%= getDocuments %>')">Download</button>
                     </td>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.3.1/jspdf.umd.min.js"></script>
<script type="text/javascript">
    function generateReceipt(sellerId,customerId,  propertyName, propertyPrice, propertyAddress, propertyDistrict,registeredDate,purchasedDate, registerStatus, payment, document) 
    {
		const { jsPDF } = window.jspdf;
        const doc = new jsPDF();
        
        doc.setFontSize(12);
        doc.line(9, 10, 200, 10); //topline
        doc.line(9, 285, 200, 285); //bottomline (200 length, 9 left length, (285, 285) bringing down the line with same line---)
        
        doc.line(200, 10, 200, 285); //rightline 
        doc.line(9, 10, 9, 285);//leftline
        
        doc.text("Payment Receipt", 20, 20);
        doc.line(20, 23, 54, 23);
        doc.setLineWidth(3); 
       
        doc.text("Seller ID: " + sellerId, 20, 30);
        doc.text("Customer ID: "+ customerId, 20,40);
        doc.text("Property Name: " + propertyName, 20, 50);
        doc.text("Property Price: " + propertyPrice, 20, 60);
        doc.text("Property Address: "+propertyAddress, 20, 70);
        doc.text("Property District: " + propertyDistrict, 20, 80);
        doc.text("Registered Date: "+registeredDate, 20,90);
        doc.text("Purchased Date: " + purchasedDate, 20, 100);
        doc.text("Register Status: " + registerStatus, 20, 110);
        doc.text("Payment Status: " + payment, 20, 120);
        doc.addImage(document,'JPEG', 20, 130, 60, 90)
        doc.save("receipt_" + sellerId + ".pdf");
    }
</script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>