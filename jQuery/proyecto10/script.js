var longitud = -3.70325;
var latitud = 40.4165;
var zoomApp = 2;

$(document).ready(function () {
    $("#image").hide();
    $("#map").show();
    drawMap();

    $("#search").click(function () {
        let city = $("#city").val();
        let street = $("#street").val();
        let query = "http://api.positionstack.com/v1/forward?access_key=1cc7551e82eee8aac3b80bcdc4c4f996&query=" + street + " " + city;

        if (street != "") {
            zoomApp = 18;
        } else {
            zoomApp = 12;
        }

        $.ajax({
            type: "get",
            dataType: "html",
            url: query,
            success: function (info) {
                info = JSON.parse(info);
                if (info.data.length === 0) {
                    $("#image").show();
                    $("#map").hide();
                } else {
                    $("#image").hide();
                    $("#map").show();
                    info = info.data[0];
                    latitud = info.latitude;
                    longitud = info.longitude;
                    drawMap();
                }
            }
        });
    });
});

function drawMap() {
    $("#map").empty();
    var map = new ol.Map({
        target: "map",
        layers: [
            new ol.layer.Tile({
                source: new ol.source.OSM()
            })
        ],
        view: new ol.View({
            center: ol.proj.fromLonLat([longitud, latitud]),
            zoom: zoomApp
        })
    });
}
