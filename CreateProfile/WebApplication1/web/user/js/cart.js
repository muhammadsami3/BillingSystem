var taxRate = 0.05;
var shippingRate = 15.00;
var fadeTime = 300;


$('.product-quantity input').change(function () {
    updateQuantity(this);

});

function recalculateCart()
{
    var subtotal = 0;

    /* Sum up row totals */
    $('.product').each(function () {
        subtotal += parseFloat($(this).children('.product-line-price').text());
    });
    /* Calculate totals */
    var tax = subtotal * taxRate;
    var shipping = (subtotal > 0 ? shippingRate : 0);
    var total = subtotal + tax + shipping;
//    var creditlimit = parseInt(document.getElementById("creditlimit").innerHTML) - total;
    /* Update totals display */
    $('.totals-value').fadeOut(fadeTime, function () {
        $('#cart-subtotal').html(subtotal.toFixed(2));
        $('#cart-tax').html(tax.toFixed(2));
        $('#cart-shipping').html(shipping.toFixed(2));
        $('#cart-total').html(total.toFixed(2));
//        $('#creditlimit').html(creditlimit.toFixed(2));
        if (total == 0) {
            $('.checkout').fadeOut(fadeTime);
        } else {
            $('.checkout').fadeIn(fadeTime);
        }
        $('.totals-value').fadeIn(fadeTime);
    });
}


/* Update quantity */
function updateQuantity(quantityInput)
{
    /* Calculate line price */
    var productRow = $(quantityInput).parent().parent();
    var price = parseFloat(productRow.children('.product-price').text());
    var quantity = $(quantityInput).val();
    var linePrice = price * quantity;

    /* Update line price display and recalc cart totals */
    productRow.children('.product-line-price').each(function () {
        $(this).fadeOut(fadeTime, function () {
            $(this).text(linePrice.toFixed(2));
            recalculateCart();
            $(this).fadeIn(fadeTime);
        });
    });
}


/* Remove item from cart */

function removeProduct(event) {
    var product = event.currentTarget.parentNode.parentNode;
    for (var i = 0; i < product.childNodes.length; i++) {
        if (product.childNodes[i].className == "product-details") {
            var productName = product.childNodes[i].childNodes[1].innerHTML;
            var creditLimit = document.getElementById("creditlimit");
            var form = document.createElement("form");
            form.method = "POST";
            form.action = "processRemoveProduct.jsp";
            var element = document.createElement("input");
            element.value = productName;
            element.name = "productName";
            form.appendChild(element);
            document.body.appendChild(form);
            form.submit();
            break;
        }
    }
}

var subtotal = 0;

/* Sum up row totals */
$('.product').each(function () {
    subtotal += parseFloat($(this).children('.product-line-price').text());

});

function checkout() {
    var isAvailable=true;
    var creditlimitElement = document.getElementById("creditlimit").innerHTML;
    var creditlimit = parseFloat(creditlimitElement.replace("Credit Limit :", ""));
    var totalAmount = document.getElementById("cart-total").innerHTML;
    var quantity = document.getElementsByClassName("quantity");
    var products = document.getElementsByClassName("product-title");
    var storeQuantity = document.getElementsByClassName("storeQuantity");
    for (var x = 0; x < quantity.length; x++)   // comparison should be "<" not "<="
    {
        var productName=products[x].innerHTML;
        var requiredQuantity = parseInt(quantity[x].value);
        var availableQuantity=parseInt(storeQuantity[x].innerHTML.replace("Available :", ""));
        if(availableQuantity<requiredQuantity){
            document.getElementById("errorMessage1").innerHTML="#sorry we do not have enough quantity for "+productName;
            isAvailable=false;
        }

    }
    
    if (creditlimit > totalAmount && isAvailable) {
        var form = document.createElement("form");
        form.method = "POST";
        form.action = "processCheckOut.jsp";
        var products = document.getElementsByClassName("product-title");
        var quantity = document.getElementsByClassName("quantity");
        for (var x = 0; x < products.length; x++)   // comparison should be "<" not "<="
        {
            var element = document.createElement("input");
            element.value = quantity[x].value;
            element.name = products[x].innerHTML;
            form.appendChild(element);
            console.log(element.name);
            console.log(element.value);
        }
        var totalAmount = document.createElement("input");
        totalAmount.value = document.getElementById("cart-total").innerHTML;
        totalAmount.name = "totalamount";
        form.appendChild(totalAmount);
        console.log("totalAmount");
        console.log(totalAmount.value);
        document.body.appendChild(form);
        form.submit();
    } else {
        if(isAvailable){
            document.getElementById("errorMessage").style.display = "block";
        }else{
            document.getElementById("errorMessage1").style.display = "block";
        }
    }
}
document.getElementById("errorMessage").style.display = "none";
document.getElementById("errorMessage1").style.display = "none";
/* Calculate totals */
$('.product-quantity input').change();