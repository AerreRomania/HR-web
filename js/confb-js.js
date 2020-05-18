// bind the events (jQuery way)
$(document).ready(function () {
    $("#favicon").attr("href", "./Images/navB.png");
    bindEvents();
});

// attach the event binding function to every partial update
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function (evt, args) {
    bindEvents();
});

function getPDF() {
    var pdf = new jsPDF('p', 'pt', 'a2');
    $("input, button, p").addClass("nijekrugnegokocka");
    $("span").addClass("KoferceKruzicNone");
    pdf.addHTML(document.body, function () {
        pdf.save('Confection-B.pdf');
    });
};

function geteff() {
    setTimeout(function () { document.getElementById("cmdDownload").click(); }, 2000);
};

function bindEvents() {
    $("#menu").click(function () {
        $("#mainmenu").toggleClass("showmenu");
        $("#mainscreen").toggleClass("movemaincontainer");
    });

    $("#testsound").click(function () {
        responsiveVoice.speak("Buongiorno signor Antonioli, La efficienza media delle persone nel reparto Confezione A in questo momento e,,,,,, " + document.getElementById('lbltoteffConfA').textContent + "percento" + ",,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,Il numero delle persone assenti e " + document.getElementById('lblTotAss').textContent, "Italian Female", { pitch: 2 });
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

    $("#modalblurdiv").click(function () {
        $("#powerbuttonblur").click();
    });



    $('#check1').click(function () {
        if ($('#check1').is(':checked')) {
            $('#contLine1').css('visibility', 'visible');

        } else {
            $('#contLine1').css('visibility', 'hidden');
        }
    });

    $('#check2').click(function () {
        if ($('#check2').is(':checked')) {
            $('#contLine2').css('visibility', 'visible');
        } else {
            $('#contLine2').css('visibility', 'hidden');
        }
    });

    $('#check3').click(function () {
        if ($('#check3').is(':checked')) {
            $('#contLine3').css('visibility', 'visible');
        } else {
            $('#contLine3').css('visibility', 'hidden');
        }
    });

    $('#check4').click(function () {
        if ($('#check4').is(':checked')) {
            $('#contLine4').css('visibility', 'visible');
        } else {
            $('#contLine4').css('visibility', 'hidden');
        }
    });

    $('#check5').click(function () {
        if ($('#check5').is(':checked')) {
            $('#contLine5').css('visibility', 'visible');
        } else {
            $('#contLine5').css('visibility', 'hidden');
        }
    });

    $('#check6').click(function () {
        if ($('#check6').is(':checked')) {
            $('#contLine6').css('visibility', 'visible');
        } else {
            $('#contLine6').css('visibility', 'hidden');
        }
    });

    $('#check7').click(function () {
        if ($('#check7').is(':checked')) {
            $('#contLine7').css('visibility', 'visible');
        } else {
            $('#contLine7').css('visibility', 'hidden');
        }
    });

    $('#check8').click(function () {
        if ($('#check8').is(':checked')) {
            $('#contLine8').css('visibility', 'visible');
        } else {
            $('#contLine8').css('visibility', 'hidden');
        }
    });

    $('#check9').click(function () {
        if ($('#check9').is(':checked')) {
            $('#contLine9').css('visibility', 'visible');
        } else {
            $('#contLine9').css('visibility', 'hidden');
        }
    });

    $('#check10').click(function () {
        if ($('#check10').is(':checked')) {
            $('#contLine10').css('visibility', 'visible');
        } else {
            $('#contLine10').css('visibility', 'hidden');
        }
    });

    $('#check11').click(function () {
        if ($('#check11').is(':checked')) {
            $('#contLine11').css('visibility', 'visible');
        } else {
            $('#contLine11').css('visibility', 'hidden');
        }
    });

    $('#check12').click(function () {
        if ($('#check12').is(':checked')) {
            $('#contLine12').css('visibility', 'visible');
        } else {
            $('#contLine12').css('visibility', 'hidden');
        }
    });


    $("#select_all").change(function () {  //"select all" change 
        $(".checkbox").prop('checked', $(this).prop("checked")); //change all ".checkbox" checked status
        //console.log($(this).prop("checked"));
        for (i = 1; i <= 13; i++) {
            j = i;
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
        if (false == $(this).prop("checked")) { //if this item is unchecked
            $("#select_all").prop('checked', false); //change "select all" checked status to false
        }
        //check "select all" if all checkbox items are checked
        if ($('.checkbox:checked').length == $('.checkbox').length) {
            $("#select_all").prop('checked', true);
        }
    });

    $("#btn_print").click(function () {
        $('body').css({ zoom: 0.54 });
        window.print();
        $('body').css({ zoom: 1 });
    });

    $("#btn_pdf").click(function () {
        getPDF();
        geteff();
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
        //    $("#listlink").hide();
        //    $("#mainmenu").hide();
        //    $("#listlink2").show();            
    });
};

function showsecondpage() {
    $("#loadingbar").hide();
    $("#listlink").hide();
    $("#mainmenu").hide();
    $("#listlink2").show();
};
