function Lista()  
{
    $get('up').style.display = '';
    WbmOlimpias.RaportAbsenteDepartamentWS.RaportAbsenteDepartamentLista($get("ddlFiltruAn").value, $get("ddlFiltruLuna").value, $get("tbFiltruDepartament").value, $get("ddlFiltruEchipaLinie").value, $get("ddlFiltruMansione").value, SucceededCallback, FailedCallback);
 }

function bExcel_Click() {
    $get('up').style.display = '';
    WbmOlimpias.RaportAbsenteDepartamentWS.RaportAbsenteDepartamentExcel($get("ddlFiltruAn").value,$get("ddlFiltruLuna").value, $get("tbFiltruDepartament").value, SucceededCallback, FailedCallback);
}

function printExcel() {
 

    myTable = document.getElementById('tAbsenteDepartamentOre');
    myClone = myTable.cloneNode(true);
    myClone.rows[0].remove();
    //myClone.rows[0].remove();
    myClone.rows[myClone.rows.length - 1].remove();
    document.body.appendChild(myClone);



    var tab_text = "<html><head><style type='text/css'> td.rWeekend{font-size:11px;text-align:center;vertical-align:middle;}td.rSelectat{ background-color: #d0d0d0;text-align:center;vertical-align:middle;}td.rWeekend,td.rNeselectat{height:25px;text-align:center;vertical-align:middle;}.td_amministrazione,.td_conf,.td_stiro,.td_tess,.tdcentered{text-align:center;font-weight:400;background:#cecece;color:#000}.tdcentered{border:5px solid #fff}td.rSelectat,td.rSubSelectat{color:#000;background-color:#cecece;vertical-align: middle;}#120 td{background-color:#cecece!important;background:#cecece}td.rSelectat,td.rWeekend{text-align:center!important}*{font-family:Arial!important;vertical-align: middle;text-align:center;}td.principal{height:50px;background:#c23749;color:#ff0}td.secund{padding-left:3px;background:#c23749;color:#fff;font-size:10pt}td.neselectat,td.selectat{font:11px/20px Arial,Helvetica,sans-serif;cursor:pointer}td.selectat{background-color:#ffbe57;border-top:solid 1px #aa347a;border-bottom:solid 1px #aa347a;color:#9a246a}td.neselectat{border-top:solid 1px #f9f9f9;border-bottom:solid 1px #f9f9f9;color:#294460}td.rSelectat{color:#000;border:1px solid #fff;font-weight:400;font-size:10pt;height:40px;vertical-align:middle;text-align:center;}table#tAbsenteOre,table#tAbsenteProcent{border:none!important}td.rWeekend{background-color:#d0d0d0;color:#9a246a;font:11px/20px Arial,Helvetica,sans-serif;border:1px solid #fff;font-weight:400}td.rSubSelectat{background-color:#cecece;color:#000;border:1px solid #fff;border:1px solid #fff;text-align:center;font-size:10pt;font-weight:400}td.rNeselectat,td.rSecund{text-align:center;border:1px solid #fff;color:#000;font-weight:400;}td.rNeselectat{background-color:#e8e8e8;text-align:center!important;letter-spacing:.5px}td.rSecund{background:#FFC107;font-size:9pt;text-align:center}td.rSecundLarge{background:url(../Images/Image/bg_secund_large.png) left top repeat-x;border:1px solid #fff}td.celula{border-width:1px;border-style:solid;border-color:#96A7BA}td.rAntet,td.rAntetSecund{background-color:#FFC107;color:#000;font:11px/20px Arial,Helvetica,sans-serif;border:1px solid #fff}td.rAntet{font-weight:400;text-align:center;padding-left:10px;padding-right:10px}td.rAntetSecund{font-weight:400;padding-left:5px;text-align:center}td.rAntetSecundAlb,td.rAntetSecundGalben{font:11px/20px Arial,Helvetica,sans-serif;border:1px solid #fff;text-align:center}td.rAntetSecundGalben{background-color:#f7ef5b;color:#294460;font-weight:400}td.rAntetSecundAlb{background-color:#e2e2e2;color:#000;font-weight:400}td.rAntetSecundRosu{background-color:red;font:11px/20px Arial,Helvetica,sans-serif;color:#fff;border:1px solid #fff;font-weight:400;text-align:center}#Categorie_120{color:#000;background-color:#ffc107}td.rSecund{font-size:16px;}.tot{text-align:center;vertical-align:middle;background-color:#d0d0d0;}</style></head><h4>Report Assenteismo Departament - " + $('#tbFiltruDepartament').val() +" - Anno: " + $('#ddlFiltruAn').val() + " - Mese: " + $('#ddlFiltruLuna').val() + "</h4><table border='1px'><tr border='1px'>";
    var j = 0;

    for (j = 0; j < myClone.rows.length; j++) {
        myClone.rows[j].cells.item(0).style.width = '200px';
        myClone.rows[j].cells.item(1).style.width = '250px';
        myClone.rows[j].cells.item(2).remove();
        for (i = 0; i < myClone.rows[j].cells.length; i++) {

            myClone.rows[0].cells.item(i).style.background = "#FFC107";
            myClone.rows[0].cells.item(i).style.textAlign = "center";
            myClone.rows[0].cells.item(i).style.border = "1px solid #ffffff";

            myClone.rows[1].cells.item(i).style.background = "#d0d0d0";
            myClone.rows[1].cells.item(i).style.textAlign = "center";
            myClone.rows[1].cells.item(i).style.border = "1px solid #ffffff";

            myClone.rows[j].cells.item(myClone.rows[j].cells.length - 1).style.background = "#e8e8e8";
            myClone.rows[j].cells.item(myClone.rows[j].cells.length - 1).style.textAlign = "center";
            myClone.rows[j].cells.item(myClone.rows[j].cells.length - 1).style.border = "1px solid #ffffff";
        }

        tab_text = tab_text + myClone.rows[j].innerHTML + "</tr></br></br>";
    }

    tab_text = tab_text + "</table></html>";
    tab_text = tab_text.replace(/<A[^>]*>|<\/A>/g, "");
    tab_text = tab_text.replace(/<img[^>]*>/gi, "");
    tab_text = tab_text.replace(/<input[^>]*>|<\/input>/gi, "");

    var ua = window.navigator.userAgent;
    var msie = ua.indexOf("MSIE ");

    if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./)) {
        txtArea1.document.open("txt/html", "replace");
        txtArea1.document.write(tab_text);
        txtArea1.document.close();
        txtArea1.focus();
        sa = txtArea1.document.execCommand("SaveAs", true, "Say Thanks to Sumit.xls");
    }
    else
        sa = window.open('data:application/vnd.ms-excel,' + encodeURIComponent(tab_text));

    myClone.remove();
    return (sa);
}

function printData() {
 

    $("#printing-holder").append("<div id='imaginary-friend'></div>");


    $('#tAbsenteDepartamentOre').clone().appendTo("#imaginary-friend");
    $("#imaginary-friend").append('<br/>');

    $('#imaginary-friend').css('zoom', '0.7');
    $('#imaginary-friend').printThis({
        header: "<h1>Assenteismo Departament - Anno: " + $('#ddlFiltruAn').val() + " - Mese: " + $('#ddlFiltruLuna').val() +"</h1>",
        pageTitle: "",
        importCSS: true,
        ImportStyle: true,
        copyTagClasses: true,
        loadCSS: "Css/StyleSheet.css"
    });
    $("#imaginary-friend").remove();
}

function printPDF() {
 
  

    var pdf = new jsPDF('l', 'mm', [1400, 1920],false);
    html2canvas($("#tAbsenteDepartamentOre")[0], {
        onrendered: function (canvas) {
            document.body.appendChild(canvas);
            var ctx = canvas.getContext('2d');
            var imgData = canvas.toDataURL("image/png", 1.0);
            pdf.addImage(imgData, 'PNG', 20, 20, $("#tAbsenteDepartamentOre").width() * 0.75, $("#tAbsenteDepartamentOre").height() * 0.75);
            canvas.remove();
        }
    });
    setTimeout(function () { 
        pdf.save('Report Assenteismo Departament.pdf');
     }, 0);
}


function Proprietati()
{}

function SucceededCallback(result, userContext, methodName) {
    $get('up').style.display = 'none';
    switch (methodName) {
        case ("RaportAbsenteDepartamentLista"):
            {
                if (result.Eroare !== '') {
                    window.alert(result.Eroare);
                    return;
                }

                //PEKI CODE
                AfisareAbsenteDepartament("tAbsenteDepartamentOre", result.TabelaAbsenteDepartamentOre.sort(function (a, b) {
                    if (parseFloat(a.Total) > parseFloat(b.Total)) return -1;
                    if (parseFloat(a.Total) < parseFloat(b.Total)) return 1;
                    return 0;
                }), result.NumarZile);
                //END PEKI CODE
                break;
            }
        case ("RaportAbsenteDepartamentExcel"):
            {
                if (result.Eroare !== '') {
                    window.alert(result.Eroare);
                    return;
                }
                var xlApp, xlWorkbook, xlSheet;
                xlApp = new ActiveXObject("Excel.Application");
                xlWorkbook = xlApp.Workbooks.Add();
                xlSheet = xlApp.ActiveSheet;

                xlSheet.Columns('A').ColumnWidth = 32;
                xlSheet.Columns('B').ColumnWidth = 8;
                xlSheet.Columns('C').ColumnWidth = 8;
                xlSheet.Columns('D').ColumnWidth = 8;
                xlSheet.Columns('E').ColumnWidth = 8;
                xlSheet.Columns('F').ColumnWidth = 8;
                xlSheet.Columns('G').ColumnWidth = 8;
                xlSheet.Columns('H').ColumnWidth = 8;
                xlSheet.Columns('I').ColumnWidth = 8;
                xlSheet.Columns('J').ColumnWidth = 8;
                xlSheet.Columns('K').ColumnWidth = 8;
                xlSheet.Columns('L').ColumnWidth = 8;
                xlSheet.Columns('M').ColumnWidth = 8;
                xlSheet.Columns('N').ColumnWidth = 8;
                xlSheet.Columns('O').ColumnWidth = 8;

                xlSheet.Cells(2, 2).Value = 'RIEPILOGO MENSILE DEI DIPENDENTI';
                xlSheet.Cells(3, 1).Value = result.An;
                xlSheet.Cells(4, 2).Value = 'Gennaio';
                xlSheet.Cells(4, 3).Value = 'Febbraio';
                xlSheet.Cells(4, 4).Value = 'Marzo';
                xlSheet.Cells(4, 5).Value = 'Aprile';
                xlSheet.Cells(4, 6).Value = 'Maggio';
                xlSheet.Cells(4, 7).Value = 'Giugno';
                xlSheet.Cells(4, 8).Value = 'Luglio';
                xlSheet.Cells(4, 9).Value = 'Agosto';
                xlSheet.Cells(4, 10).Value = 'Settembre';
                xlSheet.Cells(4, 11).Value = 'Ottobre';
                xlSheet.Cells(4, 12).Value = 'Novembre';
                xlSheet.Cells(4, 13).Value = 'Dicembre';
                xlSheet.Cells(4, 15).Value = 'MEDIA';
                var i = 0;
                for (var item in result.Tabela) {
                    if (result.Tabela[item].Departament === 'a tempo determinato')
                    {
                        i = i + 2;
                        xlSheet.Cells(i + 5, 1).Value = 'di cui';
                        i++;
                    }
                    if (result.Tabela[item].Departament === 'TOTALE') {

                        xlSheet.Range('B' + (i + 5).toString() + ':M' + (i + 5).toString()).Interior.ColorIndex = 6;
                        xlSheet.Range('O' + (i + 5).toString()).Interior.ColorIndex = 6;
                        result.Tabela[item].Departament = '';
                    }
                    xlSheet.Cells(i + 5, 1).Value = result.Tabela[item].Departament;
                    xlSheet.Cells(i + 5, 2).Value = result.Tabela[item].Ianuarie;
                    xlSheet.Cells(i + 5, 3).Value = result.Tabela[item].Februarie;
                    xlSheet.Cells(i + 5, 4).Value = result.Tabela[item].Martie;
                    xlSheet.Cells(i + 5, 5).Value = result.Tabela[item].Aprilie;
                    xlSheet.Cells(i + 5, 6).Value = result.Tabela[item].Mai;
                    xlSheet.Cells(i + 5, 7).Value = result.Tabela[item].Iunie;
                    xlSheet.Cells(i + 5, 8).Value = result.Tabela[item].Iulie;
                    xlSheet.Cells(i + 5, 9).Value = result.Tabela[item].August;
                    xlSheet.Cells(i + 5, 10).Value = result.Tabela[item].Septembrie;
                    xlSheet.Cells(i + 5, 11).Value = result.Tabela[item].Octombrie;
                    xlSheet.Cells(i + 5, 12).Value = result.Tabela[item].Noiembrie;
                    xlSheet.Cells(i + 5, 13).Value = result.Tabela[item].Decembrie;
                    xlSheet.Cells(i + 5, 15).Value = result.Tabela[item].Medie;
                    i++;
                }
                xlSheet.Range('A1:O' + (i + 5).toString()).Font.Size = 12;
                xlSheet.Range('A1:O' + (i + 5).toString()).Font.Name = 'Calibri';
                xlSheet.Range('B4:O4').Font.Size = 8;
                if (i > 0) {
                    xlSheet.Range('A5:M' + (i - 1).toString()).Borders.LineStyle = 1;
                    xlSheet.Range('O5:O' + (i - 1).toString()).Borders.LineStyle = 1;
                    xlSheet.Range('B' + (i + 3).toString() + ':M' + (i + 4).toString()).Borders.LineStyle = 1;
                    xlSheet.Range('O' + (i + 3).toString() + ':O' + (i + 4).toString()).Borders.LineStyle = 1;
                }
                xlApp.Visible = true;
                break;
            }
        default:
            {
                window.alert('Serviciu inexistent!');
            }
    }
}
function AfisareAbsenteDepartament(NumeTabela, Tabela, NumarZile) {

    var mytable = $get(NumeTabela);
    mytable.width = 560 + 40 * NumarZile;
    while (mytable.rows.length > 0) {
        mytable.deleteRow(0);
    }
    // adauga antet
    var newrow = mytable.insertRow(-1);
    newrow.id = "hAngajat";
    newrow.className = "persist-header";

    var newcell = newrow.insertCell(-1);
  
    newcell.id = "rDipendente";
    newcell.className = "rSecund";
    newcell.innerHTML = "Dipendente";
    newcell = newrow.insertCell(-1);
    newcell.id = "rMansione";
    newcell.className = "rSecund";
    newcell.innerHTML = "Mansione";
    newcell = newrow.insertCell(-1);
    newcell.className = "blanko";
    newcell.innerHTML = " ";
    newcell = newrow.insertCell(-1);
    newcell.id = "rLinea";
    newcell.className = "rSecund";
    newcell.innerHTML = "Linea";

    var tipZi = [];
    var iAn = $get("ddlFiltruAn").value;
    var iLuna = $get("ddlFiltruLuna").value;
    for (i = 1; i <= NumarZile; i++) {
        newcell = newrow.insertCell(-1);
        newcell.id = "hZiua" + i.toString();
        //HI ZIUA JE DAN U MESECU
        newcell.className = "rSecund rPeki";
        newcell.innerHTML = i;
        var d = new Date(iAn, iLuna-1, i, 0, 0, 0, 0);
        var day = d.getDay();
        if( day === 6 || day === 0)
            tipZi.push(true);
        else
            tipZi.push(false);
    }

    //TOTALE DESNI RED
    newcell = newrow.insertCell(-1);
    newcell.className = "rSecund";
    newcell.innerHTML = "Totale";
    newcell.id = 'rTotale';

    var i = 0;
    var numeClasa = '';
    var array;
    for (var item in Tabela) {
        numeClasa = Tabela[item].NumeClasa;
        newrow = mytable.insertRow(-1);
        ////OVDE SE DODAJU ID'evi Row'a
        newrow.id = i.toString();
        newcell = newrow.insertCell(-1);
        newcell.id = 'Departament_' + i.toString();
        newcell.className = numeClasa;
        newcell.setAttribute("style", "text-align:left!important;");
        newcell.innerHTML = Tabela[item].Angajat;
        
        //newcell.height = 20;
        newcell.width = 154;
        newcell = newrow.insertCell(-1);
        newcell.id = 'PostDeLucru_' + i.toString();
        newcell.className = numeClasa;
        newcell.setAttribute("style", "text-align:left!important;");
        newcell.innerHTML = Tabela[item].PostDeLucru;

        newcell.width = 153;
        newcell = newrow.insertCell(-1);
        newcell.className = "blanko";
        newcell.innerHTML = " ";
        newcell.width = 150;
        newcell = newrow.insertCell(-1);
        newcell.id = 'EchipaLinie_' + i.toString();
        newcell.className = numeClasa;
        newcell.innerHTML =  Tabela[item].EchipaLinie;
        newcell.width = 72;

        for (var secondItem in Tabela[item].ValoriZilnice) {
            newcell = newrow.insertCell(-1);

            newcell.id = 'Categorie_' + i.toString();
            if (tipZi[secondItem]) {
                newcell.className = 'rWeekend';
                newcell.width = 41.3;
            } else {
                newcell.className = numeClasa;
                newcell.width = 41.3;
            }

            if (Tabela[item].ValoriZilnice[secondItem].Ore === "")
                Tabela[item].ValoriZilnice[secondItem].Ore = '';
                newcell.innerHTML = Tabela[item].ValoriZilnice[secondItem].Ore;
        }
        newcell = newrow.insertCell(-1);

        newcell.id = 'Total_' + i.toString();
        newcell.className = numeClasa;
        newcell.className += " totDesno totrdesno";
        //newcell.width = 40;

        newcell.innerHTML = Tabela[item].Total;

        i++;
    }
  
    //Iframe Height for creation tab
    var iframe = window.parent.document.getElementsByClassName("iframe_load");
        $(iframe).prop("style", "height:" + 800 + "px;");
   
    //PEKI CODE
    var table = $('#tAbsenteDepartamentOre');
    var rowToPrepend0 = table.find(".rSelectat").parent();
    table.find('tbody tr:last-child').after(rowToPrepend0);
    rowToPrepend0;


    //MOVE TOTALE TO FIRST ROW
    var wizard = document.getElementById("tAbsenteDepartamentOre");
    var rows = wizard.getElementsByTagName("tr"); 
    var lastRow = rows[rows.length - 1]; 
    lastRow.id = "tot2";
    lastRow.classList.add("persist-header");


    $("#tot2").css('top', '22px');

    var clonedHeaderRow;

    $(".persist-area").each(function () {
        clonedHeaderRow = $(".persist-header", this);
        clonedHeaderRow
            .before(clonedHeaderRow.clone())
            .css("width", clonedHeaderRow.width())
            .addClass("floatingHeader").css('visibility', 'hidden');
    });
 


    $(window).scroll(UpdateTableHeaders).trigger("scroll");

     
    $('#0').insertBefore($('#1'));
    $('#tot2').insertBefore($('#0'));
    $("#tAbsenteDepartamentOre td").wrapInner('<span></span>');


    $('#tAbsenteDepartamentOre tr:nth-last-child(2)').remove();
    $('#tAbsenteDepartamentOre tr:nth-last-child(2)').remove();

    if ($('#ddlFiltruEchipaLinie').val() !== 'ALL') {

        var zadnjired = $('#tAbsenteDepartamentOre tr').length - 5;
        $('#tAbsenteDepartamentOre tr').eq(2).insertBefore($('#' + zadnjired + ''));
    }

    if ($('#ddlFiltruMansione').val() !== 'ALL') {


        var zadnjired = $('#tAbsenteDepartamentOre tr').length - 5;
        $('#tAbsenteDepartamentOre tr').eq(2).insertBefore($('#' + zadnjired + ''));
    }  
}



function FailedCallback(error, userContext, methodName) 
{
    $get('up').style.display = 'none';
    if(error !== null) 
    {
        window.alert(error.get_message());
    }
}
function pageLoad() 
{
    Lista();
} 
if (typeof(Sys) !== "undefined") Sys.Application.notifyScriptLoaded();
