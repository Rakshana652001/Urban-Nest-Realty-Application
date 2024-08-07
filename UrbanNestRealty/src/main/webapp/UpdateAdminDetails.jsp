<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="xml:lang">
<head>
<meta charset="ISO-8859-1">
<title>Update Admin Details</title>
<link rel="icon" type="image/x-icon" href="Images/Nest Realty.jpg">
<style>
   body{
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
     margin-top: 8rem;
    }
    #UpdateForm {
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
        width: 90%;
        max-width: 400px;
        box-sizing: border-box;
    }
    label {
        display: block;
        margin-bottom: 10px;
    }
    input[type="tel"],
    input[type="password"],
    textarea {
        width: 100%;
        padding: 8px;
        margin-top: 5px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }
    button {
        background-color: #818589;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        width: 48%;
        margin-top: 10px;
    }
    button:hover {
        background-color: #333;
    }
</style>
</head>

<body>
<%
String name = request.getParameter("name");
%>
<form action="UpdateAdminDetails" id="UpdateForm" method="post">
	<label>Name: <input type="text" id="name" name="name" value="<%=name %>" readonly></label><br>
	<label for="phoneNumber">Phone Number: <input type="tel" id="phoneNumber" name="phoneNumber" maxlength="10" placeholder="7339263883" pattern="[789][0-9]{9}" required/></label>
    <label for="password">Password: <input type="password" id="password" name="password" placeholder="Rakshana@12" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required/></label>
    <label for="address">Address: <textarea id="address" name="address" rows="4" cols="50" required></textarea></label>
    <button>Update</button>
</form>
</body>
</html>