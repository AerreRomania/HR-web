$(document).ready(function () {
    $("#favicon").attr("href", "./Images/navA.png");
    bindEvents();
    $("#accordion").accordion({
        collapsible: true
    });
});

// attach the event binding function to every partial update
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function (evt, args) {
    bindEvents();
});


function showsecondpage() {
    $("#loadingbar").hide();
    $("#listlink").hide();
    $("#mainmenu").hide();
    $("#listlink2").show();
}

function getPDF() {
    var pdf = new jsPDF('p', 'pt', 'a2');
    $("input, button, p").addClass("nijekrugnegokocka");
    $("span").addClass("KoferceKruzicNone");
    pdf.addHTML(document.body, function () {
        pdf.save('ConfezioneA.pdf');
    });
}

function bindEvents() {
    $("#menu").click(function () {
        $("#mainmenu").toggleClass("showmenu");
        $("#mainscreen").toggleClass("movemaincontainer");
    });

    $("#testsound").click(function () {
        responsiveVoice.speak("Buongiorno signor Antonioli, La efficienza media delle persone nel reparto Confezione A in questo momento e,,,,,, " + document.getElementById('lbltoteffConfA').textContent + "percento" + ",,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,Il numero delle persone assenti e " + document.getElementById('lblTotAss').textContent, "Italian Female", {
            pitch: 2
        });
    });

    $("#backmenu").click(function () {
        $("#mainmenu").hide();
    });

    $("#secondpage").click(function () {
        $("#showmore").click();
        $("#listlink").hide();
        $("#mainmenu").hide();
        $("#listlink2").show();
        $("#loadingbar").show();
    });


    $("#firstpage").click(function () {
        $("#listlink2").hide();
        $("#listlink").show();
        $("#mainmenu").hide();
    });

    $("#menu").click(function () {
        $("#mainmenu").show();
        $("#mainmenu2").toggleClass("showmenu2");
        $("#mainscreen").toggleClass("movemaincontainer");
    });

    $("#showmore").click(function () {
        $("#loadingbar").show();
    });



    $('#check1').click(function () {
        if ($('#check1').is(':checked')) {
            $('#contLine13').css('visibility', 'visible');

        } else {
            $('#contLine13').css('visibility', 'hidden');
        }
    });

    $('#check2').click(function () {
        if ($('#check2').is(':checked')) {
            $('#contLine14').css('visibility', 'visible');
        } else {
            $('#contLine14').css('visibility', 'hidden');
        }
    });

    $('#check3').click(function () {
        if ($('#check3').is(':checked')) {
            $('#contLine15').css('visibility', 'visible');
        } else {
            $('#contLine15').css('visibility', 'hidden');
        }
    });

    $('#check4').click(function () {
        if ($('#check4').is(':checked')) {
            $('#contLine16').css('visibility', 'visible');
        } else {
            $('#contLine16').css('visibility', 'hidden');
        }
    });

    $('#check5').click(function () {
        if ($('#check5').is(':checked')) {
            $('#contLine17').css('visibility', 'visible');
        } else {
            $('#contLine17').css('visibility', 'hidden');
        }
    });

    $('#check6').click(function () {
        if ($('#check6').is(':checked')) {
            $('#contLine18').css('visibility', 'visible');
        } else {
            $('#contLine18').css('visibility', 'hidden');
        }
    });

    //select all checkboxes
    $("#select_all").change(function () { //"select all" change 
        $(".checkbox").prop('checked', $(this).prop("checked")); //change all ".checkbox" checked status
        //console.log($(this).prop("checked"));
        for (i = 1; i < 7; i++) {
            j = i + 12;
            if ($('#check' + i + '').is(':checked')) {
                $('#contLine' + j + '').css('visibility', 'visible');
            } else {
                $('#contLine' + j + '').css('visibility', 'hidden');
            }
        }
    });

    //".checkbox" change
    $('.checkbox').change(function () {
        //uncheck "select all", if one of the listed checkbox item is unchecked
        if (false === $(this).prop("checked")) { //if this item is unchecked
            $("#select_all").prop('checked', false); //change "select all" checked status to false
        }
        //check "select all" if all checkbox items are checked
        if ($('.checkbox:checked').length === $('.checkbox').length) {
            $("#select_all").prop('checked', true);
        }
    });


    $("#btn_print").click(function () {
        $('body').css({
            zoom: 0.54
        });
        window.print();
        $('body').css({
            zoom: 1
        });
    });

    $("#btn_pdf").click(function () {
        getPDF();
        geteff();
    });
}

 