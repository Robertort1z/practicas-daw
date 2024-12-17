
var gatos = ["caja1", "caja2", "caja3", "caja4", "caja5", "caja6", "caja7", "caja8", "caja9", "caja10", "caja1", "caja2", "caja3", "caja4", "caja5", "caja6", "caja7", "caja8", "caja9", "caja10"];

var numPareja = 0;
var parejas = 0;
var intervalo;
var pareja = [];
var timeStart = new Date();

$(document).ready(function () {
    asignarImagenes();

    $(".caja").click(function (e) {
        if ($(this).css("opacity") == "0") {
            $(this).css("opacity", "1");
        }
        pareja[numPareja] = $(this).attr("id");
        if (numPareja == 0) {
            numPareja += 1;
        } else {
            setTimeout(compruebaPareja, 500);
        }
    });
});


function asignarImagenes() {
    gatos.sort(function () {
        return Math.random() - 0.5;
    });
    let cajas = $(".caja");

    $(cajas).each(function (i) {
        $(cajas[i]).attr("src", gatos[i] + ".jpg")
        $(cajas[i]).css("opacity", "0")

    })
}

function compruebaPareja() {
    let imagen1 = $("#" + pareja[0]).attr("src");
    let imagen2 = $("#" + pareja[1]).attr("src");
    if (imagen1 == imagen2) {
        parejas++;
        $("#numParejas").text(parejas);
        if (parejas == 10) {
            clearInterval(intervalo);
            $("#cronometro").css("color", "red");
        }
    } else {
        $("#" + pareja[0]).css("opacity", "0");
        $("#" + pareja[1]).css("opacity", "0");
    }
    numPareja = 0;
}


function incrementa() {
    let actual = new Date();
    let cro = actual - timeStart;
    let cr = new Date();
    cr.setTime(cro);
    let cs = cr.getMilliseconds();
    cs = cs / 10;
    cs = Math.round(cs);
    let sg = cr.getSeconds();
    let mn = cr.getMinutes();
    let ho = cr.getHours();
    if (cs < 10) {
        cs = "0" + cs;
    }

    if (sg < 10) {
        sg = "0" + sg
    }

    if (mn < 10) {
        mn = "0" + mn;
    }

    $("#cronometro").text(ho + "  :  " + mn + " : " + sg);

}