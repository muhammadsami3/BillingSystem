<%@include file="../Styling/header_footer/header.html" %>
<link rel="stylesheet" href="/BillingSystem/Styling/css/addNewCustomer.css">
        <link rel="stylesheet" href="/BillingSystem/Styling/css/main.css">
<div class="bg-contact2" style="background-image: url('/BillingSystem/Styling/images/bg.jpg');">
    <div class="container-contact2" style="margin-top: 14px;">
        <div class="wrap-contact2" style="margin-top: 87px;">
            <form class="contact2-form validate-form" action="/BillingSystem/Rating/upload.jsp" method="post"  enctype = "multipart/form-data">
                <span class="contact2-form-title">
                    Rating Process
                </span>


                <div class="container-contact2-form-btn">
                    <div class="wrap-contact2-form-btn" style="padding-top: 5px;padding-bottom: 5px;padding-right: 5px;padding-left: 5px;">
                        <div class="contact2-form-bgbtn" ></div>
                        <label for="file"><i class="fa fa-refresh fa-spin"></i> Upload CDR</label>

                        <input type="file"  id="file"  name ="file" size = "50" required />
                    </div>
                </div>


                <div class="container-contact2-form-btn">
                    <div class="wrap-contact2-form-btn">
                        <div class="contact2-form-bgbtn"></div>

                        <input class="button" type = "submit" value = "Rate Now" />
                    </div>
                </div>
            </form>
            <%

                String stored = (String) session.getAttribute("stored");
                stored = (stored == null) ? "" : stored;

                if (stored.equals("y")) {
            %>
            <p>
                
              <p style="color: green;padding-left: 41%;padding-top: 12px;">Rated Successfully   <i class="fa fa-check-circle" style="font-size:20px;color:green"></i> </p>
            <%
                }

            %>
        </div>
    </div>
</div>




            <%@include file="../Styling/header_footer/footer.html" %>
