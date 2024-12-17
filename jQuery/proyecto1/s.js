$(document).ready(function () {

    $("#contador").click(function (e) {
        let funcion = $("#contador").val();
        if (funcion == "Ver numero enlace") {
            let enlaces = $("a");
            $("#mostrar").val(enlaces.length);
            $("#contador").val("Ver numero parrafos");
        } else {
            let parrafos = $("p");
            $("#mostrar").val(parrafos.length);
            $("#contador").val("Ver numero enlace");
        }

    });


    $("#parrafos").click(function () {
        let funcion = $("#parrafos").val();
        let nuevo_parrafo = "<p>Jamal</p>";

        if (funcion == "Añadir un parrafo") {
            $("#contenido").append(nuevo_parrafo);
            $("#parrafos").val("Eliminar");
        } else {
            let parrafos = $("p");
            let parrafo = parrafos[parrafos.length - 1];
            parrafo.remove();
            $("#parrafos").val("Añadir un parrafo");

        }
    })


    $("#fondo").click(function (e) {
        let funcion = $("#fondo").val();
        if (funcion == "Poner fondo") {
            $("#contenido").css("background-color", "red");
            $("#fondo").val("Quitar fondo");
        } else {
            $("#contenido").css("background-color", "white");
            $("#fondo").val("Poner fondo");
        }

    });

});