<%@include file="../Styling/header_footer/header.html" %>
<div class="bg-contact2" style="background-image: url('/BillingSystem/Styling/images/bg.jpg');">
    <div class="container-contact2" style="margin-top: 14px;">
        <div class="wrap-contact2">
            <form class="contact2-form validate-form" action="/BillingSystem/Rating/upload.jsp" method="post"  enctype = "multipart/form-data">
                <span class="contact2-form-title">
                    Rating Process
                </span>


                <!--                        <input class="inputfile" type = "file" name = "CDR" size = "50" required>-->


                <div class="container-contact2-form-btn">
                    <div class="wrap-contact2-form-btn">
                        <div class="contact2-form-bgbtn"></div>
                        <label for="file"><i class="fa fa-refresh fa-spin"></i> Upload CDR</label>

                        <input type="file"  id="file" class="inputfile" name ="file" size = "50" required />
                    </div>
                </div>


                <div class="container-contact2-form-btn">
                    <div class="wrap-contact2-form-btn">
                        <div class="contact2-form-bgbtn"></div>

                        <input class="contact2-form-btn" type = "submit" value = "Rate Now" />
                    </div>
                </div>
            </form>
            <%

                String stored = (String) session.getAttribute("stored");
                stored = (stored == null) ? "" : stored;

                if (stored.equals("y")) {
            %>
            rated 
            <%
                }

            %>
        </div>
    </div>
</div>




            <%@include file="../Styling/header_footer/footer.html" %>
