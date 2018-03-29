
<%@page import="java.sql.ResultSet"%>
<%@page import="database.DatabaseHandler"%>

<div class="rightcolumn" >
    <%!
        String productName = "";
    %>
    <%
        int sectionId1 = 0;
        DatabaseHandler dbHandler1 = new DatabaseHandler();
        ResultSet categories1 = dbHandler1.getAllCategories();
        while (categories1.next()) {
            sectionId1++;
            out.println("<div class='card3' style='border-width:5px;  margin:5px; border-style:inset;border-color:#707694;'>");
    %>



    <%
        out.println("<a name='section" + sectionId1 + "'><p style='font-family:serif' align='center'><font size='6' color='black'>" + categories1.getString(1).toUpperCase() + "</font></p></a>");
        out.println("<div class='fakeimg grid-container' style='height:500px; overflow-y: scroll' >");
        ResultSet products = dbHandler1.getCateogryProducts(dbHandler1.getCategoryId(categories1.getString(1)));
        while (products.next()) {
            if (products.getInt(3) != 0) {
                productName = products.getString(1);
                out.println("<div class='grid-item'>");
                out.println("<img src=" + products.getString(4) + ">");
                out.println("<br/>");
                out.println(products.getString(1).toUpperCase());
                out.println("<br/>");
                out.println("<h4 style='font-family:Tahoma ;text-align: left'><font size='3' color='black'><b>Price: </b>" + products.getDouble(2) + "<b>$</b></font></h4>");
                out.println("<h4 style='font-family:Tahoma ; text-align: left' ><font size='3' color='black'><b>Quantity: </b>" + products.getInt(3) + "</font></h4>");
    %>
    <button type="button" class="Cart" onclick="addToCart('<%=productName%>')">ADD TO CART</button>

    <button type='button' class="ProductDescription" onclick="showProductDescription('<%=productName%>')">
        Show</button>
        <%
                        out.println("</div>");
                    }
                }
                out.println("</div>");
                out.println("</div>");
            }
        %>
</div>
<script>
    function addToCart(productName) {
        document.location.href = "CartPage.jsp?productName=" + productName;
    }
    function showProductDescription(productName) {
        document.location.href = "productDescription.jsp?productName=" + productName;
    }
</script>