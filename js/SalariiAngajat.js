// SalariiAngajat.js
function Lista(Find)  
{
    $get('up').style.display = '';
    var oFiltruSalariiAngajat = new WbmOlimpias.FiltruSalariiAngajatObiect();
    oFiltruSalariiAngajat.Find = Find;
    oFiltruSalariiAngajat.FiltruData = $get("tbFiltruData").value;
    WbmOlimpias.SalariiAngajatWS.SalariiAngajatLista(oFiltruSalariiAngajat, $get("tbPaginaCurenta").value, $get("hfIdAngajat").value, SucceededCallback, FailedCallback);
}
function Proprietati()
{
    var Id = $get("hfId").value;
    if(Id=='')
    {
        $get("tbDataSalariu").focus();
        $get("tbDataSalariu").value = "";
        $get("tbMarireSalar").value = "";
        $get("tbSalarActual").value = "";
    }
    else
    {
        $get('up').style.display = '';
        WbmOlimpias.SalariiAngajatWS.SalariuAngajatProprietati(Id, SucceededCallback, FailedCallback);
    }
}
function Adaugare()
{
    $get('up').style.display = '';
    var oSalariuAngajat = new WbmOlimpias.SalariuAngajatObiect();
    oSalariuAngajat.Id = '';
    oSalariuAngajat.IdAngajat = $get("hfIdAngajat").value;
    oSalariuAngajat.DataSalariu = $get("tbDataSalariu").value;
    oSalariuAngajat.MarireSalar = $get("tbMarireSalar").value;
    oSalariuAngajat.SalarActual = $get("tbSalarActual").value;
    WbmOlimpias.SalariiAngajatWS.SalariuAngajatAdaugare(oSalariuAngajat, SucceededCallback, FailedCallback);
}
function Modificare()
{
    $get('up').style.display = '';
    var oSalariuAngajat = new WbmOlimpias.SalariuAngajatObiect();
    oSalariuAngajat.Id = $get("hfId").value;
    oSalariuAngajat.IdAngajat = $get("hfIdAngajat").value;
    oSalariuAngajat.DataSalariu = $get("tbDataSalariu").value;
    oSalariuAngajat.MarireSalar = $get("tbMarireSalar").value;
    oSalariuAngajat.SalarActual = $get("tbSalarActual").value;
    WbmOlimpias.SalariiAngajatWS.SalariuAngajatModificare(oSalariuAngajat, SucceededCallback, FailedCallback);
}
function Stergere()
{
    if(confirm('Stergem randul selectat?'))
    {
        $get('up').style.display = '';
        WbmOlimpias.SalariiAngajatWS.SalariuAngajatStergere($get("hfId").value, SucceededCallback, FailedCallback);
    }
}
function SucceededCallback(result, userContext, methodName) {
    $get('up').style.display = 'none';
    switch (methodName) {
        case ("SalariiAngajatLista"):
            {
                var mytable = $get("tSalariiAngajat");
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
                    newcell.id = 'DataSalariu_' + i.toString();
                    newcell.className = 'neselectat';
                    newcell.innerHTML = '&nbsp;' + result.Tabela[item].DataSalariu;
                    newcell.title = result.Tabela[item].DataSalariu;

                    newcell = newrow.insertCell(-1);
                    newcell.id = 'MarireSalar_' + i.toString();
                    newcell.className = 'neselectat';
                    newcell.innerHTML = '&nbsp;' + result.Tabela[item].MarireSalar;
                    newcell.title = result.Tabela[item].MarireSalar;

                    newcell = newrow.insertCell(-1);
                    newcell.id = 'SalarActual_' + i.toString();
                    newcell.className = 'neselectat';
                    newcell.innerHTML = '&nbsp;' + result.Tabela[item].SalarActual;
                    newcell.title = result.Tabela[item].SalarActual;

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
        case ("SalariuAngajatProprietati"):
            {
                $get("tbDataSalariu").value = result.DataSalariu;
                $get("tbMarireSalar").value = result.MarireSalar;
                $get("tbSalarActual").value = result.SalarActual;
                $get("tbFiltruData").focus();
                break;
            }
        case ("SalariuAngajatAdaugare"):
            {
                if (result.Eroare == '')
                    Lista(result.Id);
                else
                    window.alert(result.Eroare);
                break;
            }
        case ("SalariuAngajatModificare"):
            {
                if (result.Eroare == '')
                    Lista(result.Id);
                else
                    window.alert(result.Eroare);
                break;
            }
        case ("SalariuAngajatStergere"):
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
    $get("DataSalariu_" + $get("hfRowIndex").value).className = 'selectat';
    $get("MarireSalar_" + $get("hfRowIndex").value).className = 'selectat';
    $get("SalarActual_" + $get("hfRowIndex").value).className = 'selectat';
}
function RowUnselect()
{
    var obiect = $get("DataSalariu_" + $get("hfRowIndex").value);
    if (obiect != null)
        obiect.className = 'neselectat';
    obiect = $get("MarireSalar_" + $get("hfRowIndex").value);
    if (obiect != null)
        obiect.className = 'neselectat';
    obiect = $get("SalarActual_" + $get("hfRowIndex").value);
    if (obiect != null)
        obiect.className = 'neselectat';
}
function SetariValori() {
    if (window.dialogArguments && dialogArguments.location) {
        var Id = $get('hfId').value;
        var DataSalariu = $get('tbDataSalariu').value;
        var Argumente = new Array(Id, DataSalariu);
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
            if (eventElement.target.id == 'tbDataSalariu') {
                sepropaga = false;
                $get("tbMarireSalar").focus();
            }
            if (eventElement.target.id == 'tbMarireSalar') {
                sepropaga = false;
                $get("tbSalarActual").focus();
            }
            if (eventElement.target.id == 'tbSalarActual') {
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
                $get("tbSalariuData").focus();
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
