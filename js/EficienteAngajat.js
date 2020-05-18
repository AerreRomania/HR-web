// EficienteAngajat.js
function Lista(Find)  
{
    $get('up').style.display = '';
    var oFiltruEficienteAngajat = new WbmOlimpias.FiltruEficienteAngajatObiect();
    oFiltruEficienteAngajat.Find = Find;
    oFiltruEficienteAngajat.FiltruEficienta = $get("tbFiltruData").value;
    WbmOlimpias.EficienteAngajatWS.EficienteAngajatLista(oFiltruEficienteAngajat, $get("tbPaginaCurenta").value, $get("hfIdAngajat").value, SucceededCallback, FailedCallback);
}
function Proprietati()
{
    var Id = $get("hfId").value;
    if(Id=='')
    {
        $get("tbEficienta").focus();
        $get("tbEficienta").value = "";
        $get("tbDataEficienta").value = "";
    }
    else
    {
        $get('up').style.display = '';
        WbmOlimpias.EficienteAngajatWS.EficientaAngajatProprietati(Id, SucceededCallback, FailedCallback);
    }
}
function Adaugare()
{
    $get('up').style.display = '';
    var oEficientaAngajat = new WbmOlimpias.EficientaAngajatObiect();
    oEficientaAngajat.Id = '';
    oEficientaAngajat.IdAngajat = $get("hfIdAngajat").value;
    oEficientaAngajat.Eficienta = $get("tbEficienta").value;
    oEficientaAngajat.DataEficienta = $get("tbDataEficienta").value;
    WbmOlimpias.EficienteAngajatWS.EficientaAngajatAdaugare(oEficientaAngajat, SucceededCallback, FailedCallback);
}
function Modificare()
{
    $get('up').style.display = '';
    var oEficientaAngajat = new WbmOlimpias.EficientaAngajatObiect();
    oEficientaAngajat.Id = $get("hfId").value;
    oEficientaAngajat.IdAngajat = $get("hfIdAngajat").value;
    oEficientaAngajat.Eficienta = $get("tbEficienta").value;
    oEficientaAngajat.DataEficienta = $get("tbDataEficienta").value;
    WbmOlimpias.EficienteAngajatWS.EficientaAngajatModificare(oEficientaAngajat, SucceededCallback, FailedCallback);
}
function Stergere()
{
    if(confirm('Stergem randul selectat?'))
    {
        $get('up').style.display = '';
        WbmOlimpias.EficienteAngajatWS.EficientaAngajatStergere($get("hfId").value, SucceededCallback, FailedCallback);
    }
}
function SucceededCallback(result, userContext, methodName) {
    $get('up').style.display = 'none';
    switch (methodName) {
        case ("EficienteAngajatLista"):
            {
                var mytable = $get("tEficienteAngajat");
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
                    newcell.id = 'Eficienta_' + i.toString();
                    newcell.className = 'neselectat';
                    newcell.innerHTML = '&nbsp;' + result.Tabela[item].Eficienta;
                    newcell.title = result.Tabela[item].Eficienta;
                    newcell = newrow.insertCell(-1);
                    newcell.id = 'DataEficienta_' + i.toString();
                    newcell.className = 'neselectat';
                    newcell.innerHTML = '&nbsp;' + result.Tabela[item].DataEficienta;
                    newcell.title = result.Tabela[item].DataEficienta;

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
        case ("EficientaAngajatProprietati"):
            {
                $get("tbEficienta").value = result.Eficienta;
                $get("tbDataEficienta").value = result.DataEficienta;
                $get("tbFiltruData").focus();
                break;
            }
        case ("EficientaAngajatAdaugare"):
            {
                if (result.Eroare == '')
                    Lista(result.Id);
                else
                    window.alert(result.Eroare);
                break;
            }
        case ("EficientaAngajatModificare"):
            {
                if (result.Eroare == '')
                    Lista(result.Id);
                else
                    window.alert(result.Eroare);
                break;
            }
        case ("EficientaAngajatStergere"):
            {
                if (result == '')
                    Lista('');
                else
                    window.alert(result);
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
function RowSelect()
{
    $get("Eficienta_" + $get("hfRowIndex").value).className = 'selectat';
    $get("DataEficienta_" + $get("hfRowIndex").value).className = 'selectat';
}
function RowUnselect()
{
    var obiect = $get("Eficienta_" + $get("hfRowIndex").value);
    if(obiect!=null)
        obiect.className = 'neselectat';
    obiect = $get("DataEficienta_" + $get("hfRowIndex").value);
    if (obiect != null)
        obiect.className = 'neselectat';
}
function SetariValori() {
    if (window.dialogArguments && dialogArguments.location) {
        var Id = $get('hfId').value;
        var Eficienta = $get('tbEficienta').value;
        var DataEficienta = $get('tbDataEficienta').value;
        var Argumente = new Array(Id, Eficienta, DataEficienta);
        window.returnValue = Argumente;
        close();
    }
}
function onKeyDown (eventElement) 
{
    //window.alert(eventElement.keyParolae);
    eventElement = eventElement || window.event;
    var sepropaga = true;
    switch (eventElement.keyCode) 
    {
        case 13:    // enter
            if(eventElement.target.id=='tbEficienta') {
                sepropaga = false;
                $get("tbDataEficienta").focus();
            }
            if (eventElement.target.id == 'tbDataEficienta') {
                sepropaga = false;
                $get("bOk").focus();
            }
            if (eventElement.target.id == 'tbFiltruData')
                Lista('');
            if(eventElement.target.id=='tbPaginaCurenta')
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
        case 38:    // sageata sus
            RowPrevious(); 
            break; 
        case 40:    // sageata jos
            RowNext(); 
            break;
        case 77:    // litera 'm' modificare
            if (eventElement.ctrlKey) {
                sepropaga = false;
                $get("tbEficienta").focus();
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
                $get("tbFiltruData").focus();
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
    if(sepropaga)
    {
        return true;
    }
    else
    {
        eventElement.cancelBubble = true;
        eventElement.returnValue = false;
        eventElement.keyParolae = 0;
        if (eventElement.stopPropagation) 
        {
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
