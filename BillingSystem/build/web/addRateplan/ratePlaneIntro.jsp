<%@include file="../Styling/header_footer/header.html" %>
</head>
<body>

	<div class="bg-contact2" style="background-image: url('/BillingSystem/Styling/images/bg.jpg');">
		<div class="container-contact2">
			<div class="wrap-contact2">
                            <form class="contact2-form validate-form" action="ServicePackage.jsp">
					<span class="contact2-form-title">
						Rate Plane Information
					</span>

					<div class="wrap-input2 validate-input" data-validate="Name is required">
                                            <input class="input2" type="text" name="rateplan" required>
						<span class="focus-input2" data-placeholder="Rate Plane Name"></span>
					</div>

					<div class="wrap-input2 validate-input" >
                                            <input class="input2" type="number" name="numberofservicepakage" required>
						<span class="focus-input2" data-placeholder="Number Of Services Package"></span>
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

