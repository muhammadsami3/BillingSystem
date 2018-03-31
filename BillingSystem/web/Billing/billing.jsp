<%-- 
    Document   : billing
    Created on : Mar 28, 2018, 3:25:33 PM
    Author     : Raghda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../Styling/header_footer/header.html" %>

<!--<form action="bill" id="usrform">
    Enter cutomer number:<br>
    <input type="text" name="msisdn" value="MSISDN">
    <input type="submit" value="bill">
</form> -->

<div class="bg-contact2" style="background-image: url('/BillingSystem/Styling/images/bg.jpg');">
    <div class="container-contact2">
        <div class="wrap-contact2">
            <form class="contact2-form validate-form" action="/BillingSystem/bill">
                <span class="contact2-form-title">
                    Billing Process
                </span>

                <div class="wrap-input2 validate-input" data-validate="Name is required">
                    <input class="input2" type="text" name="msisdn"  pattern="00201[0-9]{9}" required>
                    <span class="focus-input2" data-placeholder="Enter Mobile Number ex.00201xxxxxxxxx "></span>
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
            <%

                String stored = (String) session.getAttribute("billed");
                stored = (stored == null) ? "" : stored;

                if (stored.equals("t")) {
            %>
            <p>

            <p style="color: green;padding-left: 41%;padding-top: 12px;">Billed Successfully   <i class="fa fa-check-circle" style="font-size:20px;color:green"></i> </p>
            <%
                    session.setAttribute("billed", "");
                }

            %>
        </div>
    </div>
</div>




<%@include file="../Styling/header_footer/footer.html" %>

