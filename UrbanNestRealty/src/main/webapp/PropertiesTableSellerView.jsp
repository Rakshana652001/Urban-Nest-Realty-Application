<%@page import="java.util.Base64"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.chainsys.urbannestrealty.model.Property" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="xml:lang"> 
<head>
<meta charset="ISO-8859-1">
<title>Registered Properties</title>
<link rel="icon" type="image/x-icon" href="Images/Nest Realty.jpg">
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
    width: 130%;
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
<h3>Registered Properties</h3>
<a href="http://localhost:9000/SellerWelcomePage.jsp?"><button>Back to home</button></a>

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
        	for (Property object : list)
            {
                byte[] images = object.getPropertyImages();
                String getImage;
                getImage = Base64.getEncoder().encodeToString(images);
                
                byte[] document = object.getPropertyDocument();
                String getDocument = Base64.getEncoder().encodeToString(document);
            
        %>
            <tr>
                <td><%= object.getSellerId() %></td>
                <td><%= object.getPropertyName() %></td>
                <td><%= object.getPropertyId() %></td>
                <td><%=object.getApproval() %>
                <td> 
               	<img alt="ShowRoom" src="data:image/jpeg;base64,<%= getImage %> ">
                </td>
                <td>
                	<img alt="document" src="data:image/jpeg;base64, <%=getDocument %>">
                </td>
               <td><%= object.getPropertyPrice() %></td>
                   <td><%= object.getPropertyAddress() %></td>
                   <td><%= object.getPropertyDistrict() %></td>
                   <td><%=object.getPropertyState() %></td>
                   <td><%=object.getRegisteredDate() %></td>
                   <td><%=object.getPurchasedDate() %></td>
                   <td><%=object.getCustomerId() %></td>
                   <td><%=object.getRegisterStatus() %></td>
                   <td><%=object.getPaymentStatus() %></td> 
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
</body>
</html>
