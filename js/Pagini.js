// Pagini.js
function Lista(Find)  
{
    $get('up').style.display = '';
    var fao = new WbmOlimpias.FiltruPaginiObiect();
    fao.Find = Find;
    fao.FiltruPagina = $get("tbFiltruPagina").value;
    WbmOlimpias.PaginiWS.PaginiLista(fao, $get("tbPaginaCurenta").value, SucceededCallback, FailedCallback);
}
function Proprietati()
{
    var Id = $get("hfId").value;
    if(Id=='')
    {
        $get("tbPagina").focus();
        $get("tbPagina").value = $get("tbFiltruPagina").value;
    }
    else
    {
        $get('up').style.display = '';
        WbmOlimpias.PaginiWS.PaginaProprietati(Id, SucceededCallback, FailedCallback);
    }
}
function Adaugare()
{
    $get('up').style.display = '';
    var ao = new WbmOlimpias.PaginaObiect();
    ao.Id = '';
    ao.Pagina = $get("tbPagina").value;
    ao.Eroare = '';
    WbmOlimpias.PaginiWS.PaginaAdaugare(ao, SucceededCallback, FailedCallback);
}
function Modificare()
{
    $get('up').style.display = '';
    var ao = new WbmOlimpias.PaginaObiect();
    ao.Id = $get("hfId").value;
    ao.Pagina = $get("tbPagina").value;
    WbmOlimpias.PaginiWS.PaginaModificare(ao, SucceededCallback, FailedCallback);
}
function Stergere()
{
    if(confirm('Stergem randul selectat?'))
    {
        $get('up').style.display = '';
        WbmOlimpias.PaginiWS.PaginaStergere($get("hfId").value, SucceededCallback, FailedCallback);
    }
}
function SucceededCallback(result, userPaginaext, methodName)
{ 
    $get('up').style.display = 'none';
    switch(methodName)
    {
        case ("PaginiLista"):
        {
            var mytable=$get("tPagini");
            while(mytable.rows.length>1)
            {
                mytable.deleteRow(1);
            }
            var i = 0;
            for(var item in result.Tabela)
            {    
                var newrow=mytable.insertRow(-1);
                newrow.id = i.toString();
                newrow.onclick = RowClick;
                newrow.ondblclick = SetariValori;
                var newcell=newrow.insertCell(-1);
                newcell.id = 'Pagina_' + i.toString();
                newcell.className = 'neselectat';
                newcell.innerHTML = '&nbsp;' + result.Tabela[item].Pagina;
                newcell.title = result.Tabela[item].Pagina;
                newcell=newrow.insertCell(-1);
                newcell.id = 'Id_' + i.toString();
                newcell.title = result.Tabela[item].Id;
                if(i==result.IndexRand)
                    SchimbareRand(i.toString());
                i++;
            }
            if(i==0)
                SchimbareRand('');
            $get("tbPaginaCurenta").value = result.PaginaCurenta;
            $get("tbNumarPagini").value = result.NumarPagini;
            $get("tbFiltruPagina").focus();
            break;
        }
        case ("PaginaProprietati"):
        {
            $get("tbPagina").value = result.Pagina;
            break;
        }
        case ("PaginaAdaugare"):
        {
            if(result.Eroare=='')
                Lista(result.Id);
            else
                window.alert(result.Eroare);
            break;
        }
        case ("PaginaModificare"):
        {
            if(result.Eroare=='')
                Lista(result.Id);
            else
                window.alert(result.Eroare);
            break;
        }
        case ("PaginaStergere"):
        {
            if(result=='')
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
function FailedCallback(error, userPaginaext, methodName) 
{
    $get('up').style.display = 'none';
    if(error !== null) 
    {
        window.alert(error.get_message());
    }
}
function RowSelect()
{
    $get("Pagina_" + $get("hfRowIndex").value).className = 'selectat';
}
function RowUnselect()
{
    var obiect = $get("Pagina_" + $get("hfRowIndex").value);
    if(obiect!=null)
        obiect.className = 'neselectat';
}
function SetariValori()
{
    if(window.dialogArguments && dialogArguments.location)
    {
        var Id = $get('hfId').value;
        var Pagina = $get('tbPagina').value;
        var Argumente = new Array(Id,Pagina);
        window.returnValue = Argumente;
        close();
    }
}
function onKeyDown (eventElement) 
{
    //window.alert(eventElement.keyCode);
    eventElement = eventElement || window.event;
    var sepropaga = true;
    switch (eventElement.keyCode) 
    {
        case 13:    // enter
            if (eventElement.target.id == 'tbPagina') {
                sepropaga = false;
                $get("bOk").focus();
            }
            if (eventElement.target.id == 'tbFiltruPagina')
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
        case 38:    // sageata sus
            RowPrevious(); 
            break; 
        case 40:    // sageata jos
            RowNext(); 
            break;
        case 77:    // litera 'm' modificare
            if (eventElement.ctrlKey) {
                sepropaga = false;
                $get("tbPagina").focus();
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
                $get("tbFiltruPagina").focus();
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
                window.close();
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
        eventElement.keyCode = 0;
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
