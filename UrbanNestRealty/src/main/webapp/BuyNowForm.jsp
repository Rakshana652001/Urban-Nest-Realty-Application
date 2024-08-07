<!DOCTYPE html>
<html lang="xml:lang">
<head>
<meta charset="ISO-8859-1">
<title>Buy Now</title>
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
    }
    #BuyNowForm {
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
        width: 90%;
        max-width: 600px;
        box-sizing: border-box;
    }
    label {
        display: block;
        margin-bottom: 10px;
    }
    input[type="text"],
    input[type="tel"],
    input[type="email"],
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
    .dropdown {
        position: relative;
        display: inline-block;
        margin-bottom: 15px;
        width: 100%;
    }
    .dropbtn {
        background-color: #f9f9f9;
        color: black;
        padding: 8px;
        font-size: 16px;
        border: none;
        cursor: pointer;
        width: 100%;
        text-align: left;
        box-sizing: border-box;
    }
    .dropdown-content {
        display: none;
        position: absolute;
        background-color: white;
        min-width: 100%;
        box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
        z-index: 1;
        box-sizing: border-box;
    }
    .dropdown-content button {
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
        width: 100%;
        border: none;
        background-color: white;
        text-align: left;
        box-sizing: border-box;
    }
    .dropdown-content button:hover {
        background-color: #ddd;
    }
    .dropdown:hover .dropdown-content {
        display: block;
    }
    .button-group {
        display: flex;
        justify-content: space-between;
    }
    button {
        background-color: black;
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
    String customerId = (String) session.getAttribute("customerId");
	String sellerId = (String)session.getAttribute("id");
%>
<div class="container">
    
    <form action="Purchase" id="BuyNowForm" method="post" enctype="multipart/form-data">
    <h3>Buy Now Form</h3>
        <label for="customerId">Customer ID:
            <input type="text" name="customerId" placeholder="Login to your Account then come to Purchase"  value="<%= customerId != null ? customerId : "" %>" readonly></label>
        <label for="governmentId">Government ID:
            <input type="file" id="governmentId" name="governmentId" required>
        </label><br><br>
        <label for="sellerId">Seller ID:
        	<input type="text" id="sellerId" name="sellerId" value="<%= request.getParameter("sellerId")%>" readonly>
        </label>
        <label for="propertyId">Property ID:
            <input type="text" id="propertyId" name="propertyId" value="<%= request.getParameter("propertyId") %>" readonly>
        </label><br><br>
        <label for="propertyName">Property Name:
            <input type="text" id="propertyName" name="propertyName" value="<%= request.getParameter("propertyName") %>" readonly>
        </label><br><br>
        <label for="propertyAddress">Property Address:
            <input type="text" id="propertyAddress" name="propertyAddress" value="<%= request.getParameter("propertyAddress") %>" readonly>
        </label><br><br>
        <label for="propertyPrice">Property Price:
            <input type="text" id="propertyPrice" name="propertyPrice" value="<%= request.getParameter("propertyPrice") %>" readonly>
        </label><br><br>
        <label for="payableAmount">Payable Amount:
            <input type="text" id="payableAmount" name="payableAmount" readonly>
        </label><br><br>
        <label for="paymentMethod">Payment Method:
            <select id="paymentMethod" name="paymentMethod" required>
                <option value="bankTransfer">Bank Transfer</option>
            </select>
        </label><br><br>
        <p><strong>Terms and Conditions</strong></p>
		<p>Our Terms and Conditions were last updated on [_01-01-2024_].</p>
		<p>Please read these terms and conditions carefully before using Our Service.</p>
		<p><strong>Acknowledgment</strong></p>
		<p>These are the Terms and Conditions governing the use of this Service and the agreement that operates between You and the Company. These Terms and Conditions set out the rights and obligations of all users regarding the use of the Service.</p>
		<p>Your access to and use of the Service is conditioned on Your acceptance of and compliance with these Terms and Conditions. These Terms and Conditions apply to all visitors, users and others who access or use the Service.</p>
		<p>By accessing or using the Service You agree to be bound by these Terms and Conditions. If You disagree with any part of these Terms and Conditions then You may not access the Service.</p>
		<p>You represent that you are over the age of 18. The Company does not permit those under 18 to use the Service.</p>
		<p>Your access to and use of the Service is also conditioned on Your acceptance of and compliance with the Privacy Policy of the Company. Our Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your personal information when You use the Application or the Website and tells You about Your privacy rights and how the law protects You. Please read Our Privacy Policy carefully before using Our Service.</p>
		<p><strong>User Accounts</strong></p>
		<p>When You create an account with Us, You must provide Us information that is accurate, complete, and current at all times. Failure to do so constitutes a breach of the Terms, which may result in immediate termination of Your account on Our Service.</p>
		<p>You are responsible for safeguarding the password that You use to access the Service and for any activities or actions under Your password, whether Your password is with Our Service or a Third-Party Social Media Service.</p>
		<p>You agree not to disclose Your password to any third party. You must notify Us immediately upon becoming aware of any breach of security or unauthorized use of Your account.</p>
		<p>You may not use as a username the name of another person or entity or that is not lawfully available for use, a name or trademark that is subject to any rights of another person or entity other than You without appropriate authorization, or a name that is otherwise offensive, vulgar or obscene.</p>
		<p>The Company is not responsible for the content of the Service's users. You expressly understand and agree that You are solely responsible for the Content and for all activity that occurs under your account, whether done so by You or any third person using Your account.</p>
		<p>You may not transmit any Content that is unlawful, offensive, upsetting, intended to disgust, threatening, libelous, defamatory, obscene or otherwise objectionable. Examples of such objectionable Content include, but are not limited to, the following:</p>
	
		<p><strong>Copyright Policy</strong></p>
		<p><strong>Termination</strong></p>
		<p>We may terminate or suspend Your Account immediately, without prior notice or liability, for any reason whatsoever, including without limitation if You breach these Terms and Conditions.</p>
		<p>Upon termination, Your right to use the Service will cease immediately. If You wish to terminate Your Account, You may simply discontinue using the Service.</p>
	    <label for="terms"> <input type="checkbox" id="terms" name="terms" required> I agree to the above terms and conditions given by the company</label><br><br>
        <button type="submit">Submit</button>
    </form>
    <form action="http://localhost:9000/#home">
        <button>Back to home</button>
    </form>
</div>
<script>
    document.addEventListener
    ("DOMContentLoaded", function(){
        var propertyPrice = document.getElementById("propertyPrice").value;
        var payableAmountInput = document.getElementById("payableAmount");

        if (propertyPrice) 
        {
            var payableAmount = propertyPrice / 2;
            payableAmountInput.value = payableAmount.toFixed(2);
        }
    });
</script>
</body>
</html>
