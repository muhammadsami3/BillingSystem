<%-- 
    Document   : addNewService
    Created on : Mar 25, 2018, 2:30:07 PM
    Author     : AZIZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>ADD  NEW SERVICE</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="/BillingSystem/Styling/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/BillingSystem/Styling/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/BillingSystem/Styling/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/BillingSystem/Styling/vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/BillingSystem/Styling/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/BillingSystem/Styling/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/BillingSystem/Styling/css/util.css">
	<link rel="stylesheet" type="text/css" href="/BillingSystem/Styling/css/main.css">
         <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="/BillingSystem/Styling/css/rateplanecss.css">
<!--===============================================================================================-->
<%@include file="../Styling/header_footer/header.html" %>
</head>
<body>

	<div class="bg-contact2" style="background-image: url('/BillingSystem/Styling/images/bg.jpg');">
		<div class="container-contact2">
			<div class="wrap-contact2">
                            <form class="contact2-form validate-form" action="/BillingSystem/AddNewServiceInfo">
					<span class="contact2-form-title">
						ADD NEW SERVICE
					</span>

					<div class="wrap-input2 validate-input" data-validate="Name is required">
                                            <input class="input2" type="text" name="serviceName" required>
						<span class="focus-input2" data-placeholder="Enter Name of The Service"></span>
					</div>
					
                                <div class="wrap-input2 validate-input" data-validate="Type is required">
                                             <input type="radio" name="serviceType" value="recurring" checked>Recurring<br>
                                             <input type="radio" name="serviceType" value="onetime">One Time Fee<br>
						
					</div>

					<div class="wrap-input2 validate-input" >
                                            <input class="input2" type="number" name="cost" required>
						<span class="focus-input2" data-placeholder="Cost of this service"></span>
					</div>
					
                                <div class="wrap-input2 validate-input" >
                                            <input class="input2" type="text" name="description" required>
						<span class="focus-input2" data-placeholder="Description of this service"></span>
					</div>
                                
                                

					

					<div class="container-contact2-form-btn">
						<div class="wrap-contact2-form-btn">
							<div class="contact2-form-bgbtn"></div>
							<button class="contact2-form-btn">
								SUBMIT
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>



    <%@include file="../Styling/header_footer/footer.html" %>
        
                           
<!--        <form action="/BillingSystem/AddNewServiceInfo">
            Enter Name of The Service:<br>
            <input type="text" name="serviceName" required><br>
            Choose type The Service:<br>
            <input type="radio" name="serviceType" value="recurring" checked>Recurring<br>
            <input type="radio" name="serviceType" value="onetime">One Time Fee<br>
            Cost of this service:<br>
            <input type="number" name="cost" required><br>
            Description of this service:<br>
            <input type="text" name="description" required><br>
            <input type="submit" value="Submit">
        </form>-->
    </body>
</html>
