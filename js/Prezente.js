// Prezente.js
function Lista(Find)  
{
    $get('up').style.display = '';
    var oFiltruPrezente = new WbmOlimpias.FiltruPrezenteObiect();
    oFiltruPrezente.Find = Find;
    oFiltruPrezente.FiltruCodAngajat = $get("tbFiltruCodAngajat").value;
    oFiltruPrezente.FiltruCodSistem = $get("tbFiltruCodSistem").value;
    oFiltruPrezente.FiltruMarca = $get("tbFiltruMarca").value;
    oFiltruPrezente.FiltruNume = $get("tbFiltruNume").value;
    oFiltruPrezente.FiltruDepartament = $get("tbFiltruDepartament").value;
    WbmOlimpias.PrezenteWS.PrezenteLista(oFiltruPrezente, $get("tbPaginaCurenta").value, SucceededCallback, FailedCallback);
}
function Proprietati()
{
    var Id = $get("hfId").value;
    if (Id == '') {
        $get("tbCodAngajat").focus();
        $get("tbCodAngajat").value = "";
        $get("tbCodSistem").value = "";
        $get("tbMarca").value = "";
        $get("tbNume").value = "";
        $get("tbPrenume").value = "";
        $get("hfIdTipPostDeLucru").value = "";
        $get("tbTipPostDeLucru").value = "";
        $get("hfIdPostDeLucru").value = "";
        $get("tbPostDeLucru").value = "";
        $get("hfIdDepartament").value = "";
        $get("tbDepartament").value = "";
        $get("hfIdEchipa").value = "";
        $get("tbEchipa").value = "";
        $get("hfIdLinie").value = "";
        $get("tbLinie").value = "";
        $get("tbData").value = "";
        $get("hfIdTipOra").value = "";
        $get("tbTipOra").value = "";
        $get("tbR1DAL").value = "";
        $get("tbR1ALL").value = "";
        $get("tbR1TOT").value = "";
    }
    else {
        $get('up').style.display = '';
        WbmOlimpias.PrezenteWS.PrezentaProprietati(Id, SucceededCallback, FailedCallback);
    }
}
function Adaugare()
{
    $get('up').style.display = '';
    var oPrezenta = new WbmOlimpias.PrezentaObiect();
    oPrezenta.Id = '';

    var oAngajat = new WbmOlimpias.AngajatObiect();
    oAngajat.Id = $get("hfIdAngajat").value;

    var oTipPostDeLucru = new WbmOlimpias.TipPostDeLucruObiect();
    oTipPostDeLucru.Id = $get("hfIdTipPostDeLucru").value;
    oAngajat.oTipPostDeLucru = oTipPostDeLucru;

    var oPostDeLucru = new WbmOlimpias.PostDeLucruObiect();
    oPostDeLucru.Id = $get("hfIdPostDeLucru").value;
    oAngajat.oPostDeLucru = oPostDeLucru;

    var oDepartament = new WbmOlimpias.DepartamentObiect();
    oDepartament.Id = $get("hfIdDepartament").value;
    oAngajat.oDepartament = oDepartament;

    var oEchipa = new WbmOlimpias.EchipaObiect();
    oEchipa.Id = $get("hfIdEchipa").value;
    oAngajat.oEchipa = oEchipa;

    var oLinie = new WbmOlimpias.LinieObiect();
    oLinie.Id = $get("hfIdLinie").value;
    oAngajat.oLinie = oLinie;

    oPrezenta.oAngajat = oAngajat;

    oPrezenta.Data = $get("tbData").value;

    var oTipOra = new WbmOlimpias.TipOraObiect();
    oTipOra.Id = $get("hfIdTipOra").value;
    oPrezenta.oTipOra = oTipOra;

    oPrezenta.R1DAL = $get("tbR1DAL").value;
    oPrezenta.R1ALL = $get("tbR1ALL").value;
    oPrezenta.R1TOT = $get("tbR1TOT").value;
    
    WbmOlimpias.PrezenteWS.PrezentaAdaugare(oPrezenta, SucceededCallback, FailedCallback);
}
function Modificare()
{
    $get('up').style.display = '';
    var oPrezenta = new WbmOlimpias.PrezentaObiect();
    oPrezenta.Id = $get("hfId").value;
    
    var oAngajat = new WbmOlimpias.AngajatObiect();
    oAngajat.Id = $get("hfIdAngajat").value;

    var oTipPostDeLucru = new WbmOlimpias.TipPostDeLucruObiect();
    oTipPostDeLucru.Id = $get("hfIdTipPostDeLucru").value;
    oAngajat.oTipPostDeLucru = oTipPostDeLucru;

    var oPostDeLucru = new WbmOlimpias.PostDeLucruObiect();
    oPostDeLucru.Id = $get("hfIdPostDeLucru").value;
    oAngajat.oPostDeLucru = oPostDeLucru;

    var oDepartament = new WbmOlimpias.DepartamentObiect();
    oDepartament.Id = $get("hfIdDepartament").value;
    oAngajat.oDepartament = oDepartament;

    var oEchipa = new WbmOlimpias.EchipaObiect();
    oEchipa.Id = $get("hfIdEchipa").value;
    oAngajat.oEchipa = oEchipa;

    var oLinie = new WbmOlimpias.LinieObiect();
    oLinie.Id = $get("hfIdLinie").value;
    oAngajat.oLinie = oLinie;

    oPrezenta.oAngajat = oAngajat;

    oPrezenta.Data = $get("tbData").value;

    var oTipOra = new WbmOlimpias.TipOraObiect();
    oTipOra.Id = $get("hfIdTipOra").value;
    oPrezenta.oTipOra = oTipOra;

    oPrezenta.R1DAL = $get("tbR1DAL").value;
    oPrezenta.R1ALL = $get("tbR1ALL").value;
    oPrezenta.R1TOT = $get("tbR1TOT").value;
    
    WbmOlimpias.PrezenteWS.PrezentaModificare(oPrezenta, SucceededCallback, FailedCallback);
}
function Stergere() {
    if (confirm('Stergem randul selectat?')) {
        $get('up').style.display = '';
        WbmOlimpias.PrezenteWS.PrezentaStergere($get("hfId").value, SucceededCallback, FailedCallback);
    }
}
function Angajat() {
    $get('up').style.display = '';
    WbmOlimpias.PrezenteWS.AngajatCautare($get('tbCodAngajat').value, SucceededCallback, FailedCallback);
}
function TipPostDeLucru() {
    $get('up').style.display = '';
    WbmOlimpias.PrezenteWS.TipPostDeLucruCautare($get('tbTipPostDeLucru').value, SucceededCallback, FailedCallback);
}
function PostDeLucru() {
    $get('up').style.display = '';
    WbmOlimpias.PrezenteWS.PostDeLucruCautare($get('tbPostDeLucru').value, SucceededCallback, FailedCallback);
}
function Departament() {
    $get('up').style.display = '';
    WbmOlimpias.PrezenteWS.DepartamentCautare($get('tbDepartament').value, SucceededCallback, FailedCallback);
}
function Echipa() {
    $get('up').style.display = '';
    WbmOlimpias.PrezenteWS.EchipaCautare($get('tbEchipa').value, SucceededCallback, FailedCallback);
}
function Linie() {
    $get('up').style.display = '';
    WbmOlimpias.PrezenteWS.LinieCautare($get('tbLinie').value, SucceededCallback, FailedCallback);
}
function TipOra() {
    $get('up').style.display = '';
    WbmOlimpias.PrezenteWS.TipOraCautare($get('tbTipOra').value, SucceededCallback, FailedCallback);
}
var xlApp, xlSheet, iNext;
function bImport_Click()
{
    if ($get('fuImport').value == '') {
        window.alert('Alegeti fisierul Excel!');
        return;
    }
    $get('up').style.display = '';
    var oPrezente = new WbmOlimpias.PrezenteObiect();
    oPrezente.Tabela = new Array();

    xlApp = new ActiveXObject("Excel.Application");
    xlApp.Visible = false;
    xlApp.Workbooks.Open($get('fuImport').value);
    xlSheet = xlApp.ActiveSheet;

    setTimeout(function () { }, 2);
    iNext = 2;
    setTimeout("ImportPrezenta()", 200);
}
function ImportPrezenta() {
    
    var Valoare = xlSheet.Cells(iNext, 3).Value;
    var Sfarsit = false;
    //window.alert(Valoare);
    if (Valoare == undefined) {
        Sfarsit = true;
    }
    var oPrezenta = new WbmOlimpias.PrezentaObiect();
    if (!Sfarsit) {
        var oAngajat = new WbmOlimpias.AngajatObiect();
        oAngajat.CodAngajat = xlSheet.Cells(iNext, 3).Value;
        oPrezenta.oAngajat = oAngajat;

        var oTipOra = new WbmOlimpias.TipOraObiect();
        oTipOra.CodTipOra = xlSheet.Cells(iNext, 34).Value;
        oPrezenta.oTipOra = oTipOra;

        oPrezenta.Data = xlSheet.Cells(iNext, 30).Value + ('00' + xlSheet.Cells(iNext, 31).Value).slice(-2) + ('00' + xlSheet.Cells(iNext, 32).Value).slice(-2);
        oPrezenta.R1DAL = xlSheet.Cells(iNext, 36).Value;
        oPrezenta.R1ALL = xlSheet.Cells(iNext, 37).Value;
        oPrezenta.R1TOT = xlSheet.Cells(iNext, 38).Value;
        //window.alert(oPrezenta.Data);
        iNext++;
        WbmOlimpias.PrezenteWS.PrezentaImport(oPrezenta, 'Continua', SucceededCallback, FailedCallback);
    }
    else
    {
        xlApp.Quit();
        xlApp = null;
        setTimeout("CollectGarbage()", 1);
        $get('up').style.display = 'none';
        window.alert('Importul s-a terminat cu succes!');
        Lista('');
        //WbmOlimpias.PrezenteWS.PerzentaImport(oPrezenta, 'Gata', SucceededCallback, FailedCallback);
        
    }

    
    
}


function bImportAngajat_Click() {
    if ($get('fuImport').value == '') {
        window.alert('Alegeti fisierul Excel!');
        return;
    }
    $get('up').style.display = '';
    var oAngajati = new WbmOlimpias.AngajatiObiect();
    oAngajati.Tabela = new Array();

    var xlApp, xlSheet;
    xlApp = new ActiveXObject("Excel.Application");
    xlApp.Visible = false;
    xlApp.Workbooks.Open($get('fuImport').value);
    xlSheet = xlApp.ActiveSheet;
    var i = 4;
    var Valoare = xlSheet.Cells(i, 3).Value;
    while (Valoare != undefined) {

        var oAngajat = new WbmOlimpias.AngajatObiect();
        oAngajat.CodAngajat = xlSheet.Cells(i, 3).Value;
        oAngajat.Nume = xlSheet.Cells(i, 4).Value;
        oAngajat.Prenume = xlSheet.Cells(i, 5).Value;
        oAngajat.CodSistem = xlSheet.Cells(i, 6).Value;
        oAngajat.Marca = xlSheet.Cells(i, 7).Value;
        oAngajat.NumarIdentificarePersonala = xlSheet.Cells(i, 8).Value;
        //window.alert(oAngajat.NumarIdentificarePersonala);
        oAngajat.Sex = xlSheet.Cells(i, 9).Value;
        oAngajat.DataAngajarii = xlSheet.Cells(i, 10).Value + ('00' + xlSheet.Cells(i, 11).Value).slice(-2) + ('00' + xlSheet.Cells(i, 12).Value).slice(-2);
        
        var oLocalitate = new WbmOlimpias.LocalitateObiect();
        oLocalitate.Localitate = xlSheet.Cells(i, 18).Value;
        oAngajat.oLocalitate = oLocalitate;

        oAngajat.Strada = xlSheet.Cells(i, 21).Value;

        var oPostDeLucru = new WbmOlimpias.PostDeLucruObiect();
        oPostDeLucru.CodPostDeLucru = xlSheet.Cells(i, 26).Value;
        oPostDeLucru.PostDeLucru = xlSheet.Cells(i, 27).Value;
        oAngajat.oPostDeLucru = oPostDeLucru;

        var oDepartament = new WbmOlimpias.DepartamentObiect();
        oDepartament.CodDepartament = xlSheet.Cells(i, 34).Value;
        oDepartament.Departament = xlSheet.Cells(i, 35).Value;
        oAngajat.oDepartament = oDepartament;

        var oIncadrare = new WbmOlimpias.IncadrareObiect();
        oIncadrare.CodIncadrare = xlSheet.Cells(i, 38).Value;
        oIncadrare.Incadrare = xlSheet.Cells(i, 39).Value;
        oAngajat.oIncadrare = oIncadrare;

        oAngajat.DataNedeterminat = xlSheet.Cells(i, 40).Value + ('00' + xlSheet.Cells(i, 41).Value).slice(-2) + ('00' + xlSheet.Cells(i, 42).Value).slice(-2);
        oAngajat.CC = xlSheet.Cells(i, 46).Value;

        var oTipPostDeLucru = new WbmOlimpias.TipPostDeLucruObiect();
        oTipPostDeLucru.TipPostDeLucru = xlSheet.Cells(i, 58).Value;
        oAngajat.oTipPostDeLucru = oTipPostDeLucru;

        var oLoculNasterii = new WbmOlimpias.LocalitateObiect();
        oLoculNasterii.Localitate = xlSheet.Cells(i, 16).Value;
        oAngajat.oLoculNasterii = oLoculNasterii;

        //window.alert(oAngajat.DataAngajarii);
        //window.alert(oAngajat.DataNedeterminat);

        Array.add(oAngajati.Tabela, oAngajat);
        i++;
        Valoare = xlSheet.Cells(i, 3).Value;
    }
    xlApp.Quit();
    xlApp = null;
    setTimeout("CollectGarbage()", 1);
    $get('fuImport').value = '';
    WbmOlimpias.PrezenteWS.AngajatiImport(oAngajati, SucceededCallback, FailedCallback);
}

function SucceededCallback(result, userContext, methodName) {
    if (methodName != 'PrezentaImport')
        $get('up').style.display = 'none';
    switch (methodName) {
        case ("PrezenteLista"):
            {
                var mytable = $get("tPrezente");
                while (mytable.rows.length > 1) {
                    mytable.deleteRow(1);
                }
                var i = 0;
                for (var item in result.Tabela) {
                    var newrow = mytable.insertRow(-1);
                    newrow.id = i.toString();
                    newrow.onclick = RowClick;
                    newrow.ondblclick = SetariValori;
                    var newcell = newrow.insertCell(-1);
                    newcell.id = 'CodAngajat_' + i.toString();
                    newcell.className = 'neselectat';
                    newcell.innerHTML = '&nbsp;' + result.Tabela[item].oAngajat.CodAngajat;
                    newcell.title = result.Tabela[item].oAngajat.CodAngajat;
                    newcell = newrow.insertCell(-1);
                    newcell.id = 'CodSistem_' + i.toString();
                    newcell.className = 'neselectat';
                    newcell.innerHTML = '&nbsp;' + result.Tabela[item].oAngajat.CodSistem;
                    newcell.title = result.Tabela[item].oAngajat.CodSistem;
                    newcell = newrow.insertCell(-1);
                    newcell.id = 'Marca_' + i.toString();
                    newcell.className = 'neselectat';
                    newcell.innerHTML = '&nbsp;' + result.Tabela[item].oAngajat.Marca;
                    newcell.title = result.Tabela[item].oAngajat.Marca;
                    newcell = newrow.insertCell(-1);
                    newcell.id = 'Nume_' + i.toString();
                    newcell.className = 'neselectat';
                    newcell.innerHTML = '&nbsp;' + result.Tabela[item].oAngajat.Nume;
                    newcell.title = result.Tabela[item].oAngajat.Nume;
                    newcell = newrow.insertCell(-1);
                    newcell.id = 'Prenume_' + i.toString();
                    newcell.className = 'neselectat';
                    newcell.innerHTML = '&nbsp;' + result.Tabela[item].oAngajat.Prenume;
                    newcell.title = result.Tabela[item].oAngajat.Prenume;
                    newcell = newrow.insertCell(-1);
                    newcell.id = 'Data_' + i.toString();
                    newcell.className = 'neselectat';
                    newcell.innerHTML = '&nbsp;' + result.Tabela[item].Data;
                    newcell.title = result.Tabela[item].Data;
                    newcell = newrow.insertCell(-1);
                    newcell.id = 'TipOra_' + i.toString();
                    newcell.className = 'neselectat';
                    newcell.innerHTML = '&nbsp;' + result.Tabela[item].oTipOra.TipOra;
                    newcell.title = result.Tabela[item].oTipOra.TipOra;
                    newcell = newrow.insertCell(-1);
                    newcell.id = 'R1DAL_' + i.toString();
                    newcell.className = 'neselectat';
                    newcell.innerHTML = '&nbsp;' + result.Tabela[item].R1DAL;
                    newcell.title = result.Tabela[item].R1DAL;
                    newcell = newrow.insertCell(-1);
                    newcell.id = 'R1ALL_' + i.toString();
                    newcell.className = 'neselectat';
                    newcell.innerHTML = '&nbsp;' + result.Tabela[item].R1ALL;
                    newcell.title = result.Tabela[item].R1ALL;
                    newcell = newrow.insertCell(-1);
                    newcell.id = 'R1TOT_' + i.toString();
                    newcell.className = 'neselectat';
                    newcell.innerHTML = '&nbsp;' + result.Tabela[item].R1TOT;
                    newcell.title = result.Tabela[item].R1TOT;
                    newcell = newrow.insertCell(-1);
                    newcell.id = 'Id_' + i.toString();
                    newcell.title = result.Tabela[item].Id;
                    if (i == result.IndexRand)
                        SchimbareRand(i.toString());
                    i++;
                }
                if (i == 0)
                    SchimbareRand('');
                $get("tbPaginaCurenta").value = result.PaginaCurenta;
                $get("tbNumarPagini").value = result.NumarPagini;
                break;
            }
        case ("PrezentaProprietati"):
            {
                $get("hfIdAngajat").value = result.oAngajat.Id;
                $get("tbCodAngajat").value = result.oAngajat.CodAngajat;
                $get("tbCodSistem").value = result.oAngajat.CodSistem;
                $get("tbMarca").value = result.oAngajat.Marca;
                $get("tbNume").value = result.oAngajat.Nume;
                $get("tbPrenume").value = result.oAngajat.Prenume;
                $get("hfIdTipPostDeLucru").value = result.oAngajat.oTipPostDeLucru.Id;
                $get("tbTipPostDeLucru").value = result.oAngajat.oTipPostDeLucru.TipPostDeLucru;
                $get("hfIdPostDeLucru").value = result.oAngajat.oPostDeLucru.Id;
                $get("tbPostDeLucru").value = result.oAngajat.oPostDeLucru.PostDeLucru;

                $get("hfIdDepartament").value = result.oAngajat.oDepartament.Id;
                $get("tbDepartament").value = result.oAngajat.oDepartament.Departament;
                $get("hfIdEchipa").value = result.oAngajat.oEchipa.Id;
                $get("tbEchipa").value = result.oAngajat.oEchipa.Echipa;

                $get("hfIdLinie").value = result.oAngajat.oLinie.Id;
                $get("tbLinie").value = result.oAngajat.oLinie.Linie;

                $get("tbData").value = result.Data;
                $get("hfIdTipOra").value = result.oTipOra.Id;
                $get("tbTipOra").value = result.oTipOra.TipOra;
                $get("tbR1DAL").value = result.R1DAL;
                $get("tbR1ALL").value = result.R1ALL;
                $get("tbR1TOT").value = result.R1TOT;

                $get("tbFiltruCodAngajat").focus();
                break;
            }
        case ("PrezentaAdaugare"):
            {
                if (result.Eroare == '')
                    Lista(result.Id);
                else
                    window.alert(result.Eroare);
                break;
            }
        case ("PrezentaModificare"):
            {
                if (result.Eroare == '')
                    Lista(result.Id);
                else
                    window.alert(result.Eroare);
                break;
            }
        case ("PrezentaStergere"):
            {
                if (result == '')
                    Lista('');
                else
                    window.alert(result);
                break;
            }
        case ("PrezentaImport"):
            {
                if (result == 'Gata') {
                    window.alert('S-a incarcat cu succes!');
                }
                else {
                    if (result != 'Continua') {
                        window.alert(result);
                    }
                    else
                        ImportPrezenta();
                }
                break;
            }
        case ('AngajatCautare'):
            {
                if (result.Id != '') {
                    $get('hfIdAngajat').value = result.Id;
                    $get('tbCodAngajat').value = result.CodAngajat;
                    $get('tbData').focus();
                }
                else
                    bAngajat_Click();
                break;
            }
        case ('TipPostDeLucruCautare'):
            {
                if (result.Id != '') {
                    $get('hfIdTipPostDeLucru').value = result.Id;
                    $get('tbTipPostDeLucru').value = result.TipPostDeLucru;
                    $get('tbPostDeLucru').focus();
                }
                else
                    bTipPostDeLucru_Click();
                break;
            }
        case ('PostDeLucruCautare'):
            {
                if (result.Id != '') {
                    $get('hfIdPostDeLucru').value = result.Id;
                    $get('tbPostDeLucru').value = result.PostDeLucru;
                    $get('tbDepartament').focus();
                }
                else
                    bPostDeLucru_Click();
                break;
            }
        case ('DepartamentCautare'):
            {
                if (result.Id != '') {
                    $get('hfIdDepartament').value = result.Id;
                    $get('tbDepartament').value = result.Departament;
                    $get('tbEchipa').focus();
                }
                else
                    bDepartament_Click();
                break;
            }
        case ('EchipaCautare'):
            {
                if (result.Id != '') {
                    $get('hfIdEchipa').value = result.Id;
                    $get('tbEchipa').value = result.Echipa;
                    $get('tbLinie').focus();
                }
                else
                    bEchipa_Click();
                break;
            }
        case ('LinieCautare'):
            {
                if (result.Id != '') {
                    $get('hfIdLinie').value = result.Id;
                    $get('tbLinie').value = result.Linie;
                    $get('tbData').focus();
                }
                else
                    bLinie_Click();
                break;
            }
        default:
            {
                window.alert('Serviciu inexistent!');
            }
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
function RowSelect() {
    $get("CodAngajat_" + $get("hfRowIndex").value).className = 'selectat';
    $get("CodSistem_" + $get("hfRowIndex").value).className = 'selectat';
    $get("Marca_" + $get("hfRowIndex").value).className = 'selectat';
    $get("Nume_" + $get("hfRowIndex").value).className = 'selectat';
    $get("Prenume_" + $get("hfRowIndex").value).className = 'selectat';
    $get("Data_" + $get("hfRowIndex").value).className = 'selectat';
    $get("TipOra_" + $get("hfRowIndex").value).className = 'selectat';
    $get("R1DAL_" + $get("hfRowIndex").value).className = 'selectat';
    $get("R1ALL_" + $get("hfRowIndex").value).className = 'selectat';
    $get("R1TOT_" + $get("hfRowIndex").value).className = 'selectat';
}
function RowUnselect()
{
    var obiect = $get("CodAngajat_" + $get("hfRowIndex").value);
    if (obiect != null)
        obiect.className = 'neselectat';
    obiect = $get("CodSistem_" + $get("hfRowIndex").value);
    if (obiect != null)
        obiect.className = 'neselectat';
    obiect = $get("Marca_" + $get("hfRowIndex").value);
    if (obiect != null)
        obiect.className = 'neselectat';
    obiect = $get("Nume_" + $get("hfRowIndex").value);
    if(obiect!=null)
        obiect.className = 'neselectat';
    obiect = $get("Prenume_" + $get("hfRowIndex").value);
    if (obiect != null)
        obiect.className = 'neselectat';
    obiect = $get("Data_" + $get("hfRowIndex").value);
    if (obiect != null)
        obiect.className = 'neselectat';
    obiect = $get("TipOra_" + $get("hfRowIndex").value);
    if (obiect != null)
        obiect.className = 'neselectat';
    obiect = $get("R1DAL_" + $get("hfRowIndex").value);
    if (obiect != null)
        obiect.className = 'neselectat';
    obiect = $get("R1ALL_" + $get("hfRowIndex").value);
    if (obiect != null)
        obiect.className = 'neselectat';
    obiect = $get("R1TOT_" + $get("hfRowIndex").value);
    if (obiect != null)
        obiect.className = 'neselectat';
  
}
function SetariValori() {
    if (window.dialogArguments && dialogArguments.location) {
        var Id = $get('hfId').value;
        var Nume = $get('tbNume').value;
        var Prenume = $get('tbPrenume').value;
        var Argumente = new Array(Id, Nume, Prenume);
        window.returnValue = Argumente;
        close();
    }
}
function bAngajat_Click() {
    var rezultat = window.showModalDialog('Angajati.aspx', window, 'center:yes;resizable:no;dialogHeight:620px;dialogWidth:1200px;');
    if (rezultat != null) {
        $get('hfIdAngajat').value = rezultat[0].toString();
        $get('tbCodAngajat').value = rezultat[1].toString();
        $get('tbCodSistem').value = rezultat[2].toString();
        $get('tbMarca').value = rezultat[3].toString();
        $get('tbNume').value = rezultat[4].toString();
        $get('tbPrenume').value = rezultat[5].toString();
        $get('hfIdTipPostDeLucru').value = rezultat[6].toString();
        $get('tbTipPostDeLucru').value = rezultat[7].toString();
        $get('hfIdPostDeLucru').value = rezultat[8].toString();
        $get('tbPostDeLucru').value = rezultat[9].toString();
        $get('hfIdDepartament').value = rezultat[10].toString();
        $get('tbDepartament').value = rezultat[11].toString();
        $get('hfIdEchipa').value = rezultat[12].toString();
        $get('tbEchipa').value = rezultat[13].toString();
        $get('hfIdLinie').value = rezultat[14].toString();
        $get('tbLinie').value = rezultat[15].toString();
        $get('tbData').focus();
    }
}
function bTipPostDeLucru_Click() {
    var rezultat = window.showModalDialog('TipuriPostDeLucru.aspx', window, 'center:yes;resizable:no;dialogHeight:390px;dialogWidth:800px;');
    if (rezultat != null) {
        $get('hfIdTipPostDeLucru').value = rezultat[0].toString();
        $get('tbTipPostDeLucru').value = rezultat[1].toString();
        $get('tbPostDeLucru').focus();
    }
}
function bPostDeLucru_Click() {
    var rezultat = window.showModalDialog('PosturiDeLucru.aspx', window, 'center:yes;resizable:no;dialogHeight:390px;dialogWidth:800px;');
    if (rezultat != null) {
        $get('hfIdPostDeLucru').value = rezultat[0].toString();
        $get('tbPostDeLucru').value = rezultat[1].toString();
        $get('tbDepartament').focus();
    }
}
function bDepartament_Click() {
    var rezultat = window.showModalDialog('Departamente.aspx', window, 'center:yes;resizable:no;dialogHeight:590px;dialogWidth:645px;');
    if (rezultat != null) {
        $get('hfIdDepartament').value = rezultat[0].toString();
        $get('tbDepartament').value = rezultat[1].toString();
        $get('tbEchipa').focus();
    }
}
function bEchipa_Click() {
    var rezultat = window.showModalDialog('Echipe.aspx', window, 'center:yes;resizable:no;dialogHeight:590px;dialogWidth:645px;');
    if (rezultat != null) {
        $get('hfIdEchipa').value = rezultat[0].toString();
        $get('tbEchipa').value = rezultat[1].toString();
        $get('tbLinie').focus();
    }
}
function bLinie_Click() {
    var rezultat = window.showModalDialog('Linii.aspx', window, 'center:yes;resizable:no;dialogHeight:590px;dialogWidth:645px;');
    if (rezultat != null) {
        $get('hfIdLinie').value = rezultat[0].toString();
        $get('tbLinie').value = rezultat[1].toString();
        $get('tbData').focus();
    }
}
function bTipOra_Click() {
    var rezultat = window.showModalDialog('TipuriOre.aspx', window, 'center:yes;resizable:no;dialogHeight:300px;dialogWidth:700px;');
    if (rezultat != null) {
        $get('hfIdTipOra').value = rezultat[0].toString();
        $get('tbTipOra').value = rezultat[1].toString();
        $get('tbR1DAL').focus();
    }
}
function onKeyDown(eventElement) {
    //window.alert(eventElement.keyParolae);
    eventElement = eventElement || window.event;
    var sepropaga = true;
    switch (eventElement.keyCode) {
        case 13:    // enter
            if (eventElement.target.id == 'tbCodAngajat')
                Angajat();
            if (eventElement.target.id == 'tbTipPostDeLucru')
                TipPostDeLucru();
            if (eventElement.target.id == 'tbPostDeLucru')
                PostDeLucru();
            if (eventElement.target.id == 'tbDepartament')
                Departament();
            if (eventElement.target.id == 'tbEchipa')
                Echipa();
            if (eventElement.target.id == 'tbLinie')
                Linie();
            if (eventElement.target.id == 'tbData') {
                $get("tbTipOra").focus();
                sepropaga = false;
            }
            if (eventElement.target.id == 'tbR1DAL') {
                $get("tbR1ALL").focus();
                sepropaga = false;
            }
            if (eventElement.target.id == 'tbR1ALL') {
                $get("tbR1TOT").focus();
                sepropaga = false;
            }
            if (eventElement.target.id == 'tbR1TOT') {
                $get("bOk").focus();
                sepropaga = false;
            }

            if (eventElement.target.id == 'tbFiltruNume')
                Lista('');
            if (eventElement.target.id == 'tbFiltruDepartament')
                Lista('');
            if (eventElement.target.id == 'tbPaginaCurenta')
                Lista('');

            break;
        case 27:    // esc
            bCancel_Click();
            break;
        case 34:    // pg up
            bUrmator_Click();
            break;
        case 33:    // pg down
            bAnterior_Click();
            break;
        /*case 38:    // sageata sus
                RowPrevious();
            break;
        case 40:    // sageata jos
                RowNext();
            break;*/
        case 77:    // litera 'm' modificare
            if (eventElement.ctrlKey) {
                sepropaga = false;
                $get("tbCodAngajat").focus();
            }
            break;
        case 78:    // litera 'n' adaugare
            if (eventElement.ctrlKey) {
                sepropaga = false;
                bAdaugare_Click();
            }
            break;
        case 76:    // litera 'l'
            if (eventElement.ctrlKey) {
                sepropaga = false;
                $get("tbFiltruCodAngajat").focus();
            }
            break;
        case 68:    // litera 'd' stergere
            if (eventElement.ctrlKey) {
                sepropaga = false;
                bStergere_Click();
            }
            break;
        case 82:    // litera 'r'
            if (eventElement.ctrlKey) {
                sepropaga = false;
                SetariValori();
            }
            break;
        case 85:    // litera 'u'
            if (eventElement.ctrlKey) {
                sepropaga = false;
                $get("tbPaginaCurenta").focus();
            }
            break;
        case 83:    // litera 's' salveaza
            if (eventElement.ctrlKey) {
                sepropaga = false;
                bOk_Click();
            }
            break;
    }
    if (sepropaga) {
        return true;
    }
    else {
        eventElement.cancelBubble = true;
        eventElement.returnValue = false;
        eventElement.keyParolae = 0;
        if (eventElement.stopPropagation) {
            eventElement.stopPropagation();
            eventElement.preventDefault();
        }
        return false;
    }
}
function pageLoad() 
{
    $addHandler(document,"keydown",onKeyDown);
    Lista('');
} 
if (typeof(Sys) !== "undefined") Sys.Application.notifyScriptLoaded();
