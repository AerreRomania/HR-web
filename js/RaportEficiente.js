// RaportEficiente.js
function Lista() {
    var TipFiltru = 'Luna';
    var FiltruDeLa = '';
    var FiltruPanaLa = '';
    if ($get('ddlFiltru').value == 'Periodo')
    {
        TipFiltru = 'Perioada';
        FiltruDeLa = $get("tbFiltruDeLa").value;
        FiltruPanaLa = $get("tbFiltruPanaLa").value;
    }
    else
    {
        FiltruDeLa = $get("ddlFiltruAn").value;
        FiltruPanaLa = $get("ddlFiltruLuna").value;
    }

    $get('up').style.display = '';
    WbmOlimpias.RaportEficienteWS.RaportEficienteLista(FiltruDeLa, FiltruPanaLa, $get("tbFiltruDepartament").value, $get("ddlOrdonare").value, TipFiltru, SucceededCallback, FailedCallback);
}

function printExcel() {
    var tab_text = "<html><head><style type='text/css'>td.rWeekend{font-size:11px;text-align:center;vertical-align:middle;}td.rSelectat{ background-color: #d0d0d0;text-align:center;vertical-align:middle;}td.rWeekend,td.rNeselectat{height:25px;text-align:center;}.td_amministrazione,.td_conf,.td_stiro,.td_tess,.tdcentered{text-align:center;font-weight:400;background:#cecece;color:#000}.tdcentered{border:5px solid #fff}td.rSelectat,td.rSubSelectat{color:#000;background-color:#cecece;vertical-align: middle;}#120 td{background-color:#cecece!important;background:#cecece}td.rSelectat,td.rWeekend{text-align:center!important}*{font-family:Arial!important;vertical-align: middle;text-align:center;}td.principal{height:50px;background:#c23749;color:#ff0}td.secund{padding-left:3px;background:#c23749;color:#fff;font-size:10pt}td.neselectat,td.selectat{font:11px/20px Arial,Helvetica,sans-serif;cursor:pointer}td.selectat{background-color:#ffbe57;border-top:solid 1px #aa347a;border-bottom:solid 1px #aa347a;color:#9a246a}td.neselectat{border-top:solid 1px #f9f9f9;border-bottom:solid 1px #f9f9f9;color:#294460}td.rSelectat{color:#000;border:1px solid #fff;font-weight:400;font-size:10pt;height:40px;vertical-align:middle;text-align:center;}table#tAbsenteOre,table#tAbsenteProcent{border:none!important}td.rWeekend{background-color:#d0d0d0;color:#9a246a;font:11px/20px Arial,Helvetica,sans-serif;border:1px solid #fff;font-weight:400}td.rSubSelectat{background-color:#cecece;color:#000;border:1px solid #fff;border:1px solid #fff;text-align:center;font-size:10pt;font-weight:400}td.rNeselectat,td.rSecund{text-align:center;border:1px solid #fff;color:#000;font-weight:400;}td.rNeselectat{background-color:#e8e8e8;text-align:center!important;letter-spacing:.5px}td.rSecund{background:#FFC107;font-size:9pt;text-align:center}td.rSecundLarge{background:url(../Images/Image/bg_secund_large.png) left top repeat-x;border:1px solid #fff}td.celula{border-width:1px;border-style:solid;border-color:#96A7BA}td.rAntet,td.rAntetSecund{background-color:#FFC107;color:#000;font:11px/20px Arial,Helvetica,sans-serif;border:1px solid #fff}td.rAntet{font-weight:400;text-align:center;padding-left:10px;padding-right:10px}td.rAntetSecund{font-weight:400;padding-left:5px;text-align:center}td.rAntetSecundAlb,td.rAntetSecundGalben{font:11px/20px Arial,Helvetica,sans-serif;border:1px solid #fff;text-align:center}td.rAntetSecundGalben{background-color:#f7ef5b;color:#294460;font-weight:400}td.rAntetSecundAlb{background-color:#e2e2e2;color:#000;font-weight:400}td.rAntetSecundRosu{background-color:red;font:11px/20px Arial,Helvetica,sans-serif;color:#fff;border:1px solid #fff;font-weight:400;text-align:center}#Categorie_120{color:#000;background-color:#ffc107}td.rSecund{font-size:16px;}.tot{text-align:center;vertical-align:middle;background-color:#d0d0d0;}</style></head><table border='1px'><tr border='1px'>";
    var j = 0;
    tab = document.getElementById('tRaportEficiente'); // id of table

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

    $('#tRaportEficiente').printThis({
        pageTitle: "",
        importCSS: true,
        ImportStyle: true,
        copyTagClasses: true,
        loadCSS: "Css/StyleSheet.css"
    });
}

function printPDF() {
    var pdf = new jsPDF('p', 'pt', [3500,1181]);
    pdf.addHTML($('#tRaportEficiente')[0], function () {
        pdf.save('Efficienza.pdf');
    });
}


function bExcel_Click() {
    var TipFiltru = 'Luna';
    var FiltruDeLa = '';
    var FiltruPanaLa = '';
    if ($get('ddlFiltru').value === 'Periodo') {
        TipFiltru = 'Perioada';
        FiltruDeLa = $get("tbFiltruDeLa").value;
        FiltruPanaLa = $get("tbFiltruPanaLa").value;
    }
    else {
        FiltruDeLa = $get("ddlFiltruAn").value;
        FiltruPanaLa = $get("ddlFiltruLuna").value;
    }

    $get('up').style.display = '';
    WbmOlimpias.RaportEficienteWS.RaportEficienteExcel(FiltruDeLa, FiltruPanaLa, $get("tbFiltruDepartament").value, $get("ddlOrdonare").value, TipFiltru, SucceededCallback, FailedCallback);
}

function Proprietati()
{}

function SucceededCallback(result, userContext, methodName) {
    $get('up').style.display = 'none';
    switch (methodName) {
        case ("RaportEficienteLista"):
            {
                if (result.Eroare !== '') {
                    window.alert(result.Eroare);
                    return;
                }
                if ($get("ddlOrdonare").value === '1')
                    AfisareRaportEficienteLuna(result.TabelaLuna, result.AnLuna);
                else
                    AfisareRaportEficiente(result.Tabela);
                break;
            }
        case ("RaportEficienteExcel"):
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
                    if (result.Tabela[item].A === 'a tempo determinato')
                    {
                        i = i + 2;
                        xlSheet.Cells(i + 5, 1).Value = 'di cui';
                        i++;
                    }
                    if (result.Tabela[item].A === 'TOTALE') {

                        xlSheet.Range('B' + (i + 5).toString() + ':M' + (i + 5).toString()).Interior.ColorIndex = 6;
                        xlSheet.Range('O' + (i + 5).toString()).Interior.ColorIndex = 6;
                        result.Tabela[item].A = '';
                    }
                    xlSheet.Cells(i + 5, 1).Value = result.Tabela[item].A;
                    xlSheet.Cells(i + 5, 2).Value = result.Tabela[item].C;
                    xlSheet.Cells(i + 5, 3).Value = result.Tabela[item].D;
                    xlSheet.Cells(i + 5, 4).Value = result.Tabela[item].E;
                    xlSheet.Cells(i + 5, 5).Value = result.Tabela[item].F;
                    xlSheet.Cells(i + 5, 6).Value = result.Tabela[item].G;
                    xlSheet.Cells(i + 5, 7).Value = result.Tabela[item].H;
                    xlSheet.Cells(i + 5, 8).Value = result.Tabela[item].I;
                    xlSheet.Cells(i + 5, 9).Value = result.Tabela[item].J;
                    xlSheet.Cells(i + 5, 10).Value = result.Tabela[item].K;
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
function AfisareRaportEficiente(Tabela) {
    
    var mytable = $get('tRaportEficiente');
    var currentRow = mytable.rows[0];
    var currentCell = currentRow.cells[0];
    var sTable = '<table id="tRaportEficienteDetalii" style="border: 1px solid #800080; border-collapse: collapse;">';
    sTable = sTable + '<tr>';
    sTable = sTable + '<td class="rAntet">Nr.</td>';
    sTable = sTable + '<td class="rAntet">Cognome</td>';
    sTable = sTable + '<td class="rAntet">Nome</td>';
    sTable = sTable + '<td class="rAntet" width="250">Mansione</td>';


    sTable = sTable + '<td class="rAntet">Linea</td>';
    sTable = sTable + '<td class="rAntet">Data assunzione</td>';
    sTable = sTable + '<td class="rAntet">ore lavorabili</td>';
    sTable = sTable + '<td class="rAntet">ore lavorate</td>';

    sTable = sTable + '<td class="rAntet">ore assenza</td>';
    //sTable = sTable + '<td class="rAntet">gg assenza</td>';
    sTable = sTable + '<td class="rAntet">% assenza</td>';
    sTable = sTable + '<td class="rAntet">% efficienza produttiva</td>';

    sTable = sTable + '</tr>';
    
    for (var item in Tabela) {
        sTable = sTable + '<tr>';
        sTable = sTable + '<td class="rAntetSecundAlb">' + Tabela[item].NrCrt + '</td>';
        sTable = sTable + '<td class="rAntetSecundAlb">' + Tabela[item].Nume + '</td>';
        sTable = sTable + '<td class="rAntetSecundAlb">' + Tabela[item].Prenume + '</td>';
        sTable = sTable + '<td class="rAntetSecundAlb">' + Tabela[item].PostDeLucru + '</td>';
        sTable = sTable + '<td class="rAntetSecundAlb">' + Tabela[item].LinieEchipa + '</td>';
        sTable = sTable + '<td class="rAntetSecundAlb">' + Tabela[item].DataAngajarii + '</td>';
        sTable = sTable + '<td class="rAntetSecundAlb" align="right">' + Tabela[item].OreLucratoare + '</td>';
        sTable = sTable + '<td class="rAntetSecundAlb" align="right">' + Tabela[item].OreLucrate + '</td>';
        sTable = sTable + '<td class="rAntetSecundAlb" align="right">' + Tabela[item].OreAbsente + '</td>';
        //sTable = sTable + '<td class="rAntetSecundAlb" align="right">' + Tabela[item].OreAbsenteNemotivate + '</td>';
        sTable = sTable + '<td class="rAntetSecundAlb" align="right">' + Tabela[item].ProcentAbsenteLucratoare + '</td>';
        sTable = sTable + '<td class="rAntetSecundAlb" align="right">' + Tabela[item].Eficienta + '</td>';
        sTable = sTable + '</tr>';
    }
    sTable = sTable + '</table>';
    currentCell.style.verticalAlign = "top"
    currentCell.innerHTML = sTable;
}

function AfisareRaportEficienteLuna(Tabela, AnLunaList) {
    var mytable = $get('tRaportEficiente');
    var currentRow = mytable.rows[0];
    var currentCell = currentRow.cells[0];
    var sTable = '<table id="tRaportEficienteDetalii" style="border: 1px solid #800080; border-collapse: collapse;">';
    sTable = sTable + '<tr>';
    sTable = sTable + '<td class="rAntet">Nr.</td>';
    sTable = sTable + '<td class="rAntet">Cognome</td>';
    sTable = sTable + '<td class="rAntet">Nome</td>';
    sTable = sTable + '<td class="rAntet" width="250">Mansione</td>';
    sTable = sTable + '<td class="rAntet">Linea</td>';
    sTable = sTable + '<td class="rAntet">Data assunzione</td>';
    for (var item in AnLunaList) {
        sTable = sTable + '<td class="rAntet" width="70">' + AnLunaList[item] + '</td>';
    }
    sTable = sTable + '</tr>';

    for (var item in Tabela) {
        sTable = sTable + '<tr>';
        sTable = sTable + '<td class="rAntetSecundAlb">' + Tabela[item].NrCrt + '</td>';
        sTable = sTable + '<td class="rAntetSecundAlb">' + Tabela[item].Nume + '</td>';
        sTable = sTable + '<td class="rAntetSecundAlb">' + Tabela[item].Prenume + '</td>';
        sTable = sTable + '<td class="rAntetSecundAlb">' + Tabela[item].PostDeLucru + '</td>';
        sTable = sTable + '<td class="rAntetSecundAlb">' + Tabela[item].LinieEchipa + '</td>';
        sTable = sTable + '<td class="rAntetSecundAlb">' + Tabela[item].DataAngajarii + '</td>';
        for (var itemEficienta in Tabela[item].Eficiente) {
            sTable = sTable + '<td class="rAntetSecundAlb" align="right">' + Tabela[item].Eficiente[itemEficienta] + '</td>';
        }
        sTable = sTable + '</tr>';
    }
    sTable = sTable + '</table>';
    currentCell.style.verticalAlign = "top"
    currentCell.innerHTML = sTable;
}
function FailedCallback(error, userContext, methodName) 
{
    $get('up').style.display = 'none';
    if(error !== null) 
    {
        window.alert(error.get_message());
    }
}
function AfisareFiltru()
{
    if ($get('ddlFiltru').value === 'Periodo') {
        $get('tLuna').style.display = 'none';
        $get('tPerioada').style.display = 'table';
    }
    else {
        $get('tLuna').style.display = 'table';
        $get('tPerioada').style.display = 'none';
    }
}
function pageLoad() 
{
    $('#tbFiltruDeLa').datepicker({
        showOn: "button",
        buttonImage: "Images/Image/calendar.gif",
        buttonImageOnly: true,
        dateFormat: 'dd.mm.yy',
        onSelect: function () {
            Lista();
        }
    });
    $('#tbFiltruPanaLa').datepicker({
        showOn: "button",
        buttonImage: "Images/Image/calendar.gif",
        buttonImageOnly: true,
        dateFormat: 'dd.mm.yy',
        onSelect: function () {
            Lista();
        }

    });
    AfisareFiltru();
    Lista();
} 
if (typeof(Sys) !== "undefined") Sys.Application.notifyScriptLoaded();
