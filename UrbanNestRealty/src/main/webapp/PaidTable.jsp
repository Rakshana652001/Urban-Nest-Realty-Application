<%@page import="com.chainsys.urbannestrealty.model.Sales"%>
<%@page import="java.util.Base64"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.chainsys.urbannestrealty.model.Sales" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Completed Deals</title>
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
.back
{
	position: relative;
	right: 26rem;
	top: 35px;
}
.history
{
	position: relative;
	left: 25rem;
	bottom: 10px;
}
</style>
</head>
<body>
<%
	String id = (String)session.getAttribute("sellerId");
%>
<h3>Completed Deals</h3>
<a href="SellerWelcomePage.jsp"><button class="back">Back to home</button></a>
<a href="SellerHistory"><button class="history">Transaction History</button></a>

<table border="1">
    <thead>
        <tr>
            <th>Customer ID</th>
            <th>Government Id</th>
            <th>Property Address</th>
            <th>Payment Method</th>
            <th>Property Total Amount</th>
            <th>Payable Amount</th>
            <th>Paid Status</th>
            <th>Download Receipt</th>

        </tr>
    </thead>
    <tbody>
        <% 
        ArrayList<Sales> list = (ArrayList<Sales>) request.getAttribute("list");
        if(list!=null && !list.isEmpty())
        {
        	for (Sales object : list) {
                byte[] images = object.getGovernmentId();
                String getImage = Base64.getEncoder().encodeToString(images);
            %>
            <tr>
                <td><%= object.getCustomerId() %></td>
                <td> 
                    <img alt="Government ID" src="data:image/jpeg;base64,<%= getImage %>">      
                </td>
                <td><%= object.getPropertyAddress() %></td>
                <td><%= object.getPaymentMethod() %></td>
                <td><%=object.getTotalAmount() %></td>
                <td><%=object.getPayableAmount() %></td>
                <td><%=object.getPaidStatus() %></td>
                <td>
                    <button onclick="generateReceipt('<%= object.getCustomerId() %>', '<%= object.getPropertyAddress() %>','<%= object.getPaymentMethod() %>','<%=object.getTotalAmount() %>','<%=object.getPayableAmount() %>','<%=object.getCustomerAccount() %>','<%=object.getSellerAccount() %>','<%=object.getPurchasedDate() %>','<%=object.getPaidStatus() %>','<%= getImage %>')">
                    Download
                    </button>
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
    function generateReceipt(customerId, propertyAddress, paymentMethod,totalAmount , payableAmount, customerAccount, yourAccount, purchasedDate,paymentStatus, govId)
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
        doc.text("Customer ID: " + customerId, 20, 30);
        
        doc.text("Property Address: " + propertyAddress, 20, 40);
        doc.text("Payment Method: " + paymentMethod, 20, 50);
        doc.text("Property Total Amount: " + totalAmount, 20, 60);
        doc.text("Payable Amount: "+ payableAmount, 20, 70);
        
        doc.text("Customer Account: "+ customerAccount, 20, 80);
        doc.text("Your Account: "+ yourAccount, 20, 90);
        doc.text("Purchased Date: "+ purchasedDate, 20, 100) 
        doc.text("Payment Status: " + paymentStatus, 20, 110);
        
        doc.addImage(govId, 'JPEG', 20, 120, 70, 50);
		
        doc.save("receipt_" + customerId + ".pdf");
    }
</script>
</body>
</html>
