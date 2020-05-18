function Lista()  
{
    $get('up').style.display = '';
    WbmOlimpias.RaportAbsenteGiornalieroWS.RaportAbsenteDepartamentLista($get("ddlFiltruAn").value, $get("ddlFiltruLuna").value, SucceededCallback, FailedCallback);
 }

function bExcel_Click() {
    $get('up').style.display = '';
    WbmOlimpias.RaportAbsenteGiornalieroWS.RaportAbsenteDepartamentExcel($get("ddlFiltruAn").value,$get("ddlFiltruLuna").value, SucceededCallback, FailedCallback);
}

function printExcel() {
 
    var tab_text = "<html><head><style type='text/css'>*{font-family:Arial!important;vertical-align:middle;text-align:center}.peki{font-weight:600;font-size:10pt;border-top:5px solid #fff}.blanko{width:5px!important;border:none!important}td.rWeekend{font-size:11px;text-align:center;vertical-align:middle}td.rSelectat{background-color:#d0d0d0;text-align:center;vertical-align:middle}td.rSelectat{color:#000;border:1px solid #fff;font-weight:400;font-size:10pt;height:40px;vertical-align:middle;text-align:center}td.rSelectat,td.rSubSelectat{color:#000;background-color:#cecece;vertical-align:middle}td.rNeselectat,td.rWeekend{height:25px;text-align:center!important}.td_amministrazione,.td_conf,.td_stiro,.td_tess,.tdcentered{text-align:center;font-weight:400;background:#cecece;color:#000}.tdcentered{border:5px solid #fff}#120 td{background-color:#cecece!important;background:#cecece}td.principal{height:50px;background:#c23749;color:#ff0}td.secund{padding-left:3px;background:#c23749;color:#fff;font-size:10pt}td.neselectat,td.selectat{font:11px/20px Arial,Helvetica,sans-serif}td.selectat{background-color:#ffbe57;border-top:solid 1px #aa347a;border-bottom:solid 1px #aa347a;color:#9a246a}td.neselectat{border-top:solid 1px #f9f9f9;border-bottom:solid 1px #f9f9f9;color:#294460}table#tAbsenteOre,table#tAbsenteProcent{border:none!important}td.rWeekend{background-color:#d0d0d0;color:#9a246a;font:11px/20px Arial,Helvetica,sans-serif;border:1px solid #fff;font-weight:400}td.rSubSelectat{background-color:#cecece;color:#000;border:1px solid #fff;border:1px solid #fff;text-align:center;font-size:10pt;font-weight:400}td.rSecund{vertical-align:middle;text-align:center;color:#fff;font-weight:400;}td.rNeselectat{background-color:#e8e8e8;text-align:center!important;letter-spacing:.5px;vertical-aling:middle;}td.rSecund{color:black;font-size:16px;vertical-align:middle;font-size:9pt;text-align:center}td.rPeki{background:#ffc107!important;font-size:9pt;text-align:center}td.celula{border-width:1px;border-style:solid;border-color:#96a7ba}td.rAntet,td.rAntetSecund{background-color:#ffc107;color:#000;border:1px solid #fff}td.rAntet{font-weight:400;text-align:center;padding-left:10px;padding-right:10px}td.rAntetSecund{font-weight:400;padding-left:5px;text-align:center}td.rAntetSecundAlb,td.rAntetSecundGalben{font:11px/20px Arial,Helvetica,sans-serif;border:1px solid #fff;text-align:center}td.rAntetSecundGalben{background-color:#f7ef5b;color:#294460;font-weight:400}td.rAntetSecundAlb{background-color:#e2e2e2;color:#000;font-weight:400}td.rAntetSecundRosu{background-color:red;font:11px/20px Arial,Helvetica,sans-serif;color:#fff;border:1px solid #fff;font-weight:400;text-align:center}#Categorie_120{color:#000;background-color:#ffc107}.tot{text-align:center;vertical-align:middle;background-color:#d0d0d0;}td{text-aling:left!important;vertical-align:middle!important;padding:0px!important;margin:0px!important;left:0px!important;}</style></head><table border='1px'><h3 style='padding-left:10px'>ASSENTEISMO GIORNALIERO - Anno: " + $('#ddlFiltruAn').val() + " - Mese: " + $('#ddlFiltruLuna option:selected').text() + "</h3><tr border='1px'>";
    var j = 0;
    tab = document.getElementById('tAbsenteDepartamentOre'); // id of table

    for (j = 0; j < tab.rows.length - 1; j++) {
        tab_text = tab_text + tab.rows[j].innerHTML + "</tr></br></br>";
    }

    tab_text = tab_text + "</table></html>";
    tab_text = tab_text.replace(/<A[^>]*>|<\/A>/g, "");//remove if u want links in your table
    tab_text = tab_text.replace(/<img[^>]*>/gi, ""); // remove if u want images in your table
    tab_text = tab_text.replace(/<input[^>]*>|<\/input>/gi, ""); // reomves input params

    var ua = window.navigator.userAgent;
    var msie = ua.indexOf("MSIE ");

    if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./))      // If Internet Explorer
    {
        txtArea1.document.open("txt/html", "replace");
        txtArea1.document.write(tab_text);
        txtArea1.document.close();
        txtArea1.focus();
        sa = txtArea1.document.execCommand("SaveAs", true, "Say Thanks to Sumit.xls");
    }
    else                 //other browser not tested on IE 11
        sa = window.open('data:application/vnd.ms-excel,' + encodeURIComponent(tab_text));

    return (sa);
}

function printData() {
    $('#35').hide();
    $('#tAbsenteDepartamentOre').css('zoom', '80%');
    $('#tAbsenteDepartamentOre').printThis({
        header: "<h1>ASSENTEISMO GIORNALIERO  - Anno: " + $('#ddlFiltruAn').val() + " - Mese: " + $('#ddlFiltruLuna option:selected').text() + "</h1>",
        pageTitle: "",
        importCSS: true,
        ImportStyle: true,
        copyTagClasses: true,
        loadCSS: "Css/Absente-Giornaliero-Print.css"
    });
    $('#tAbsenteDepartamentOre').css('zoom', '85%');
}

function printPDF() {
    var pdf = new jsPDF('p', 'pt', 'letter');

    $('#hexport').css('display', 'block');
    $('#hexport').text('ASSENTEISMO GIORNALIERO - Anno: ' + $('#ddlFiltruAn').val() + ' - Mese: ' + $('#ddlFiltruLuna option:selected').text() + '');
    $('#tAbsenteDepartamentOre').css('width', '1700px');
    $('#tAbsenteDepartamentOre').css('zoom', '100%');

    pdf.addHTML($('#tblforexport')[0], function () {
        pdf.save('Assenteismo Giornaliero.pdf');
        $('#hexport').css('display', 'none');
        $('#tAbsenteDepartamentOre').css('zoom', '85%');
    }); 
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
                AfisareAbsenteDepartament("tAbsenteDepartamentOre", result.TabelaAbsenteDepartamentOre , result.NumarZile);
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
    var newcell = newrow.insertCell(-1);
    newcell.id = "rDipendente";
    newcell.className = "rSecund";
    newcell.innerHTML = "Reparto:";
    newcell = newrow.insertCell(-1);
    newcell.id = "rMansione";
    newcell.className = "rSecund";
    newcell.innerHTML = "Tipori Ora:";
    newcell = newrow.insertCell(-1);
    newcell.className = "blanko";
    newcell.innerHTML = " ";

    //KREIRANJE DATUMA
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
    //BLANKO RED
    newcell = newrow.insertCell(-1);
    newcell.className = "blanko";
    newcell.innerHTML = " ";
    //TOTALE DESNI RED
    newcell = newrow.insertCell(-1);
    newcell.className = "rSecund";
    newcell.innerHTML = "Totale";
    newcell.id = 'rTotale';
    var i = 0;
    var y = 0;
    var numeClasa = '';
    //POPUNJAVANJE TABELE

    //Tabela[item].ValoriZilnice
    for (var secondItem in Tabela[item].ValoriZilnice) {
        numeClasa = Tabela[item].NumeClasa;
        newrow = mytable.insertRow(-1);
        newrow.id = i.toString();
        newcell = newrow.insertCell(-1);
        newcell.innerHTML = Tabela[item].ValoriZilnice[secondItem].Ore;
    }



    for (var item in Tabela) {

  


        numeClasa = Tabela[item].NumeClasa;
        newrow = mytable.insertRow(-1);
        ////OVDE SE DODAJU ID'evi Row'a
        newrow.id = i.toString();
        newcell = newrow.insertCell(-1);

        if (Tabela[item].Departament !== '') {
            newcell.id = 'Departament_' + i.toString();
            newcell.rowSpan = 5;
            newcell.className = 'rSubSelectat';
            newcell.innerHTML = Tabela[item].Departament;
            newcell.title = Tabela[item].Departament;
            //newrow = mytable.insertRow(-1);
            newcell = newrow.insertCell(-1);
            i++;
        }

        newcell.id = 'PostDeLucru_' + i.toString();
        newcell.className = numeClasa;
        newcell.innerHTML = Tabela[item].Categorie;


        if (Tabela[item].Categorie === '') {
            newrow.className = 'peki';
            newcell.innerHTML = 'TOTALE ORE';
            newcell.colSpan = 2;
            newcell.rowSpan = 1; 
        }

        newcell.width = 153;
        newcell = newrow.insertCell(-1);
        newcell.className = "blanko";
        newcell.innerHTML = " ";
        newcell.width = 150;

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

            //if (Tabela[item].ValoriZilnice[secondItem].Ore === "")
                //Tabela[item].ValoriZilnice[secondItem].Ore = '';
                newcell.innerHTML = Tabela[item].ValoriZilnice[secondItem].Ore;
        }

        newcell = newrow.insertCell(-1);
        newcell.className = "blanko";
        newcell.innerHTML = " ";

        newcell = newrow.insertCell(-1);

        newcell.id = 'Total_' + i.toString();
        newcell.className = numeClasa;
        newcell.className += " totDesno";
        newcell.innerHTML = Tabela[item].Total;
 
        i++;
    }
    //NULE HIDUJE
    $(".rNeselectat").each(function () {
        var title = $(this).html().replace(/,/g, 'abc').replace(/\./g, ',').replace(/abc/g, '.');
        var html = $(this).html().replace(/,/g, 'abc').replace(/\./g, ',').replace(/abc/g, '.');
        $(this).attr('title', title);
        $(this).html(html);


        if ($(this).attr('title') === '0.0') {
            $(this).text('');
            console.log('odje1');
        } 
    });
    $(".rWeekend").each(function () {
        var title = $(this).html().replace(/,/g, 'abc').replace(/\./g, ',').replace(/abc/g, '.');
        var html = $(this).html().replace(/,/g, 'abc').replace(/\./g, ',').replace(/abc/g, '.');
        $(this).attr('title', title);
        $(this).html(html);

        if ($(this).attr('title') === '0.0') {
            $(this).text('');
            console.log('odje2');
        } 
    });
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
