// PosturiDeLucru.js
function Lista(Find)  
{
    $get('up').style.display = '';
    var oFiltruPosturiDeLucru = new WbmOlimpias.FiltruPosturiDeLucruObiect();
    oFiltruPosturiDeLucru.Find = Find;
    oFiltruPosturiDeLucru.FiltruCodPostDeLucru = $get("tbFiltruCodPostDeLucru").value;
    oFiltruPosturiDeLucru.FiltruPostDeLucru = $get("tbFiltruPostDeLucru").value;
    WbmOlimpias.PosturiDeLucruWS.PosturiDeLucruLista(oFiltruPosturiDeLucru, $get("tbPaginaCurenta").value, SucceededCallback, FailedCallback);
}
function Proprietati()
{
    var Id = $get("hfId").value;
    if(Id=='')
    {
        $get("tbCodPostDeLucru").focus();
        $get("tbCodPostDeLucru").value = "";
        $get("tbPostDeLucru").value = "";
        $get("tbNumarOrdonare").value = "";
    }
    else
    {
        $get('up').style.display = '';
        WbmOlimpias.PosturiDeLucruWS.PostDeLucruProprietati(Id, SucceededCallback, FailedCallback);
    }
}
function Adaugare()
{
    $get('up').style.display = '';
    var oPostDeLucru = new WbmOlimpias.PostDeLucruObiect();
    oPostDeLucru.Id = '';
    oPostDeLucru.CodPostDeLucru = $get("tbCodPostDeLucru").value;
    oPostDeLucru.PostDeLucru = $get("tbPostDeLucru").value;
    oPostDeLucru.NumarOrdonare = $get("tbNumarOrdonare").value;
    WbmOlimpias.PosturiDeLucruWS.PostDeLucruAdaugare(oPostDeLucru, SucceededCallback, FailedCallback);
}
function Modificare()
{
    $get('up').style.display = '';
    var oPostDeLucru = new WbmOlimpias.PostDeLucruObiect();
    oPostDeLucru.Id = $get("hfId").value;
    oPostDeLucru.CodPostDeLucru = $get("tbCodPostDeLucru").value;
    oPostDeLucru.PostDeLucru = $get("tbPostDeLucru").value;
    oPostDeLucru.NumarOrdonare = $get("tbNumarOrdonare").value;
    WbmOlimpias.PosturiDeLucruWS.PostDeLucruModificare(oPostDeLucru, SucceededCallback, FailedCallback);
}
function Stergere()
{
    if(confirm('Stergem randul selectat?'))
    {
        $get('up').style.display = '';
        WbmOlimpias.PosturiDeLucruWS.PostDeLucruStergere($get("hfId").value, SucceededCallback, FailedCallback);
    }
}
function SucceededCallback(result, userContext, methodName) {
    $get('up').style.display = 'none';
    switch (methodName) {
        case ("PosturiDeLucruLista"):
            {
                var mytable = $get("tPosturiDeLucru");
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
                    newcell.id = 'CodPostDeLucru_' + i.toString();
                    newcell.className = 'neselectat';
                    newcell.innerHTML = '&nbsp;' + result.Tabela[item].CodPostDeLucru;
                    newcell.title = result.Tabela[item].CodPostDeLucru;
                    newcell = newrow.insertCell(-1);
                    newcell.id = 'PostDeLucru_' + i.toString();
                    newcell.className = 'neselectat';
                    newcell.innerHTML = '&nbsp;' + result.Tabela[item].PostDeLucru;
                    newcell.title = result.Tabela[item].PostDeLucru;
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
        case ("PostDeLucruProprietati"):
            {
                $get("tbCodPostDeLucru").value = result.CodPostDeLucru;
                $get("tbPostDeLucru").value = result.PostDeLucru;
                $get("tbNumarOrdonare").value = result.NumarOrdonare;
                $get("tbFiltruCodPostDeLucru").focus();
                break;
            }
        case ("PostDeLucruAdaugare"):
            {
                if (result.Eroare == '')
                    Lista(result.Id);
                else
                    window.alert(result.Eroare);
                break;
            }
        case ("PostDeLucruModificare"):
            {
                if (result.Eroare == '')
                    Lista(result.Id);
                else
                    window.alert(result.Eroare);
                break;
            }
        case ("PostDeLucruStergere"):
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
    $get("CodPostDeLucru_" + $get("hfRowIndex").value).className = 'selectat';
    $get("PostDeLucru_" + $get("hfRowIndex").value).className = 'selectat';
}
function RowUnselect()
{
    var obiect = $get("CodPostDeLucru_" + $get("hfRowIndex").value);
    if(obiect!=null)
        obiect.className = 'neselectat';
    obiect = $get("PostDeLucru_" + $get("hfRowIndex").value);
    if (obiect != null)
        obiect.className = 'neselectat';
}
function SetariValori() {
    if (window.dialogArguments && dialogArguments.location) {
        var Id = $get('hfId').value;
        var CodPostDeLucru = $get('tbCodPostDeLucru').value;
        var PostDeLucru = $get('tbPostDeLucru').value;
        var Argumente = new Array(Id, CodPostDeLucru, PostDeLucru);
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
            if(eventElement.target.id=='tbCodPostDeLucru') {
                sepropaga = false;
                $get("tbPostDeLucru").focus();
            }
            if (eventElement.target.id == 'tbPostDeLucru') {
                sepropaga = false;
                $get("tbNumarOrdonare").focus();
            }
            if (eventElement.target.id == 'tbNumarOrdonare') {
                sepropaga = false;
                $get("bOk").focus();
            }
            if (eventElement.target.id == 'tbFiltruCodPostDeLucru')
                Lista('');
            if(eventElement.target.id=='tbFiltruPostDeLucru')
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
                $get("tbCodPostDeLucru").focus();
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
                $get("tbFiltruCodPostDeLucru").focus();
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
