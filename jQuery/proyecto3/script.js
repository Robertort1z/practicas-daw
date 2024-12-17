var isNotCal = false;

$(document).ready(function () {

    $(".op").click(function () {
        let num = $(this).attr("id");

        clickKey(num);
    });

    $("#result").click(function () {
        getResult();
    });

    $("#clear").click(function () {
        clearOutput();
    });
    $("#del").click(function () {
        delOutput();
    });

    $(document).keydown(function (e) {
        switch (e.key) {
            case "1":
                clickKey("1");
                break;
            case "2":
                clickKey("2");
                break;
            case "3":
                clickKey("3");
                break;
            case "4":
                clickKey("4");
                break;
            case "5":
                clickKey("5");
                break;
            case "6":
                clickKey("6");
                break;
            case "7":
                clickKey("7");
                break;
            case "8":
                clickKey("8");
                break;
            case "9":
                clickKey("9");
                break;
            case "0":
                clickKey("0");
                break;
            case ".":
                clickKey(".");
                break;
            case "-":
                clickKey("-");
                break;
            case "+":
                clickKey("+");
                break;
            case "*":
                clickKey("*");
                break;
            case "/":
                clickKey("/");
                break;
            case "Backspace":
                e.preventDefault();
                delOutput();
                break;
            case "Enter":
                e.preventDefault();
                getResult();
                break;
            default:
                break;
        }
    });
});




function clickKey(num) {
    if (isNotCal) {
        $("#output").text("");
    }
    let str = $("#output").text();
    $("#output").text(str + num);
    isNotCal = false;
}


function getResult() {
    isNotCal = true;
    let numResult = eval($("#output").text());
    $("#output").text(numResult);
}
function clearOutput() {
    $("#output").text("");
}

function delOutput() {
    if (isNotCal) {
        $("#output").text("");
    } else {
        let str = $("#output").text();
        $("#output").text(str.substring(0, str.length - 1));
    }
}