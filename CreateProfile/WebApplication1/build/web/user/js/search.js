function openSearch() {
    document.getElementById("myOverlay").style.display = "block";
}

function closeSearch() {
    document.getElementById("myOverlay").style.display = "none";
}
function changeHandler() {
    if(document.getElementById("price").checked===true){
        document.getElementById("mimimum").disabled = false;
        document.getElementById("maximum").disabled = false;
        document.getElementById("mimimum").required = true;
        document.getElementById("maximum").required = true;
    }else{
        document.getElementById("mimimum").disabled = true;
        document.getElementById("maximum").disabled = true;
        document.getElementById("mimimum").required = false;
        document.getElementById("maximum").required = false;
    }
    
}
document.getElementById("search").value = "";
document.getElementById("mimimum").disabled = true;
document.getElementById("mimimum").value = "";
document.getElementById("maximum").disabled = true;
document.getElementById("maximum").value = "";
document.getElementById("mimimum").required = false;
document.getElementById("maximum").required = false;
document.getElementById("price").checked=false;
