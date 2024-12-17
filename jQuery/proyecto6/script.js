$(document).ready(function () {
    $(document).keydown(function (e) {
        if (e.key == "w") {
            $("#object").hide();
        } else if (e.key == "z") {
            $("#object").show();
        } else if (e.key == "a") {
            $("#object").animate({ "marginLeft": "-50px", "width": "-=5px", "height": "-=5px" });
        } else if (e.key == "s") {
            $("#object").animate({ "marginLeft": "+=50px", "width": "+=5px", "height": "+=5px" });
        }
    });
});