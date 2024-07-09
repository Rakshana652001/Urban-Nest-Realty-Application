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
    width: 100%;
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
</style>
</head>
<body>
<h3>Purchased Properties</h3>
<a href="CustomerWelcomePage.jsp"><button>Back to home</button></a>
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
                         <button onclick="generateReceipt('<%= object.getSellerId()%>', '<%= object.getCustomerId()%>', '<%= object.getPropertyName()%>', '<%= object.getPropertyPrice() %>' ,'<%= object.getPropertyAddress()%>', '<%= object.getPropertyDistrict() %>', '<%=object.getRegisteredDate() %>', '<%=object.getPurchasedDate() %>','<%=object.getRegisterStatus() %>','<%= object.getPaymentStatus() %>')">Download</button>
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
    function generateReceipt(sellerId,customerId,  propertyName, propertyPrice, propertyAddress, propertyDistrict,registeredDate,purchasedDate, registerStatus, payment) 
    {
		const { jsPDF } = window.jspdf;
        const doc = new jsPDF();
        
        doc.text("Payment Receipt", 10, 10);
        doc.text("Seller ID: " + sellerId, 10, 20);
        doc.text("Customer ID: "+ customerId, 10,30);
        doc.text("Property Name: " + propertyName, 10, 40);
        doc.text("Property Price: " + propertyPrice, 10, 50);
        doc.text("Property Address: "+propertyAddress, 10, 60);
        doc.text("Property District: " + propertyDistrict, 10, 70);
        doc.text("Registered Date: "+registeredDate, 10,80);
        doc.text("Purchased Date: " + purchasedDate, 10, 90);
        doc.text("Register Status: " + registerStatus, 10, 100);
        doc.text("Payment Status: " + payment, 10, 110);
        doc.save("receipt_" + sellerId + ".pdf");
    }
</script>
</body>
</html>