// RaportAbsenteAn.js
function Lista()  
{
    $get('up').style.display = '';
    WbmOlimpias.RaportAbsenteAnWS.RaportAbsenteAnLista($get("ddlFiltruAn").value, SucceededCallback, FailedCallback);
}

function bExcel_Click() {
    $get('up').style.display = '';
    WbmOlimpias.RaportAbsenteAnWS.RaportAbsenteAnExcel($get("ddlFiltruAn").value, SucceededCallback, FailedCallback);
}

function Proprietati()
{}

function SucceededCallback(result, userContext, methodName) {
    $get('up').style.display = 'none';
    switch (methodName) {
        case ("RaportAbsenteAnLista"):
            {
                if (result.Eroare != '') {
                    window.alert(result.Eroare);
                    return;
                }
                AfisareAbsente("tAbsenteProcent", result.Tabela);
                AfisareAbsente("tAbsenteOre", result.TabelaAbsenteOre);
                break;
            }
        case ("RaportAbsenteAnExcel"):
            {
                if (result.Eroare != '') {
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
                    if (result.Tabela[item].A == 'a tempo determinato')
                    {
                        i = i + 2;
                        xlSheet.Cells(i + 5, 1).Value = 'di cui';
                        i++;
                    }
                    if (result.Tabela[item].A == 'TOTALE') {

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
function AfisareAbsente(NumeTabela,Tabela) {
    
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
        newcell.id = 'A_' + i.toString();
        newcell.width = 50;
        newcell.className = numeClasa;
        newcell.innerHTML = '&nbsp;' + Tabela[item].A;
        newcell.title = Tabela[item].A;
        newcell = newrow.insertCell(-1);
        newcell.id = 'B_' + i.toString();
        newcell.className = numeClasa;
        newcell.innerHTML = '&nbsp;' + Tabela[item].B;
        newcell.title = Tabela[item].B;
        newcell = newrow.insertCell(-1);
        newcell.id = 'C_' + i.toString();
        newcell.className = numeClasa;
        newcell.innerHTML = '&nbsp;' + Tabela[item].C;
        newcell.title = Tabela[item].C;
        newcell = newrow.insertCell(-1);
        newcell.id = 'D_' + i.toString();
        newcell.className = numeClasa;
        newcell.innerHTML = '&nbsp;' + Tabela[item].D;
        newcell.title = Tabela[item].D;
        newcell = newrow.insertCell(-1);
        newcell.id = 'E_' + i.toString();
        newcell.className = numeClasa;
        newcell.innerHTML = '&nbsp;' + Tabela[item].E;
        newcell.title = Tabela[item].E;
        newcell = newrow.insertCell(-1);
        newcell.id = 'F_' + i.toString();
        newcell.className = numeClasa;
        newcell.innerHTML = '&nbsp;' + Tabela[item].F;
        newcell.title = Tabela[item].F;
        newcell = newrow.insertCell(-1);
        newcell.id = 'G_' + i.toString();
        newcell.className = numeClasa;
        newcell.innerHTML = '&nbsp;' + Tabela[item].G;
        newcell.title = Tabela[item].G;
        newcell = newrow.insertCell(-1);
        newcell.id = 'H_' + i.toString();
        newcell.className = numeClasa;
        newcell.innerHTML = '&nbsp;' + Tabela[item].H;
        newcell.title = Tabela[item].H;
        newcell = newrow.insertCell(-1);
        newcell.id = 'I_' + i.toString();
        newcell.className = numeClasa;
        newcell.innerHTML = '&nbsp;' + Tabela[item].I;
        newcell.title = Tabela[item].I;
        newcell = newrow.insertCell(-1);
        newcell.id = 'J_' + i.toString();
        newcell.className = numeClasa;
        newcell.innerHTML = '&nbsp;' + Tabela[item].J;
        newcell.title = Tabela[item].J;
        newcell = newrow.insertCell(-1);
        newcell.id = 'K_' + i.toString();
        newcell.className = numeClasa;
        newcell.innerHTML = '&nbsp;' + Tabela[item].K;
        newcell.title = Tabela[item].K;
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
} 
if (typeof(Sys) !== "undefined") Sys.Application.notifyScriptLoaded();
