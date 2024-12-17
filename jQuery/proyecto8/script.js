$(document).ready(function () {
    let films = [];
    let index = -1;

    $("#search").click(function () {
        films = [];
        index = -1;

        const text = $("#text").val();
        const type = $("input[name='peliculas']:checked").attr("id");

        if (!text) {
            alert("Por favor, ingresa un término de búsqueda.");
            return;
        }

        $.ajax({
            type: "GET",
            url: `https://www.omdbapi.com/?s=${text}&apikey=6ed2f4bf&type=${type}`,
            success: function (data) {
                if (data.Response === "True") {
                    films = data.Search;
                    index = 0;
                    mostrarFilm(index);
                } else {
                    limpiarPantalla();
                    alert("No se encontraron resultados: " + data.Error);
                }
            },
            error: function () {
                alert("Ocurrió un error al consultar la API. Intenta nuevamente.");
            },
        });
    });

    $("#fordward").click(function () {
        if (films.length === 0) return;
        index = (index + 1) % films.length;
        mostrarFilm(index);
    });

    $("#backward").click(function () {
        if (films.length === 0) return;
        index = (index - 1 + films.length) % films.length;
        mostrarFilm(index);
    });

    function mostrarFilm(idx) {
        const film = films[idx];
        const image = film.Poster !== "N/A" ? `<img src="${film.Poster}" alt="Poster">` : "<p>Sin imagen</p>";

        $("#title").text(film.Title);
        $("#year").text(film.Year);
        $("#poster").html(image);
    }

    function limpiarPantalla() {
        $("#title").text("");
        $("#year").text("");
        $("#poster").html("");
    }
});