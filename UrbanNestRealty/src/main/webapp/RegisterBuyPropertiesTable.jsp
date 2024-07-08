<%@page import="java.util.Base64"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.chainsys.urbannestrealty.model.Sales" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="xml:lang">
<head>
<meta charset="ISO-8859-1">
<title>Ready-to-Purchase</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #818589;
    margin: 0;
    padding: 20px;
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
</style>
</head>
<body>
<h3>Ready-to-Purchase</h3>
<a href="CustomerWelcomePage.jsp"><button>Back to home</button></a>

<table border="1">
    <thead>
        <tr>
            <th>Customer ID</th>
            <th>Seller ID</th>
            <th>Property address</th>
            <th>Property Total Amount</th>
            <th>Payable Amount</th>
            <th>Payment Method</th>
            <th>Approval Status</th>
            <th>Payment</th>
        </tr>
    </thead>
    <tbody>
        <% 
        ArrayList<Sales> list = (ArrayList<Sales>) request.getAttribute("list");
       	for (Sales object : list)
             {
         %>
             <tr>
                 <td><%= object.getCustomerId() %></td>
                 <td><%=object.getSellerId() %></td>
                 <td><%=object.getPropertyAddress() %></td>
                 <td><%= object.getTotalAmount() %></td>
                 <td><%=object.getPayableAmount() %></td>
                 <td><%= object.getPaymentMethod() %></td>
                 <td><%= object.getApproval() %></td>
                 <td>
                 <form action="PayNow.jsp" >
                 <input type="hidden" name="amount" value="<%=object.getPayableAmount() %>">
                 	<button>Pay Now</button>
                 </form>
                 </td>
             </tr>
         <%
             }
            
   
            %>
     
    </tbody>
</table>
</body>
</html>
