function validateForm() {
    var name = document.forms["contactForm"]["name"].value;
    var street = document.forms["contactForm"]["street"].value;
    var city = document.forms["contactForm"]["city"].value;
    var postal = document.forms["contactForm"]["postal"].value;
    var phone = document.forms["contactForm"]["phone"].value;
    var ct_sp = city.split(" ");
    var ph_sp = phone.split("-");

    if (name == "") {
        alert("Missing name!");
        return false;
    } else if (!name.match(/^[a-z ]+$/i)) {
        alert("Invalid name!");
        return false;
    } else if (street == "" || city == "" || postal == "") {
        alert("Missing address!");
        return false;
    } else if (ct_sp.length == 1) {
        alert("Missing province!");
        return false;
    } else if (phone == "") {
        alert("Missing phone number!");
        return false;
    } else if (!phone.match(/^[0-9-]+$/)) {
        alert("Invalid phone number!");
        return false;
    } else if (ph_sp.length != 3 || ph_sp[0].length != 3 || ph_sp[1].length != 3 || ph_sp[2].length != 4) {
        alert("Invalid phone number format!");
        return false;
    }
}

$(document).ready(() => {
    function move(){
        $("#ph1").animate({
            "left": "+=50px",
            opacity: '0.5'
        }, "slow")
            .animate({
            "left": "-=50px",
            opacity: '1'
        }, "slow",
            function(){
                move();
            });
            
        $("#ph2").animate({
            "top": "+=50px",
            opacity: '1'
        }, "slow")
            .animate({
            "top": "-=50px",
            opacity: '0.5'
        }, "slow")
            .animate({
            "top": "-=50px",
            opacity: '1'
        }, "slow")
            .animate({
            "top": "+=50px",
            opacity: '0.5'
        }, "slow",
            function(){
                move();
            });

        $("#ph3").animate({
            "left": "-=50px",
            opacity: '0.5'
        }, "slow")
            .animate({
            "left": "+=50px",
            opacity: '1'
        }, "slow",
            function(){
                move();
            });
    }
    move();
});

    