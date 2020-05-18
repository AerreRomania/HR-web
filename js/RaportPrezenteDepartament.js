// RaportPrezenteDepartament.js
var TabelePeUnRand = 3;





function Lista()  
{
    $get('up').style.display = '';

    if ($get("tbFiltruDepartament").value === "STIRO") {
        console.log('stiro');
        TabelePeUnRand = 3;
    }

    if ($get("tbFiltruDepartament").value === "TESSITURA") {
        console.log('tessitura');
        TabelePeUnRand = 4;
    }

    if ($get("tbFiltruDepartament").value === "CONFEZIONE A") {
        console.log('confa');
        TabelePeUnRand = 4;
        $('#tblPrezenze').css('zoom', '0.95');
        //    zoom: 0.95;
    }

    if ($get("tbFiltruDepartament").value === "CONFEZIONE B") {
        console.log('confb');
        TabelePeUnRand = 4;
        $('#tblPrezenze').css('zoom', '0.95');

    }
    //$('#tbl_header').css('width','100vw');

    WbmOlimpias.RaportPrezenteDepartamentWS.RaportPrezenteDepartamentLista($get("tbFiltruData").value, $get("tbFiltruDepartament").value, SucceededCallback, FailedCallback);


}

function bExcel_Click() {
    $get('up').style.display = '';
    WbmOlimpias.RaportPrezenteDepartamentWS.RaportPrezenteDepartamentExcel($get("tbFiltruData").value, $get("tbFiltruDepartament").value, SucceededCallback, FailedCallback);
    $("#tPrezenteDepartament td").wrapInner('<span></span>');

}


function printExcel() {
    var tab_text = "<html><head><style type='text/css'>body{background-color:white;}td.rWeekend{font-size:11px;text-align:center;vertical-align:middle;}td.rSelectat{ background-color: #d0d0d0;text-align:center;vertical-align:middle;}td.rWeekend,td.rNeselectat{height:25px;text-align:center;}.td_amministrazione,.td_conf,.td_stiro,.td_tess,.tdcentered{text-align:center;font-weight:400;background:#cecece;color:#000}.tdcentered{border:5px solid #fff}td.rSelectat,td.rSubSelectat{color:#000;background-color:#cecece;vertical-align: middle;}#120 td{background-color:#cecece!important;background:#cecece}td.rSelectat,td.rWeekend{text-align:center!important}*{font-family:Arial!important;vertical-align: middle;text-align:center;}td.principal{height:50px;background:#c23749;color:#ff0}td.secund{padding-left:3px;background:#c23749;color:#fff;font-size:10pt}td.neselectat,td.selectat{font:11px/20px Arial,Helvetica,sans-serif;cursor:pointer}td.selectat{background-color:#ffbe57;border-top:solid 1px #aa347a;border-bottom:solid 1px #aa347a;color:#9a246a}td.neselectat{border-top:solid 1px #f9f9f9;border-bottom:solid 1px #f9f9f9;color:#294460}td.rSelectat{color:#000;border:1px solid #fff;font-weight:400;font-size:10pt;height:40px;vertical-align:middle;text-align:center;}table#tAbsenteOre,table#tAbsenteProcent{border:none!important}td.rWeekend{background-color:#d0d0d0;color:#9a246a;font:11px/20px Arial,Helvetica,sans-serif;border:1px solid #fff;font-weight:400}td.rSubSelectat{background-color:#cecece;color:#000;border:1px solid #fff;border:1px solid #fff;text-align:center;font-size:10pt;font-weight:400}td.rNeselectat,td.rSecund{text-align:center;border:1px solid #fff;color:#000;font-weight:400;}td.rNeselectat{background-color:#e8e8e8;text-align:center!important;letter-spacing:.5px}td.rSecund{background:#FFC107;font-size:9pt;text-align:center}td.rSecundLarge{background:url(../Images/Image/bg_secund_large.png) left top repeat-x;border:1px solid #fff}td.celula{border-width:1px;border-style:solid;border-color:#96A7BA}td.rAntet,td.rAntetSecund{background-color:#FFC107;color:#000;font:11px/20px Arial,Helvetica,sans-serif;border:1px solid #fff}td.rAntet{font-weight:400;text-align:center;padding-left:10px;padding-right:10px}td.rAntetSecund{font-weight:400;padding-left:5px;text-align:center}td.rAntetSecundAlb,td.rAntetSecundGalben{font:11px/20px Arial,Helvetica,sans-serif;border:1px solid #fff;text-align:center}td.rAntetSecundGalben{background-color:#f7ef5b;color:#294460;font-weight:400}td.rAntetSecundAlb{background-color:#e2e2e2;color:#000;font-weight:400}td.rAntetSecundRosu{background-color:red;font:11px/20px Arial,Helvetica,sans-serif;color:#fff;border:1px solid #fff;font-weight:400;text-align:center}#Categorie_120{color:#000;background-color:#ffc107}td.rSecund{font-size:16px;}.tot{text-align:center;vertical-align:middle;background-color:#d0d0d0;}</style></head><table border='1px'><tr border='1px'>";
    var j = 0;
    tab = document.getElementById('tblPrezenze'); // id of table

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
    
    //Clone and fill Prezente1
    TabelePeUnRand = 3;
    WbmOlimpias.RaportPrezenteDepartamentWS.RaportPrezenteDepartamentLista($get("tbFiltruData").value, $get("tbFiltruDepartament").value, SucceededCallbackClone, FailedCallback);

    //hide Prezente1
    $('#tblPrezenze').hide();
    $('#tblPrezenze1').show();

    //Delay printThis 2000
    $('#tblPrezenze1').printThis({
        pageTitle: "",
        importCSS: true,
        ImportStyle: true,
        copyTagClasses: true,
        loadCSS: "Css/StyleSheet.css"
    }).delay(2000);
}

function printPDF() {
    var pdf = new jsPDF('p', 'pt', 'letter');
    pdf.addHTML($('#tblPrezenze')[0], function () {
        pdf.save('Prezenze.pdf');
    });
}


function Proprietati()
{}

function SucceededCallback(result, userContext, methodName) {
    $get('up').style.display = 'none';
    switch (methodName) {
        case ("RaportPrezenteDepartamentLista"):
            {
                if (result.Eroare !== '') {
                    window.alert(result.Eroare);
                    return;
                }
                AfisarePrezenteDepartament(result.TabelaPrezentaDepartament);
                AfisarePrezenteSumar(result.TabelaPrezentaSumar);
                $('#idassenti').text($('.inAssenti').text());
                $('#idmaternita').text($('.inMaternita').text());
                $('#idferie').text($('.inFerie').text());

                break;
            }
        case ("RaportPrezenteDepartamentExcel"):
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


function SucceededCallbackClone(result, userContext, methodName) {
    $get('up').style.display = 'none';
    switch (methodName) {
        case ("RaportPrezenteDepartamentLista"):
            {
                if (result.Eroare !== '') {
                    window.alert(result.Eroare);
                    return;
                }
                AfisarePrezenteDepartamentClone(result.TabelaPrezentaDepartament);
                AfisarePrezenteSumar(result.TabelaPrezentaSumar);
                $('#idassenti').text($('.inAssenti').text());
                $('#idmaternita').text($('.inMaternita').text());
                $('#idferie').text($('.inFerie').text());

                break;
            }
        case ("RaportPrezenteDepartamentExcel"):
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
                    if (result.Tabela[item].Departament === 'a tempo determinato') {
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
function AfisarePrezenteDepartamentClone(Tabela) {

    var mytable = $get('tPrezenteDepartament1');
    while (mytable.rows.length > 0) {
        mytable.deleteRow(0);
    }
    var i = 0;
    var numeClasa = '';
    var newrow = mytable.insertRow(-1);
    newrow.id = "hGrup";

    for (var item in Tabela) {
        if (i >= TabelePeUnRand) {
            newrow = mytable.insertRow(-1);
            i = 0;
        }
        i++;

        var sTable = '<table id=myTable  style="border: 1px solid #800080; border-collapse: collapse;" width="300">';
        sTable = sTable + '<tr><td class="rAntet" colspan="5" align="center">' + Tabela[item].Grup + '</td></tr>';
        sTable = sTable + '<tr>';
        sTable = sTable + '<td class="rAntetSecund">&nbsp;</td>';
        sTable = sTable + '<td class="rAntetSecund">Nome e cognome</td>';
        sTable = sTable + '<td class="rAntetSecund">Mansione</td>';
        sTable = sTable + '<td class="rAntetSecund">A</td>';
        sTable = sTable + '</tr>';

        var subTabela = Tabela[item].TabelaPrezentaGrup;
        for (var subItem in subTabela) {
            sTable = sTable + '<tr class="rAntetSecundAlb">';
            sTable = sTable + '<td class="rAntetSecundAlb">' + subTabela[subItem].ZiLucratoare + '</td>';
            sTable = sTable + '<td class="rAntetSecundAlb">' + subTabela[subItem].Angajat + '</td>';
            sTable = sTable + '<td class="rAntetSecundAlb">' + subTabela[subItem].PostDeLucru + '</td>';
            //sTable = sTable + '<td class="rAntetSecundAlb">' + subTabela[subItem].PostDeLucru + '</td>';

            if (subTabela[subItem].Maternitate === '1')
                sTable = sTable + '<td class="rAntetSecundGalben">' + subTabela[subItem].Maternita + '</td>';

            else if (subTabela[subItem].Absent === '1' && subTabela[subItem].Ferie !== '1')
                sTable = sTable + '<td class="rAntetSecundRosu">' + subTabela[subItem].Absent + '</td>';
            else if (subTabela[subItem].Ferie === '1')
                sTable = sTable + '<td class="rAntetSecundRosu" style="background-color:forestgreen!important;">' + subTabela[subItem].Ferie + '</td>';
            else
                sTable = sTable + '<td class="rAntetSecundAlb">' + subTabela[subItem].Absent + '</td>';
            sTable = sTable + '</tr>';
        }

        var newcell = newrow.insertCell(-1);
        newcell.style.verticalAlign = "top";
        newcell.classList.add("peki");
        newcell.innerHTML = sTable;


    }


}


function AfisarePrezenteSumar(Tabela) {

    var mytable = $get('tTotal');
    var i = 0;
    var numeClasa = '';
    var newrow = mytable.rows[0];

    var sTable = '<table id=myTable style="border: 1px solid #800080; border-collapse: collapse;" align="center" width="450">';
    sTable = sTable + '<tr>';
    sTable = sTable + '<td class="rAntet">&nbsp;</td>';
    sTable = sTable + '<td class="rAntet">in Carico</td>';
    sTable = sTable + '<td class="rAntet">Presenti</td>';
    sTable = sTable + '<td class="rAntet">Assenti</td>';
    sTable = sTable + '<td class="rAntet">Ferie</td>';
    //sTable = sTable + '<td class="rAntet">Maternita</td>';
    sTable = sTable + '<td class="rAntet">% Assenteismo</td>';
    sTable = sTable + '</tr>';
    for (var Item in Tabela) {
        sTable = sTable + '<tr>';
        if (Tabela[Item].LinieEchipa === 'TOTALE') {
            sTable = sTable + '<td class="rAntetSecund">' + Tabela[Item].LinieEchipa + '</td>';
            sTable = sTable + '<td class="rAntetSecund inCarico" align="right">' + Tabela[Item].NumarAngajati + '</td>';
            sTable = sTable + '<td class="rAntetSecund inPresenti" align="right">' + Tabela[Item].Prezenti + '</td>';
            sTable = sTable + '<td class="rAntetSecund inAssenti" align="right">' + Tabela[Item].Absenti + '</td>';
            sTable = sTable + '<td class="rAntetSecund inFerie" align="right">' + Tabela[Item].Ferie + '</td>';
            //sTable = sTable + '<td class="rAntetSecund inMaternita" align="right">' + Tabela[Item].Maternita + '</td>';
            sTable = sTable + '<td class="rAntetSecund inPercentaualeAssent" align="right">' + Tabela[Item].Procent + '</td>';

            //$('#rAntetSecundRosu').text(Tabela[Item].Absenti);
            //$('#rAntetSecundGalben').text();


        }
        else {
            sTable = sTable + '<td class="rAntetSecundAlb">' + Tabela[Item].LinieEchipa + '</td>';
            sTable = sTable + '<td class="rAntetSecundAlb" align="right">' + Tabela[Item].NumarAngajati + '</td>';
            sTable = sTable + '<td class="rAntetSecundAlb" align="right">' + Tabela[Item].Prezenti + '</td>';
            sTable = sTable + '<td class="rAntetSecundAlb" align="right">' + Tabela[Item].Absenti + '</td>';
            sTable = sTable + '<td class="rAntetSecundAlb" align="right">' + Tabela[Item].Ferie + '</td>';
            //sTable = sTable + '<td class="rAntetSecundAlb" align="right">' + Tabela[Item].Maternita + '</td>';
            sTable = sTable + '<td class="rAntetSecundAlb" align="right">' + Tabela[Item].Procent + '</td>';
        }
        sTable = sTable + '</tr>';
    }
    sTable = sTable + '</table>';

    var newcell = newrow.cells[0];
    if (Tabela.length > 0)
        newcell.innerHTML = sTable;
    else
        newcell.innerHTML = '&nbsp;';
}

function AfisarePrezenteDepartament(Tabela)
{

    var mytable = $get('tPrezenteDepartament');
    while (mytable.rows.length > 0) {
        mytable.deleteRow(0);
    }
    var i = 0;
    var numeClasa = '';
    var newrow = mytable.insertRow(-1);
    newrow.id = "hGrup";

    for (var item in Tabela) {
        if (i >= TabelePeUnRand)
        {
            newrow = mytable.insertRow(-1);
            i = 0;
        }
        i++;

        var sTable = '<table id=myTable  style="border: 1px solid #800080; border-collapse: collapse;" width="300">';
        sTable = sTable + '<tr><td class="rAntet" colspan="5" align="center">' + Tabela[item].Grup + '</td></tr>';
        sTable = sTable + '<tr>';
        sTable = sTable + '<td class="rAntetSecund">&nbsp;</td>';
        sTable = sTable + '<td class="rAntetSecund">Nome e cognome</td>';
        sTable = sTable + '<td class="rAntetSecund">Mansione</td>';
        sTable = sTable + '<td class="rAntetSecund">A</td>';
        sTable = sTable + '</tr>';

        var subTabela = Tabela[item].TabelaPrezentaGrup;
        for (var subItem in subTabela) {
            sTable = sTable + '<tr class="rAntetSecundAlb">';
            sTable = sTable + '<td class="rAntetSecundAlb">' + subTabela[subItem].ZiLucratoare + '</td>';
            sTable = sTable + '<td class="rAntetSecundAlb">' + subTabela[subItem].Angajat + '</td>';
            sTable = sTable + '<td class="rAntetSecundAlb">' + subTabela[subItem].PostDeLucru + '</td>';
            //sTable = sTable + '<td class="rAntetSecundAlb">' + subTabela[subItem].PostDeLucru + '</td>';

            if (subTabela[subItem].Maternitate === '1')
                sTable = sTable + '<td class="rAntetSecundGalben">' + subTabela[subItem].Maternita + '</td>';

            else if (subTabela[subItem].Absent === '1' && subTabela[subItem].Ferie !== '1')
                sTable = sTable + '<td class="rAntetSecundRosu">' + subTabela[subItem].Absent + '</td>';
            else if (subTabela[subItem].Ferie === '1')
                sTable = sTable + '<td class="rAntetSecundRosu" style="background-color:forestgreen!important;">' + subTabela[subItem].Ferie + '</td>';
            else
                sTable = sTable + '<td class="rAntetSecundAlb">' + subTabela[subItem].Absent + '</td>';
            sTable = sTable + '</tr>';
        }
        
        var newcell = newrow.insertCell(-1);
        newcell.style.verticalAlign = "top";
        newcell.classList.add("peki");
        newcell.innerHTML = sTable;


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
    $('#tbFiltruData').datepicker({
        showOn: "button",
        buttonImage: "../../Images/calender.png",
        buttonImageOnly: true,
        dateFormat:'dd/mm/yy',
        onSelect: function () {
            Lista();
        }

    });
    Lista();

} 


if (typeof(Sys) !== "undefined") Sys.Application.notifyScriptLoaded();
