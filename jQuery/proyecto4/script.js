var index = 1;
var state = "stop";
var interval;

$(document).ready(function () {
    $(".small").click(function (e) {
        $("#" + index).removeClass("selected");
        let source = $(this).attr("src");
        $(".big").attr("src", source);
        index = parseInt($(this).attr("id"));
        $("#" + index).addClass("selected");
    });

    $("#backward").click(function () {
        goBackward();

    });


    $("#forward").click(function (e) {
        goForward();

    });

    $(document).keydown(function (e) {
        if (e.key == "ArrowLeft") {
            goBackward();
        }
        if (e.key == "ArrowRight") {
            goForward();
        }
    });


    $("#plat").click(function () {
        if (state == "stop") {
            state = "play";
            $("#plat").text("#");
            interval = setInterval(goForward, 1000);


        } else {
            state = "stop";
            $("#plat").text(">");
            clearInterval(interval);
        }
    })



});


function goBackward() {
    $("#" + index).removeClass("selected");
    if (index == 1) {
        index = 7;
    } else {
        index--;
    }
    let source = $("#" + index).attr("src");
    $(".big").attr("src", source);
    $("#" + index).addClass("selected");
}


function goForward() {
    $("#" + index).removeClass("selected");
    if (index == 7) {
        index = 1;
    } else {
        index++;
    }
    let source = $("#" + index).attr("src");
    $(".big").attr("src", source);
    $("#" + index).addClass("selected");
}
