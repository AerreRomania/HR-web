// Roluri.js
function Lista(Find)  
{
    $get('up').style.display = '';
    var fbdco = new WbmOlimpias.FiltruRoluriObiect();
    fbdco.Find = Find;
    fbdco.FiltruRol = $get('tbFiltruRol').value;
    WbmOlimpias.RoluriWS.RoluriLista(fbdco, $get('tbPaginaCurenta').value, SucceededCallback, FailedCallback);
}
function Proprietati()
{
    var Id = $get('hfId').value;
    if(Id=='')
    {
        $get('tbRol').value = '';
        PaginiRol_Lista();
    }
    else
    {
        $get('up').style.display = '';
        WbmOlimpias.RoluriWS.RolProprietati(Id, SucceededCallback, FailedCallback);
    }
}
function Adaugare()
{
    $get('up').style.display = '';
    var bdco = new WbmOlimpias.RolObiect();
    bdco.Rol = $get('tbRol').value;
    WbmOlimpias.RoluriWS.RolAdaugare(bdco, SucceededCallback, FailedCallback);
}
function Modificare()
{
    $get('up').style.display = '';
    var bdco = new WbmOlimpias.RolObiect();
    bdco.Id = $get("hfId").value;
    bdco.Rol = $get('tbRol').value;
    WbmOlimpias.RoluriWS.RolModificare(bdco, SucceededCallback, FailedCallback);
}
function Stergere()
{
    if(confirm('Stergem randul selectat?'))
    {
        $get('up').style.display = '';
        WbmOlimpias.RoluriWS.RolStergere($get('hfId').value, SucceededCallback, FailedCallback);
    }
}
function SucceededCallback(result, userContext, methodName)
{ 
    $get('up').style.display = 'none';
    switch(methodName)
    {
        case ('RoluriLista'):
        {
            var mytable=$get('tRoluri');
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
                newcell.id = 'Rol_' + i.toString();
                newcell.className = 'neselectat';
                newcell.innerHTML = result.Tabela[item].Rol;
                newcell.title = result.Tabela[item].Rol;
                newcell=newrow.insertCell(-1);
                newcell.id = 'Id_' + i.toString();
                newcell.title = result.Tabela[item].Id;
                if(i==result.IndexRand)
                    SchimbareRand(i.toString());
                i++;
            }
            if(i==0)
                SchimbareRand('');
            $get('tbPaginaCurenta').value = result.PaginaCurenta;
            $get('tbNumarPagini').value = result.NumarPagini;
            break;
        }
        case ('RolProprietati'):
        {
            $get('tbRol').value = result.Rol;
            PaginiRol_Lista();
            break;
        }
        case ('RolAdaugare'):
        {
            if(result.Eroare=='')
                Lista(result.Id);
            else
                window.alert(result.Eroare);
            break;
        }
        case ('RolModificare'):
        {
            if(result.Eroare=='')
                Lista(result.Id);
            else
                window.alert(result.Eroare);
            break;
        }
        case ('RolStergere'):
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
    $get('Rol_' + $get('hfRowIndex').value).className = 'selectat';
}
function RowUnselect()
{
    var obiect = $get('Rol_' + $get('hfRowIndex').value);
    if(obiect!=null)
    {
        obiect.className = 'neselectat';
        $get('Rol_' + $get('hfRowIndex').value).className = 'neselectat';
    }
}
function SetariValori()
{
    if(window.dialogArguments && dialogArguments.location)
    {
        var Id = $get('hfId').value;
        var Rol = $get('tbRol').value;
        var Argumente = new Array(Id,Rol);
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
            if (eventElement.target.id == 'tbPaginaCurenta')
                Lista('');
            if(eventElement.target.id=='tbFiltruRol')
                Lista('');
            if(eventElement.target.id=='tbRol') {
                sepropaga = false;
                $get('bOk').focus();
            }
            if(eventElement.target.id=='PaginiRol_tbPagina')
                PaginiRol_Pagina();
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
            if (eventElement.ctrlKey) {
                sepropaga = false;
                RowPrevious();
            }
            break;
        case 40:    // sageata jos
            if (eventElement.ctrlKey) {
                sepropaga = false;
                RowNext();
            }
            break;
        case 77:    // litera 'm' modificare
            if (eventElement.ctrlKey) {
                sepropaga = false;
                $get('tbRol').focus();
            }
            if (eventElement.altKey) {
                sepropaga = false;
                $get('PaginiRol_tbPagina').focus();
            }
            break;
        case 78:    // litera 'n' adaugare
            if (eventElement.ctrlKey) {
                sepropaga = false;
                bAdaugare_Click();
            }
            if (eventElement.altKey)
                PaginiRol_bAdaugare_Click();
            break;
        case 76:    // litera 'l'
            if (eventElement.ctrlKey) {
                sepropaga = false;
                $get('tbFiltruRol').focus();
            }
            break;
        case 68:    // litera 'd' stergere
            if (eventElement.ctrlKey) {
                sepropaga = false;
                bStergere_Click();
            }
            if (eventElement.altKey)
                PaginiRol_bStergere_Click();
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
                $get('tbPaginaCurenta').focus();
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
    $addHandler(document,'keydown',onKeyDown);
    Lista('');
} 
if (typeof(Sys) !== 'undefined') Sys.Application.notifyScriptLoaded();
