// RaportSuplimentare.js
function Lista()  
{
    $get('up').style.display = '';
    WbmOlimpias.RaportSuplimentareWS.RaportSuplimentareLista($get("ddlFiltruAn").value, SucceededCallback, FailedCallback);

    setTimeout(drawCharts, 5000);


}


function printExcel() {


    var tab_text = "<html><head><style type='text/css'>.td_amministrazione,.td_conf,.td_stiro,.td_tess,.tdcentered{text-align:center;font-weight:400;background:#cecece;color:#000}.tdcentered{border:5px solid #fff}td.rSelectat,td.rSubSelectat{color:#000;background-color:#cecece;vertical-align: middle;}#120 td{background-color:#cecece!important;background:#cecece}td.rSelectat,td.rWeekend{text-align:center!important}*{font-family:Arial!important;vertical-align: middle;text-align:center;}td.principal{height:50px;background:#c23749;color:#ff0}td.secund{padding-left:3px;background:#c23749;color:#fff;font-size:10pt}td.neselectat,td.selectat{font:11px/20px Arial,Helvetica,sans-serif;cursor:pointer}td.selectat{background-color:#ffbe57;border-top:solid 1px #aa347a;border-bottom:solid 1px #aa347a;color:#9a246a}td.neselectat{border-top:solid 1px #f9f9f9;border-bottom:solid 1px #f9f9f9;color:#294460}td.rSelectat{color:#000;border:1px solid #fff;font-weight:400;font-size:12pt;height:40px;vertical-align:middle;text-align:center;}table#tAbsenteOre,table#tAbsenteProcent{border:none!important}td.rWeekend{background-color:#d0d0d0;color:#9a246a;font:11px/20px Arial,Helvetica,sans-serif;border:1px solid #fff;font-weight:400}td.rSubSelectat{background-color:#cecece;color:#000;border:1px solid #fff;border:1px solid #fff;text-align:center;font-size:10pt;font-weight:400}td.rNeselectat,td.rSecund{text-align:center;border:1px solid #fff;color:#000;font-weight:400;}td.rNeselectat{background-color:#e8e8e8;text-align:center!important;letter-spacing:.5px}td.rSecund{background:#FFC107;font-size:9pt;text-align:center}td.rSecundLarge{background:url(../Images/Image/bg_secund_large.png) left top repeat-x;border:1px solid #fff}td.celula{border-width:1px;border-style:solid;border-color:#96A7BA}td.rAntet,td.rAntetSecund{background-color:#FFC107;color:#000;font:11px/20px Arial,Helvetica,sans-serif;border:1px solid #fff}td.rAntet{font-weight:400;text-align:center;padding-left:10px;padding-right:10px}td.rAntetSecund{font-weight:400;padding-left:5px;text-align:center}td.rAntetSecundAlb,td.rAntetSecundGalben{font:11px/20px Arial,Helvetica,sans-serif;border:1px solid #fff;text-align:center}td.rAntetSecundGalben{background-color:#f7ef5b;color:#294460;font-weight:400}td.rAntetSecundAlb{background-color:#e2e2e2;color:#000;font-weight:400}td.rAntetSecundRosu{background-color:red;font:11px/20px Arial,Helvetica,sans-serif;color:#fff;border:1px solid #fff;font-weight:400;text-align:center}#Categorie_120{color:#000;background-color:#ffc107}td.rSecund{font-size:16px;}</style></head><table border='1px'><h3>Straordinario Generale - Anno: " + $('#ddlFiltruAn').val(); +"</h3><tr border='1px'>";
    var j = 0;
    tab = document.getElementById('tSuplimentareOre'); // id of table

    for (j = 0; j < tab.rows.length; j++) {
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
    //$('td.principal').hide();
    $('#tSuplimentareOre, #bar-chart').printThis({
        header: "<h1>STRAORDINARIO GENERALE - Anno: " + $('#ddlFiltruAn').val() +"</h1>",
        pageTitle: "",
        importCSS: true,
        ImportStyle: true,
        copyTagClasses: true,
        loadCSS: "Css/StyleSheet.css"
    });
    //setTimeout();
 

}



function printPDF() {
    var pdf = new jsPDF('l', 'pt', [600, 1354]);
    $('#hexport').css('display', 'block');
    $('#hexport').text('STRAORDINARIO GENERALE - Anno: ' + $('#ddlFiltruAn').val() + '');

    pdf.addHTML($('#idExport')[0], function () {
        pdf.save('Straordinario Generale.pdf');
        $('#hexport').css('display', 'none');
    });
}




function bExcel_Click() {
    $get('up').style.display = '';
    WbmOlimpias.RaportSuplimentareWS.RaportSuplimentareExcel($get("ddlFiltruAn").value, SucceededCallback, FailedCallback);
    drawCharts();

}

function Proprietati()
{}

function SucceededCallback(result, userContext, methodName) {
    $get('up').style.display = 'none';
    switch (methodName) {
        case ("RaportSuplimentareLista"):
            {
                if (result.Eroare !== '') {
                    window.alert(result.Eroare);
                    return;
                }
                AfisareSuplimentare("tSuplimentareOre", result.TabelaSuplimentareOre);
                break;
            }
        case ("RaportSuplimentareExcel"):
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
function AfisareSuplimentare(NumeTabela,Tabela) {
    
    var mytable = $get(NumeTabela);
    while (mytable.rows.length > 1) {
        mytable.deleteRow(1);
    }
    var i = 100;
    var numeClasa = '';
    for (var item in Tabela) {
        numeClasa = Tabela[item].NumeClasa;
        var newrow = mytable.insertRow(-1);
        newrow.id = i.toString();
        var newcell = newrow.insertCell(-1);
        if (Tabela[item].Departament !== '') {
            newcell.id = 'Departament_' + i.toString();
            newcell.colSpan = 15;
            newcell.className = 'rSubSelectat';
            newcell.style.textAlign = 'left';
            newcell.innerHTML =   Tabela[item].Departament;
            newcell.title = Tabela[item].Departament;
            i++;
            newrow = mytable.insertRow(-1);
            newcell = newrow.insertCell(-1);
            Tabela[item].Departament = '';
        }
        newcell.id = 'Departament_' + i.toString();
        newcell.width = 50;
        newcell.className = numeClasa;
        newcell.innerHTML =   Tabela[item].Departament;
        newcell.title = Tabela[item].Departament;
        newcell = newrow.insertCell(-1);
        newcell.id = 'Categorie_' + i.toString();
        newcell.className = numeClasa;
        newcell.innerHTML =   Tabela[item].Categorie;
        newcell.title = Tabela[item].Categorie;
        newcell = newrow.insertCell(-1);
        newcell.id = 'Ianuarie_' + i.toString();
         
        newcell.className = numeClasa;
        newcell.innerHTML =   Tabela[item].Ianuarie;
        newcell.title = Tabela[item].Ianuarie;
        newcell = newrow.insertCell(-1);
        newcell.id = 'Februarie_' + i.toString();
         
        newcell.className = numeClasa;
        newcell.innerHTML =   Tabela[item].Februarie;
        newcell.title = Tabela[item].Februarie;
        newcell = newrow.insertCell(-1);
        newcell.id = 'Martie_' + i.toString();
         
        newcell.className = numeClasa;
        newcell.innerHTML =   Tabela[item].Martie;
        newcell.title = Tabela[item].Martie;
        newcell = newrow.insertCell(-1);
        newcell.id = 'Aprilie_' + i.toString();
         
        newcell.className = numeClasa;
        newcell.innerHTML =   Tabela[item].Aprilie;
        newcell.title = Tabela[item].Aprilie;
        newcell = newrow.insertCell(-1);
        newcell.id = 'Mai_' + i.toString();
         
        newcell.className = numeClasa;
        newcell.innerHTML =   Tabela[item].Mai;
        newcell.title = Tabela[item].Mai;
        newcell = newrow.insertCell(-1);
        newcell.id = 'Iunie_' + i.toString();
         
        newcell.className = numeClasa;
        newcell.innerHTML =   Tabela[item].Iunie;
        newcell.title = Tabela[item].Iunie;
        newcell = newrow.insertCell(-1);
        newcell.id = 'Iulie_' + i.toString();
         
        newcell.className = numeClasa;
        newcell.innerHTML =   Tabela[item].Iulie;
        newcell.title = Tabela[item].Iulie;
        newcell = newrow.insertCell(-1);
        newcell.id = 'August_' + i.toString();
         
        newcell.className = numeClasa;
        newcell.innerHTML =   Tabela[item].August;
        newcell.title = Tabela[item].August;
        newcell = newrow.insertCell(-1);
        newcell.id = 'Septembrie_' + i.toString();
         
        newcell.className = numeClasa;
        newcell.innerHTML =   Tabela[item].Septembrie;
        newcell.title = Tabela[item].Septembrie;
        newcell = newrow.insertCell(-1);
        newcell.id = 'Octombrie_' + i.toString();
         
        newcell.className = numeClasa;
        newcell.innerHTML =   Tabela[item].Octombrie;
        newcell.title = Tabela[item].Octombrie;
        newcell = newrow.insertCell(-1);
        newcell.id = 'Noiembrie_' + i.toString();
         
        newcell.className = numeClasa;
        newcell.innerHTML =   Tabela[item].Noiembrie;
        newcell.title = Tabela[item].Noiembrie;
        newcell = newrow.insertCell(-1);
        newcell.id = 'Decembrie_' + i.toString();
         
        newcell.className = numeClasa;
        newcell.innerHTML =   Tabela[item].Decembrie;
        newcell.title = Tabela[item].Decembrie;
        newcell = newrow.insertCell(-1);
        newcell.id = 'Medie_' + i.toString();
         
        newcell.className = numeClasa;
        newcell.innerHTML =   Tabela[item].Medie;
        newcell.title = Tabela[item].Medie;
        i++;
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
    //drawCharts();

} 
if (typeof(Sys) !== "undefined") Sys.Application.notifyScriptLoaded();
