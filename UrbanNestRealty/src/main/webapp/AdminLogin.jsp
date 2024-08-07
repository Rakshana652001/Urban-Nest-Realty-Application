<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="icon" type="image/x-icon" href="Images/Nest Realty.jpg">
<style type="text/css">
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
    width: 100%;
    padding: 20px;
    background: #fff;
    border: 12px solid white;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    box-sizing: border-box;
}

h3 {
    text-align: center;
    margin-bottom: 20px;
    color: black;
}

form {
    display: flex;
    flex-direction: column;
}

label {
    margin-bottom: 10px;
    color: black;
}

input[type="text"], input[type="password"] {
    width: 100%;
    padding: 10px;
    margin-top: 5px;
    border: 1px solid #ddd;
    border-radius: 4px;
    background-color: #f4f4f4;
    box-sizing: border-box;
}

button {
    padding: 10px 20px;
    margin-top: 20px;
    border: none;
    border-radius: 4px;
    background-color: #818589;
    color: white;
    font-size: 16px;
    cursor: pointer;
}


</style>
</head>
<body>
<div class="container">
    <form action="Login" method="post">
        <h3>Login</h3>
        <label for="generatedUserID">ID:</label>
        <input type="text" id="generatedUserID" name="generatedUserID" placeholder="Enter the Id" required/>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" placeholder="Rakshana@12" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required/>
        
        <p>Don't have an account?  <a href="UserRegistration.jsp">Register</a></p>
        <button type="submit">Login</button>
    </form>
</div>
</body>
</html>
