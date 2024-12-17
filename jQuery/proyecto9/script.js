var x_dat = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];
var y_dat = [4, 7, 12, 17, 21, 24, 27, 29, 23, 16, 11, 6];

$(document).ready(function () {
    let data = [];

    $.each(x_dat, function (index, value) {
        data.push({
            label: value,
            y: y_dat[index]
        });
    });

    var options = {
        title: {
            text: "Temperatura media España"
        },
        animationEnabled: true,
        exportEnabled: true,
        data: [{
            type: "column",
            name: "Temp",
            showInLegend: true,
            dataPoints: data
        }]
    };

    $("#chartContainer").CanvasJSChart(options);
});
