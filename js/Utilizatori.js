// Utilizatori.js
function Lista(Find)  
{
    $get('up').style.display = '';
    var oFiltruUtilizatori = new WbmOlimpias.FiltruUtilizatoriObiect();
    oFiltruUtilizatori.Find = Find;
    oFiltruUtilizatori.FiltruUtilizator = $get("tbFiltruUtilizator").value;
    WbmOlimpias.UtilizatoriWS.UtilizatoriLista(oFiltruUtilizatori, $get("tbPaginaCurenta").value, SucceededCallback, FailedCallback);

}
function Proprietati()
{
    var Id = $get("hfId").value;
    if(Id==='')
    {
        $get("tbParola").value = "";
        $get("tbUtilizator").focus();
        $get("tbUtilizator").value = "";
        $get("hfIdRol").value = "";
        $get("tbRol").value = "";
    }
    else
    {
        $get('up').style.display = '';
        WbmOlimpias.UtilizatoriWS.UtilizatorProprietati(Id, SucceededCallback, FailedCallback);
    }
}
function Adaugare()
{
    $get('up').style.display = '';
    var oUtilizator = new WbmOlimpias.UtilizatorObiect();
    oUtilizator.Id = '';
    oUtilizator.Parola = $get("tbParola").value;
    oUtilizator.Utilizator = $get("tbUtilizator").value;
    var oRol = new WbmOlimpias.RolObiect();
    oRol.Id = $get("hfIdRol").value;
    oUtilizator.oRol = oRol;
    WbmOlimpias.UtilizatoriWS.UtilizatorAdaugare(oUtilizator, SucceededCallback, FailedCallback);
}
function Modificare()
{
    $get('up').style.display = '';
    var oUtilizator = new WbmOlimpias.UtilizatorObiect();
    oUtilizator.Id = $get("hfId").value;
    oUtilizator.Parola = $get("tbParola").value;
    oUtilizator.Utilizator = $get("tbUtilizator").value;
    var oRol = new WbmOlimpias.RolObiect();
    oRol.Id = $get("hfIdRol").value;
    oUtilizator.oRol = oRol;
    WbmOlimpias.UtilizatoriWS.UtilizatorModificare(oUtilizator, SucceededCallback, FailedCallback);
}
function Stergere()
{
    if(confirm('Stergem randul selectat?'))
    {
        $get('up').style.display = '';
        WbmOlimpias.UtilizatoriWS.UtilizatorStergere($get("hfId").value, SucceededCallback, FailedCallback);
    }
}
function Rol()
{
    $get('up').style.display = '';
    WbmOlimpias.UtilizatoriWS.RolCautare($get('tbRol').value, SucceededCallback, FailedCallback);
}
function SucceededCallback(result, userContext, methodName)
{ 
    $get('up').style.display = 'none';
    switch(methodName)
    {
        case ("UtilizatoriLista"):
        {
            var mytable=$get("tUtilizatori");
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
                newcell.id = 'Utilizator_' + i.toString();
                newcell.className = 'neselectat';
                newcell.innerHTML = '&nbsp;' + result.Tabela[item].Utilizator;
                newcell.title = result.Tabela[item].Utilizator;
                newcell=newrow.insertCell(-1);
                newcell.id = 'Rol_' + i.toString();
                newcell.className = 'neselectat';
                newcell.innerHTML = '&nbsp;' + result.Tabela[item].oRol.Rol;
                newcell.title = result.Tabela[item].oRol.Rol;
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
        case ("UtilizatorProprietati"):
        {
            $get("tbParola").value = result.Parola;
            $get("tbUtilizator").value = result.Utilizator;
            $get("hfIdRol").value = result.oRol.Id;
            $get("tbRol").value = result.oRol.Rol;
            $get("tbFiltruUtilizator").focus();
            break;
        }
        case ("UtilizatorAdaugare"):
        {
            if(result.Eroare==='')
                Lista(result.Id);
            else
                window.alert(result.Eroare);
            break;
        }
        case ("UtilizatorModificare"):
        {
            if(result.Eroare==='')
                Lista(result.Id);
            else
                window.alert(result.Eroare);
            break;
        }
        case ("UtilizatorStergere"):
        {
            if(result=='')
                Lista('');
            else
                window.alert(result);
            break;
        }
        case ('RolCautare'):
        {
            if(result.Id!=='')
            {
                $get('hfIdRol').value = result.Id;
                $get('tbRol').value = result.Rol;
                $get('bOk').focus();
            }
            else
                bRol_Click();
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
    $get("Rol_" + $get("hfRowIndex").value).className = 'selectat';
    $get("Utilizator_" + $get("hfRowIndex").value).className = 'selectat';
}
function RowUnselect()
{
    var obiect = $get("Rol_" + $get("hfRowIndex").value);
    if(obiect!=null)
        obiect.className = 'neselectat';
    obiect = $get("Utilizator_" + $get("hfRowIndex").value);
    if(obiect!=null)
        obiect.className = 'neselectat';
}
function SetariValori() {
    if (window.dialogArguments && dialogArguments.location) {
        var Id = $get('hfId').value;
        var Utilizator = $get('tbUtilizator').value;
        var Argumente = new Array(Id, Utilizator);
        window.returnValue = Argumente;
        close();
    }
}
function bRol_Click()
{
    var rezultat = window.showModalDialog('Roluri.aspx', window, 'center:yes;resizable:no;dialogHeight:590px;dialogWidth:645px;');
    if (rezultat !== null)
    {
        $get('hfIdRol').value = rezultat[0].toString();
        $get('tbRol').value = rezultat[1].toString();
        $get('bOk').focus();
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
            if(eventElement.target.id==='tbParola')
            {
                $get("tbRol").focus();
                sepropaga = false;
            }
            if(eventElement.target.id==='tbUtilizator')
            {
                $get("tbParola").focus();
                sepropaga = false;
            }
            if(eventElement.target.id==='tbRol')
                Rol();
            if(eventElement.target.id==='tbFiltruUtilizator')
                Lista('');
            if(eventElement.target.id==='tbPaginaCurenta')
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
                $get("tbUtilizator").focus();
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
                $get("tbFiltruUtilizator").focus();
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
