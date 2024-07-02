<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import=" com.chainsys.urbannestrealty.model.User" %>
    <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="xml:lang">
<head>
<meta charset="ISO-8859-1">
<title>Clients</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: grey;
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


button, .btn-action, input {
    padding: 10px;
    border: none;
    border-radius: 12px;
    background-color: #000100;
    color: white;
    cursor: pointer;
    flex: 1;
    margin: 5px;
}
label{
	color: white;
}
button:hover, .btn-action:hover {
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
<h3>Clients</h3>
<form action="AdminWelcomePage.jsp">
<button>Back to Home</button>
</form>
<form action="Search" method="get">
	<label>Search: <input type="text" name="id"  placeholder="Search By Name" ></label>
</form>
<table border="1">
	<thead>
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Phone Number</th>
			<th>Email Id</th>
			<th>Address</th>
			<th>District</th>
			<th>State</th>
			<th>Delete</th>
		</tr>
	</thead>
	
	<%ArrayList<User> list = (ArrayList<User>)request.getAttribute("list");
	for(User object:list)
	{
	%>
		<tr>
			<td><%=object.getGeneratedUserID() %></td>
			<td><%=object.getName() %></td>
			<td><%=object.getPhoneNumber() %></td>
			<td><%=object.getEmailID() %></td>
			<td><%=object.getAddress() %></td>
			<td><%=object.getDistrict() %></td>
			<td><%=object.getState() %></td>
			<td>
		<form action="deletecustomer" method="post">
  		<input type="hidden" name="deleteName" value="<%= object.getName()%>">
  		<input type="submit" name="delete" value="Delete">
  		</form>
  		</td>  		
		</tr>
	<%
	}
	  %>
</table>
</body>
</html>