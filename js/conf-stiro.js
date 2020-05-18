
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
function EndRequestHandler(sender, args) {
    if (args.get_error() !== undefined) {
        args.set_errorHandled(true);
    }
}

function PrintPage() {
    var panel = document.getElementById("<%=gv_intervali.ClientID %>");
    var printWindow = window.open('', '', 'height=2600,width=1000');
    printWindow.document.write('<table>');
    printWindow.document.write(panel.innerHTML);
    printWindow.document.write('</table>');
    printWindow.document.close();
    printWindow.print();

    return false;
};

// bind the events (jQuery way)
$(document).ready(function () {

    $("#favicon").attr("href", "./Images/navS.png");
    bindEvents();


});

// attach the event binding function to every partial update
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function (evt, args) {
    bindEvents();
});

function closeme() {
    $("#closeme").click();
};

$("#closee").click(function () {
    $("#closeme").click();

});

function bindEvents() {
    $("#menu").click(function () {
        $("#mainmenu").toggleClass("showmenu");
        $("#mainscreen").toggleClass("movemaincontainer");
    });

    $("#cal_button").click(function () {
        $("#spinner").css("display", "block");
    });

    $("#spinner").hide();


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
        //$("#loadingbar").show();
        $("#listlink").hide();
        $("#mainmenu").hide();
        $("#listlink2").show();
        $("#loadingbar").show();
        $("#secondpage").click();
    });
    //select all checkboxes
    $("#select_all").change(function () {  //"select all" change 
        $(".checkbox").prop('checked', $(this).prop("checked")); //change all ".checkbox" checked status

        if ($('#check1').is(':checked')) {
            $('#l1').css('visibility', 'visible');
        } else {
            $('#l1').css('visibility', 'hidden');
        }


        if ($('#check2').is(':checked')) {
            $('#l2').css('visibility', 'visible');
        } else {
            $('#l2').css('visibility', 'hidden');
        }


        if ($('#check3').is(':checked')) {
            $('#l3').css('visibility', 'visible');
        } else {
            $('#l3').css('visibility', 'hidden');
        }


        if ($('#check4').is(':checked')) {
            $('#l4').css('visibility', 'visible');
        } else {
            $('#l4').css('visibility', 'hidden');
        }


        if ($('#check5').is(':checked')) {
            $('#l5').css('visibility', 'visible');
        } else {
            $('#l5').css('visibility', 'hidden');
        }


        if ($('#check6').is(':checked')) {
            $('#l6').css('visibility', 'visible');
        } else {
            $('#l6').css('visibility', 'hidden');
        }

        if ($('#check7').is(':checked')) {
            $('#l7').css('visibility', 'visible');
        } else {
            $('#l7').css('visibility', 'hidden');
        }

        if ($('#check8').is(':checked')) {
            $('#l8').css('visibility', 'visible');
        } else {
            $('#l8').css('visibility', 'hidden');
        }

        if ($('#check9').is(':checked')) {
            $('#l9').css('visibility', 'visible');
        } else {
            $('#l9').css('visibility', 'hidden');
        }

        if ($('#check10').is(':checked')) {
            $('#l10').css('visibility', 'visible');
        } else {
            $('#l10').css('visibility', 'hidden');
        }

        if ($('#check11').is(':checked')) {
            $('#l11').css('visibility', 'visible');
        } else {
            $('#l11').css('visibility', 'hidden');
        }
        if ($('#check12').is(':checked')) {
            $('#l12').css('visibility', 'visible');
        } else {
            $('#l12').css('visibility', 'hidden');
        }
        if ($('#check13').is(':checked')) {
            $('#l13').css('visibility', 'visible');
        } else {
            $('#l13').css('visibility', 'hidden');
        }
        if ($('#check14').is(':checked')) {
            $('#l14').css('visibility', 'visible');
        } else {
            $('#l14').css('visibility', 'hidden');
        }
        if ($('#check15').is(':checked')) {
            $('#l15').css('visibility', 'visible');
        } else {
            $('#l15').css('visibility', 'hidden');
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

};

$("#novo").click(function () {
    $("#novo1").click();
});

$("#close1").click(function () {
    $("#powerbutton1").click();
});

function showsecondpage() {
    $("#loadingbar").hide();
    $("#listlink").hide();
    $("#mainmenu").hide();
    $("#listlink2").show();
};


$("#btn_print").click(function () {
    $('body').css({ zoom: 0.54 });
    window.print();
    $('body').css({ zoom: 1 });
});

$("#btn_pdf").click(function () {
    getPDF();
    geteff();
});

$("#get_pdf_intervali").click(function () {
    getPDF_intervali();
});

function getPDF() {
    var pdf = new jsPDF('p', 'pt', 'a2');
    $("input, button, p").addClass("nijekrugnegokocka");
    $("span").addClass("KoferceKruzicNone");
    pdf.addHTML(document.body, function () {
        pdf.save('Stiro.pdf');
    });
};

function getPDF_intervali() {
    var pdf = new jsPDF('p', 'pt', 'a2');
    pdf.addHTML($("#popup"), function () {
        pdf.save('Stiro_interval.pdf');
    });
};

$('#zoom-in').click(function () {
    updateZoom(0.1);
});

$('#zoom-out').click(function () {
    updateZoom(-0.1);
});

zoomLevel = 1;

var updateZoom = function (zoom) {
    zoomLevel += zoom;
    $('body').css({ zoom: zoomLevel, '-moz-transform': 'scale(' + zoomLevel + ')' });
};

function mouseOver() {
    document.getElementById("left-navi").className = "ng-scope hover";
};
function mouseOut() {
    document.getElementById("left-navi").className = "ng-scope";
};

function rgtForce() {

    var e = document.getElementById('right-navi');
    if (e.className === 'ng-scope hover') {
        e.className = 'ng-scope';
    }
    else {
        e.className = 'ng-scope hover';
    }
};

function priorView() {
    var collection = document.getElementsByClassName('cats');

    document.getElementById('prior').className = 'filter active';
    document.getElementById('all').className = 'filter';

    for (var i = 0, len = collection.length; i < len; i++) {
        collection[i].classList.remove("show");
    }
};
function allView() {
    var collection = document.getElementsByClassName('cats');

    document.getElementById('prior').className = 'filter';
    document.getElementById('all').className = 'filter active';

    for (var i = 0, len = collection.length; i < len; i++) {
        collection[i].classList.add("show");
    }
};

function mouseOverRight() {
    document.getElementById("right-assnavi").className = "ng-scope hover";
};
function mouseOutRight() {
    document.getElementById("right-assnavi").className = "ng-scope";
};

function zoominoutstampa() {
    $("#stampa").click(function () {
        $('body').css({ zoom: 0.54 });

        window.print();
        $('body').css({ zoom: 1 });
    });

    $('#zoom-in').click(function () {
        updateZoom(0.1);
    });
    
    $('#zoom-out').click(function () {
        updateZoom(-0.1);
    });

    zoomLevel = 1;

    var updateZoom = function (zoom) {
        zoomLevel += zoom;
        $('body').css({ zoom: zoomLevel, '-moz-transform': 'scale(' + zoomLevel + ')' });
    };
};

$(function () {
    setInterval(function () {
        var seconds = new Date().getTime() / 1000;
        var time = new Date(),
            hours = time.getHours(),
            min = time.getMinutes(),
            sec = time.getSeconds(),
            millSec = time.getMilliseconds(),
            millString = millSec.toString().slice(0, -2),
            day = time.getDay(),
            ampm = hours >= 12 ? 'PM' : 'AM',
            month = time.getMonth(),
            date = time.getDate(),
            year = time.getFullYear(),
            monthShortNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun",
                "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
            ];

        //convert hours from military time and add the am or pm
        //if (hours > 11) $('#ampm').text(ampm);
        $('#ampm').text(ampm)
        if (hours > 12) hours = hours % 12;
        if (hours === 0) hours = 12;

        //add leading zero for min and sec 
        if (sec <= 9) sec = "0" + sec;
        if (min <= 9) min = "0" + min;

        $('#hours').text(hours);
        $('#min').text(":" + min + ":");
        $('#sec').text(sec);
        //$("#test").text(day);
        // $('#millSec').text(millString);
        $('.days:nth-child(' + (day + 1) + ')').addClass('active');
        $("#month").text(monthShortNames[month]);
        $('#date').text(date);
        $('#year').text(year);
    }, 100);
});

$(document).ready(function () {

    $('#check1').change(function () {
        if ($('#check1').is(':checked')) {
            $('#l1').css('visibility', 'visible');
        } else {
            $('#l1').css('visibility', 'hidden');
        }
    });
    
    $('#check2').change(function () {
        if ($('#check2').is(':checked')) {
            $('#l2').css('visibility', 'visible');
        } else {
            $('#l2').css('visibility', 'hidden');
        }
    });

    $('#check3').change(function () {
        if ($('#check3').is(':checked')) {
            $('#l3').css('visibility', 'visible');
        } else {
            $('#l3').css('visibility', 'hidden');
        }
    });

    $('#check4').change(function () {
        if ($('#check4').is(':checked')) {
            $('#l4').css('visibility', 'visible');
        } else {
            $('#l4').css('visibility', 'hidden');
        }
    });

    $('#check5').change(function () {
        if ($('#check5').is(':checked')) {
            $('#l5').css('visibility', 'visible');
        } else {
            $('#l5').css('visibility', 'hidden');
        }
    });

    $('#check6').change(function () {
        if ($('#check6').is(':checked')) {
            $('#l6').css('visibility', 'visible');
        } else {
            $('#l6').css('visibility', 'hidden');
        }
    });

    $('#check7').change(function () {
        if ($('#check7').is(':checked')) {
            $('#l7').css('visibility', 'visible');
        } else {
            $('#l7').css('visibility', 'hidden');
        }
    });

    $('#check8').change(function () {
        if ($('#check8').is(':checked')) {
            $('#l8').css('visibility', 'visible');
        } else {
            $('#l8').css('visibility', 'hidden');
        }
    });

    $('#check9').change(function () {
        if ($('#check9').is(':checked')) {
            $('#l9').css('visibility', 'visible');
        } else {
            $('#l9').css('visibility', 'hidden');
        }
    });

    $('#check10').change(function () {
        if ($('#check10').is(':checked')) {
            $('#l10').css('visibility', 'visible');
        } else {
            $('#l10').css('visibility', 'hidden');
        }
    });

    $('#check11').change(function () {
        if ($('#check11').is(':checked')) {
            $('#l11').css('visibility', 'visible');
        } else {
            $('#l11').css('visibility', 'hidden');
        }
    });

    $('#check12').change(function () {
        if ($('#check12').is(':checked')) {
            $('#l12').css('visibility', 'visible');
        } else {
            $('#l12').css('visibility', 'hidden');
        }
    });

    $('#check13').change(function () {
        if ($('#check13').is(':checked')) {
            $('#l13').css('visibility', 'visible');
        } else {
            $('#l13').css('visibility', 'hidden');
        }
    });

    $('#check14').change(function () {
        if ($('#check14').is(':checked')) {
            $('#l14').css('visibility', 'visible');
        } else {
            $('#l14').css('visibility', 'hidden');
        }
    });

    $('#check15').change(function () {
        if ($('#check15').is(':checked')) {
            $('#l15').css('visibility', 'visible');
        } else {
            $('#l15').css('visibility', 'hidden');
        }
    });
});

function GetNameByHover1() {
    document.getElementById("GetName").click();
};
