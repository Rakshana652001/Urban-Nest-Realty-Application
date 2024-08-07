<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="xml:lang">
<head>
<meta charset="ISO-8859-1">
<title>Pay Now</title>
<link rel="icon" type="image/x-icon" href="Images/Nest Realty.jpg">
<style>
body {
    font-family: "Lora", serif;
    background-color: #818589;
    background-size: cover;
    background-position: center;
    position: relative;
    color: #333;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}
.container {
    max-width: 400px;
    margin: 0 auto;
    padding: 20px;
    background-color: #f9f9f9;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
h3 {
    text-align: center;
    margin-bottom: 20px;
}
label {
    display: block;
    margin: 10px 0;
    font-weight: bold;
}
input[type="number"],
input[type="submit"] {
    width: 100%;
    padding: 10px;
    margin: 5px 0;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
}
input[type="submit"] {
    background-color: #818589;
    color: white;
    cursor: pointer;
    margin-top: 20px;
}
input[type="submit"]:hover {
    background-color: grey;
     font-family: "Lora", serif;
}
</style>
</head>
<body>
<%
	LocalDate purchasedDate = LocalDate.now();
%>
<div class="container">
    <h3>Payment Form</h3>
    <form action="PayNow" id="paymentForm" method="post" onsubmit="return validateForm()">
        <label for="yourAccountNumber">Your Account Number: </label>
        <input type="number" id="yourAccountNumber" maxlength="12" name="yourAccountNumber" placeholder="Enter your Bank Account Number" required/>
        
        <label for="senderAccountNumber">Account Number of the Receiver:</label>
        <input type="number" id="senderAccountNumber" maxlength="12" name="senderAccountNumber" placeholder="Enter the Bank Account Number" required/>
        
        <label for="amount">Enter the Amount to send:</label>
        <input type="number" id="amount" name="amount" value="<%= request.getParameter("amount") %>" readonly/>
        
        <label for="purchasedDate">Purchased Date</label>
        <input type="date" id="purchasedDate" name="purchasedDate" value="<%=purchasedDate %>" >
        
        <input type="submit" value="Send Money">
    </form>
</div>
<script>
function validateForm() 
{
    var yourAccountNumber = document.getElementById("yourAccountNumber").value;
    var senderAccountNumber = document.getElementById("senderAccountNumber").value;
    var amount = document.getElementById("amount").value;

    if (yourAccountNumber === senderAccountNumber) 
    {
        alert("The account numbers must be different.");
        return false;
    }

    if (amount <= 0) {
        alert("The amount must be greater than zero.");
        return false;
    }

    return true;
}
</script>
</body>
</html>
