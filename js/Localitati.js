// Localitati.js
function Lista(Find)  
{
    $get('up').style.display = '';
    var oFiltruLocalitati = new WbmOlimpias.FiltruLocalitatiObiect();
    oFiltruLocalitati.Find = Find;
    oFiltruLocalitati.FiltruLocalitate = $get("tbFiltruLocalitate").value;
    WbmOlimpias.LocalitatiWS.LocalitatiLista(oFiltruLocalitati, $get("tbPaginaCurenta").value, SucceededCallback, FailedCallback);
}
function Proprietati()
{
    var Id = $get("hfId").value;
    if(Id=='')
    {
        $get("tbLocalitate").focus();
        $get("tbLocalitate").value = "";
    }
    else
    {
        $get('up').style.display = '';
        WbmOlimpias.LocalitatiWS.LocalitateProprietati(Id, SucceededCallback, FailedCallback);
    }
}
function Adaugare()
{
    $get('up').style.display = '';
    var oLocalitate = new WbmOlimpias.LocalitateObiect();
    oLocalitate.Id = '';
    oLocalitate.Localitate = $get("tbLocalitate").value;
    WbmOlimpias.LocalitatiWS.LocalitateAdaugare(oLocalitate, SucceededCallback, FailedCallback);
}
function Modificare()
{
    $get('up').style.display = '';
    var oLocalitate = new WbmOlimpias.LocalitateObiect();
    oLocalitate.Id = $get("hfId").value;
    oLocalitate.Localitate = $get("tbLocalitate").value;
    WbmOlimpias.LocalitatiWS.LocalitateModificare(oLocalitate, SucceededCallback, FailedCallback);
}
function Stergere()
{
    if(confirm('Stergem randul selectat?'))
    {
        $get('up').style.display = '';
        WbmOlimpias.LocalitatiWS.LocalitateStergere($get("hfId").value, SucceededCallback, FailedCallback);
    }
}
function SucceededCallback(result, userContext, methodName)
{ 
    $get('up').style.display = 'none';
    switch(methodName)
    {
        case ("LocalitatiLista"):
        {
            var mytable=$get("tLocalitati");
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
                newcell.id = 'Localitate_' + i.toString();
                newcell.className = 'neselectat';
                newcell.innerHTML = '&nbsp;' + result.Tabela[item].Localitate;
                newcell.title = result.Tabela[item].Localitate;
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
            break;
        }
        case ("LocalitateProprietati"):
        {
            $get("tbLocalitate").value = result.Localitate;
            $get("tbFiltruLocalitate").focus();
            break;
        }
        case ("LocalitateAdaugare"):
        {
            if(result.Eroare=='')
                Lista(result.Id);
            else
                window.alert(result.Eroare);
            break;
        }
        case ("LocalitateModificare"):
        {
            if(result.Eroare=='')
                Lista(result.Id);
            else
                window.alert(result.Eroare);
            break;
        }
        case ("LocalitateStergere"):
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
    $get("Localitate_" + $get("hfRowIndex").value).className = 'selectat';
}
function RowUnselect()
{
    var obiect = $get("Localitate_" + $get("hfRowIndex").value);
    if(obiect!=null)
        obiect.className = 'neselectat';
}
function SetariValori() {
    if (window.dialogArguments && dialogArguments.location) {
        var Id = $get('hfId').value;
        var Localitate = $get('tbLocalitate').value;
        var Argumente = new Array(Id, Localitate);
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
            if(eventElement.target.id=='tbLocalitate')
            {
                $get("bOk").focus();
                sepropaga = false;
            }
            if(eventElement.target.id=='tbFiltruLocalitate')
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
                $get("tbLocalitate").focus();
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
                $get("tbFiltruLocalitate").focus();
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
