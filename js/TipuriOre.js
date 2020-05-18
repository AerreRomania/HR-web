// TipuriOre.js
function Lista(Find)  
{
    $get('up').style.display = '';
    var oFiltruTipuriOre = new WbmOlimpias.FiltruTipuriOreObiect();
    oFiltruTipuriOre.Find = Find;
    oFiltruTipuriOre.FiltruCodTipOra = $get("tbFiltruCodTipOra").value;
    oFiltruTipuriOre.FiltruTipOra = $get("tbFiltruTipOra").value;
    WbmOlimpias.TipuriOreWS.TipuriOreLista(oFiltruTipuriOre, $get("tbPaginaCurenta").value, SucceededCallback, FailedCallback);
}
function Proprietati()
{
    var Id = $get("hfId").value;
    if(Id=='')
    {
        $get("tbCodTipOra").focus();
        $get("tbCodTipOra").value = "";
        $get("tbTipOra").value = "";
    }
    else
    {
        $get('up').style.display = '';
        WbmOlimpias.TipuriOreWS.TipOraProprietati(Id, SucceededCallback, FailedCallback);
    }
}
function Adaugare()
{
    $get('up').style.display = '';
    var oTipOra = new WbmOlimpias.TipOraObiect();
    oTipOra.Id = '';
    oTipOra.CodTipOra = $get("tbCodTipOra").value;
    oTipOra.TipOra = $get("tbTipOra").value;
    WbmOlimpias.TipuriOreWS.TipOraAdaugare(oTipOra, SucceededCallback, FailedCallback);
}
function Modificare()
{
    $get('up').style.display = '';
    var oTipOra = new WbmOlimpias.TipOraObiect();
    oTipOra.Id = $get("hfId").value;
    oTipOra.CodTipOra = $get("tbCodTipOra").value;
    oTipOra.TipOra = $get("tbTipOra").value;
    WbmOlimpias.TipuriOreWS.TipOraModificare(oTipOra, SucceededCallback, FailedCallback);
}
function Stergere()
{
    if(confirm('Stergem randul selectat?'))
    {
        $get('up').style.display = '';
        WbmOlimpias.TipuriOreWS.TipOraStergere($get("hfId").value, SucceededCallback, FailedCallback);
    }
}
function SucceededCallback(result, userContext, methodName) {
    $get('up').style.display = 'none';
    switch (methodName) {
        case ("TipuriOreLista"):
            {
                var mytable = $get("tTipuriOre");
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
                    newcell.id = 'CodTipOra_' + i.toString();
                    newcell.className = 'neselectat';
                    newcell.innerHTML = '&nbsp;' + result.Tabela[item].CodTipOra;
                    newcell.title = result.Tabela[item].CodTipOra;
                    newcell = newrow.insertCell(-1);
                    newcell.id = 'TipOra_' + i.toString();
                    newcell.className = 'neselectat';
                    newcell.innerHTML = '&nbsp;' + result.Tabela[item].TipOra;
                    newcell.title = result.Tabela[item].TipOra;
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
        case ("TipOraProprietati"):
            {
                $get("tbCodTipOra").value = result.CodTipOra;
                $get("tbTipOra").value = result.TipOra;
                $get("tbFiltruCodTipOra").focus();
                break;
            }
        case ("TipOraAdaugare"):
            {
                if (result.Eroare == '')
                    Lista(result.Id);
                else
                    window.alert(result.Eroare);
                break;
            }
        case ("TipOraModificare"):
            {
                if (result.Eroare == '')
                    Lista(result.Id);
                else
                    window.alert(result.Eroare);
                break;
            }
        case ("TipOraStergere"):
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
    $get("CodTipOra_" + $get("hfRowIndex").value).className = 'selectat';
    $get("TipOra_" + $get("hfRowIndex").value).className = 'selectat';
}
function RowUnselect()
{
    var obiect = $get("CodTipOra_" + $get("hfRowIndex").value);
    if(obiect!=null)
        obiect.className = 'neselectat';
    obiect = $get("TipOra_" + $get("hfRowIndex").value);
    if (obiect != null)
        obiect.className = 'neselectat';
}
function SetariValori() {
    if (window.dialogArguments && dialogArguments.location) {
        var Id = $get('hfId').value;
        var CodTipOra = $get('tbCodTipOra').value;
        var TipOra = $get('tbTipOra').value;
        var Argumente = new Array(Id, CodTipOra, TipOra);
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
            if(eventElement.target.id=='tbCodTipOra') {
                sepropaga = false;
                $get("tbTipOra").focus();

            }
            if (eventElement.target.id == 'tbTipOra') {
                sepropaga = false;
                $get("bOk").focus();

            }
            if (eventElement.target.id == 'tbFiltruCodTipOra')
                Lista('');
            if(eventElement.target.id=='tbFiltruTipOra')
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
                $get("tbCodTipOra").focus();
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
                $get("tbFiltruCodTipOra").focus();
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
