$(document).ready(function () {
    $("#centigrados").change(function () {
        let cent = $("#centigrados").val();
        let cent_number = parseInt(cent);
        let farenh = (cent_number * 9 / 5) + 32;
        $("#farenheiht").val(farenh.toFixed(2));

    });

    $("#farenheiht").change(function () {
        let faren = $("#farenheiht").val();
        let faren_number = parseInt(faren);
        let cent = (faren_number - 32) * 5 / 9;
        $("#centigrados").val(cent.toFixed(2));
    });
});

