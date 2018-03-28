<%@page import="DatabaseHandler.DatabaseHandler"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Contact V2</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
<body>

	<div class="bg-contact2" style="background-image: url('images/bg.jpg');">
		<div class="container-contact2">
			<div class="wrap-contact2">
                           

					
<font style="size: 30px;align-content: center">Your Rate Plan is :  </font>
        <font style="size: 30px; color:orange">
        <%
            String ratePlane = request.getParameter("rateplan");
            out.print(ratePlane);
            DatabaseHandler db = new DatabaseHandler();
            String ratePlanName = request.getParameter("rateplan");
            db.addRatePlan(ratePlanName);
        %>
        </font>
        <%
            String number = request.getParameter("numberofservicepakage");
            int numberOfServicePakage = Integer.parseInt(number);
            int i = 0;
            while (i < numberOfServicePakage) {
                i++;
                //out.println("numbeeeeeeeer is "+numberOfServicePakage);

                out.println("<h3 align='center'>Add Your Service Package number " + i + ":  </h3>");
                out.println("<form action='/WebApplication1/AddInfo'>");
//                out.println(" Service Package Name:<br/><br/>");
                out.println("<div class='wrap-input2 validate-input' >");
                out.println("<input type='text' class='input2' name='ServicePackageName" + i + "' required>");
                out.println("<span class='focus-input2' data-placeholder='Name Of Service Package "+i+"'></span></div>'");
                                                
                
                out.println("<br>");
//                out.println("Costs Of Whole Pakage:<br><br/>");
                out.println("<div class='wrap-input2 validate-input' >");
                out.println("<input type='text' class='input2' name='costs" + i + "' required> L.E");
                out.println("<span class='focus-input2' data-placeholder='Cost Of Service Package "+i+"'></span></div>'");

                
                out.println("<br>");
//                out.println("number OF Minutes:<br><br>");
                out.println("<div class='wrap-input2 validate-input' >");
                out.println("<input type='number'  class='input2' name='numberOFMinutes" + i + "' required>Minutes");
                out.println("<span class='focus-input2' data-placeholder='Number of Minutes of Service Package "+i+"'></span></div>'");
                
                out.println("<br>");
//                out.println("Cost OF Minutes:<br><br>");
                out.println("<div class='wrap-input2 validate-input' >");
                out.println("<input type='number' class='input2' name='costOFMinutes" + i + "' required>L.E");
                out.println("<span class='focus-input2' data-placeholder='Cost of Minutes of Service Package "+i+"'></span></div>'");

                out.println("<br>");
//                out.println("number OF SMS:<br><br>");
                out.println("<div class='wrap-input2 validate-input' >");
                out.println("<input type='number' class='input2' name='numberOFSMS" + i + "' required>Number of SMS");
                out.println("<span class='focus-input2' data-placeholder='Number of SMS of Service Package "+i+"'></span></div>'");
                
                out.println("<br>");
//                out.println("Cost OF SMS:<br>");
                out.println("<div class='wrap-input2 validate-input' >");
                out.println("<input type='number' class='input2' name='costOFSMS" + i + "' required>L.E");
                out.println("<span class='focus-input2' data-placeholder='Cost of SMS of Service Package "+i+"'></span></div>'");

                
                out.println("<br>");
//                out.println("number OF DATA:<br>");
                out.println("<div class='wrap-input2 class='input2' validate-input' >");
                out.println("<input type='number' class='input2' name='numberOFDATA" + i + "' required>MegaBytes");
                out.println("<span class='focus-input2' data-placeholder='Number of Data of Service Package "+i+"'></span></div>'");
                
                out.println("<br>");
//                out.println("Cost OF Data:<br>");
                out.println("<div class='wrap-input2 validate-input' >");
                out.println("<input type='number' class='input2' name='costOFDATA" + i + "' required>L.E");
                out.println("<span class='focus-input2' data-placeholder='Cost of Data of Service Package "+i+"'></span></div>'");

                
                out.println("<br>");
               
            }
            out.println("<input type='hidden' name='rateplan' value='" + ratePlane + "' required>");
            out.println("<input type='hidden' name='numberofservicepakage' value='" + number + "' required>");
        %>
					

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




<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());

	  gtag('config', 'UA-23581568-13');
	</script>

</body>
</html>
