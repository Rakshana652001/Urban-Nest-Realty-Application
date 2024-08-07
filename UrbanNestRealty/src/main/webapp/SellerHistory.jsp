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
.fromDate
{
	position: relative;
	left: 16rem;
	color: white;
}
.back
{
	position: relative;
	right: 28rem;
	top: 45px;
}
</style>
</head>
<body>
<%
LocalDate date = LocalDate.now();
%>
<h3>Transaction History</h3>
<a href="javascript:history.back()"><button class="back">Back</button></a>
<form action="SellerDate" class="fromDate">
<label>From Date: <input type="date" name="fromDate" id="fromDate" min="2014-01-01" max=<%=date %> ></label>
<label>To Date: <input type="date" name="toDate" id="toDate" value=<%=date%>></label>
<button>Submit</button>
</form>
<table border="1">
    <thead>
        <tr>
        	
            <th>Your Account Number</th>
            <th>Sender Account Number</th>
            <th>Customer ID</th>
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
	            <td><%=object.getSellerAccount() %></td>
                <td><%= object.getCustomerAccount()%></td>
                <td><%=object.getCustomerId() %></td>
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
</body>
</html>
