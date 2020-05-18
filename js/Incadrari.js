// Incadrari.js
function Lista(Find)  
{
    $get('up').style.display = '';
    var oFiltruIncadrari = new WbmOlimpias.FiltruIncadrariObiect();
    oFiltruIncadrari.Find = Find;
    oFiltruIncadrari.FiltruCodIncadrare = $get("tbFiltruCodIncadrare").value;
    oFiltruIncadrari.FiltruIncadrare = $get("tbFiltruIncadrare").value;
    WbmOlimpias.IncadrariWS.IncadrariLista(oFiltruIncadrari, $get("tbPaginaCurenta").value, SucceededCallback, FailedCallback);
}
function Proprietati()
{
    var Id = $get("hfId").value;
    if(Id=='')
    {
        $get("tbCodIncadrare").focus();
        $get("tbCodIncadrare").value = "";
        $get("tbIncadrare").value = "";
    }
    else
    {
        $get('up').style.display = '';
        WbmOlimpias.IncadrariWS.IncadrareProprietati(Id, SucceededCallback, FailedCallback);
    }
}
function Adaugare()
{
    $get('up').style.display = '';
    var oIncadrare = new WbmOlimpias.IncadrareObiect();
    oIncadrare.Id = '';
    oIncadrare.CodIncadrare = $get("tbCodIncadrare").value;
    oIncadrare.Incadrare = $get("tbIncadrare").value;
    WbmOlimpias.IncadrariWS.IncadrareAdaugare(oIncadrare, SucceededCallback, FailedCallback);
}
function Modificare()
{
    $get('up').style.display = '';
    var oIncadrare = new WbmOlimpias.IncadrareObiect();
    oIncadrare.Id = $get("hfId").value;
    oIncadrare.CodIncadrare = $get("tbCodIncadrare").value;
    oIncadrare.Incadrare = $get("tbIncadrare").value;
    WbmOlimpias.IncadrariWS.IncadrareModificare(oIncadrare, SucceededCallback, FailedCallback);
}
function Stergere()
{
    if(confirm('Stergem randul selectat?'))
    {
        $get('up').style.display = '';
        WbmOlimpias.IncadrariWS.IncadrareStergere($get("hfId").value, SucceededCallback, FailedCallback);
    }
}
function SucceededCallback(result, userContext, methodName) {
    $get('up').style.display = 'none';
    switch (methodName) {
        case ("IncadrariLista"):
            {
                var mytable = $get("tIncadrari");
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
                    newcell.id = 'CodIncadrare_' + i.toString();
                    newcell.className = 'neselectat';
                    newcell.innerHTML = '&nbsp;' + result.Tabela[item].CodIncadrare;
                    newcell.title = result.Tabela[item].CodIncadrare;
                    newcell = newrow.insertCell(-1);
                    newcell.id = 'Incadrare_' + i.toString();
                    newcell.className = 'neselectat';
                    newcell.innerHTML = '&nbsp;' + result.Tabela[item].Incadrare;
                    newcell.title = result.Tabela[item].Incadrare;
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
        case ("IncadrareProprietati"):
            {
                $get("tbCodIncadrare").value = result.CodIncadrare;
                $get("tbIncadrare").value = result.Incadrare;
                $get("tbFiltruCodIncadrare").focus();
                break;
            }
        case ("IncadrareAdaugare"):
            {
                if (result.Eroare == '')
                    Lista(result.Id);
                else
                    window.alert(result.Eroare);
                break;
            }
        case ("IncadrareModificare"):
            {
                if (result.Eroare == '')
                    Lista(result.Id);
                else
                    window.alert(result.Eroare);
                break;
            }
        case ("IncadrareStergere"):
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
    $get("CodIncadrare_" + $get("hfRowIndex").value).className = 'selectat';
    $get("Incadrare_" + $get("hfRowIndex").value).className = 'selectat';
}
function RowUnselect()
{
    var obiect = $get("CodIncadrare_" + $get("hfRowIndex").value);
    if(obiect!=null)
        obiect.className = 'neselectat';
    obiect = $get("Incadrare_" + $get("hfRowIndex").value);
    if (obiect != null)
        obiect.className = 'neselectat';
}
function SetariValori() {
    if (window.dialogArguments && dialogArguments.location) {
        var Id = $get('hfId').value;
        var CodIncadrare = $get('tbCodIncadrare').value;
        var Incadrare = $get('tbIncadrare').value;
        var Argumente = new Array(Id, CodIncadrare, Incadrare);
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
            if(eventElement.target.id=='tbCodIncadrare') {
                sepropaga = false;
                $get("tbIncadrare").focus();
            }
            if (eventElement.target.id == 'tbIncadrare') {
                sepropaga = false;
                $get("bOk").focus();

            }
            if (eventElement.target.id == 'tbFiltruCodIncadrare')
                Lista('');
            if(eventElement.target.id=='tbFiltruIncadrare')
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
                $get("tbIncadrare").focus();
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
                $get("tbFiltruCodIncadrare").focus();
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
