// PaginiRol.js
function PaginiRol_Lista()  
{
    $get('up').style.display = '';
    WbmOlimpias.PaginiRolWS.Lista($get('hfId').value, PaginiRol_SucceededCallback, PaginiRol_FailedCallback);
}
function PaginiRol_Proprietati()
{
    var Id = $get('PaginiRol_hfId').value;
    if (Id == '') {
        $get('PaginiRol_tbPagina').value = '';
        if ($get('hfId').value == '')
            $get('tbRol').focus();
        else
            $get('PaginiRol_tbPagina').focus();
        $get('PaginiRol_hfIdPagina').value = '';
        $get('PaginiRol_tbPagina').value = '';
        $get('PaginiRol_chbAdaugare').checked = false;
        $get('PaginiRol_chbModificare').checked = false;
        $get('PaginiRol_chbStergere').checked = false;
        $get('PaginiRol_chbAprobare').checked = false;
    }
    else {
        $get('up').style.display = '';
        WbmOlimpias.PaginiRolWS.Proprietati(Id, PaginiRol_SucceededCallback, PaginiRol_FailedCallback);
    }
}
function PaginiRol_Adaugare()
{
    $get('up').style.display = '';
    var oPaginaRol = new WbmOlimpias.PaginaRolObiect();
    oPaginaRol.IdRol = $get('hfId').value;
    var oPagina = new WbmOlimpias.PaginaObiect();
    oPagina.Id = $get('PaginiRol_hfIdPagina').value;
    oPaginaRol.oPagina = oPagina;
    oPaginaRol.DreptAdaugare = $get('PaginiRol_chbAdaugare').checked;
    oPaginaRol.DreptModificare = $get('PaginiRol_chbModificare').checked;
    oPaginaRol.DreptStergere = $get('PaginiRol_chbStergere').checked;
    oPaginaRol.DreptAprobare = $get('PaginiRol_chbAprobare').checked;
    WbmOlimpias.PaginiRolWS.Adaugare(oPaginaRol, PaginiRol_SucceededCallback, PaginiRol_FailedCallback);
}
function PaginiRol_Modificare()
{
    $get('up').style.display = '';
    var oPaginaRol = new WbmOlimpias.PaginaRolObiect();
    oPaginaRol.Id = $get('PaginiRol_hfId').value;
    oPaginaRol.IdRol = $get('hfId').value;
    var oPagina = new WbmOlimpias.PaginaObiect();
    oPagina.Id = $get('PaginiRol_hfIdPagina').value;
    oPaginaRol.oPagina = oPagina;
    oPaginaRol.DreptAdaugare = $get('PaginiRol_chbAdaugare').checked;
    oPaginaRol.DreptModificare = $get('PaginiRol_chbModificare').checked;
    oPaginaRol.DreptStergere = $get('PaginiRol_chbStergere').checked;
    oPaginaRol.DreptAprobare = $get('PaginiRol_chbAprobare').checked;
    WbmOlimpias.PaginiRolWS.Modificare(oPaginaRol, PaginiRol_SucceededCallback, PaginiRol_FailedCallback);
}
function PaginiRol_Stergere()
{
    if(confirm('Stergem randul selectat?'))
    {
        $get('up').style.display = '';
        WbmOlimpias.PaginiRolWS.Stergere($get('PaginiRol_hfId').value, PaginiRol_SucceededCallback, PaginiRol_FailedCallback);
    }
}
function PaginiRol_Pagina()
{
    $get('up').style.display = '';
    WbmOlimpias.PaginiRolWS.PaginaCautare($get('PaginiRol_tbPagina').value, PaginiRol_SucceededCallback, PaginiRol_FailedCallback);
}
function PaginiRol_SucceededCallback(result, userContext, methodName)
{ 
    $get('up').style.display = 'none';
    switch(methodName)
    { 
        case ('Lista'):
        {
            var mytable=$get('PaginiRol_tPagini');
            while(mytable.rows.length>1)
            {
                mytable.deleteRow(1);
            }
            var i = 0;
            for(var item in result.Tabela)
            {    
                var newrow=mytable.insertRow(-1);
                newrow.id = i.toString();
                newrow.onclick = PaginiRol_RowClick;
                var newcell=newrow.insertCell(-1);
                newcell.id = 'PaginiRol_Pagina_' + i.toString();
                newcell.className = 'neselectat';
                newcell.innerHTML = result.Tabela[item].oPagina.Pagina;
                newcell.title = result.Tabela[item].oPagina.Pagina;
                newcell=newrow.insertCell(-1);
                newcell.id = 'PaginiRol_Id_' + i.toString();
                newcell.className = 'neselectat';
                newcell.title = result.Tabela[item].Id;
                i++;
            }
            if(i==0)
                PaginiRol_SchimbareRand('');
            else
                PaginiRol_SchimbareRand('0');
            break;
        }
        case ('Proprietati'):
        {
            $get('PaginiRol_tbPagina').value = result.oPagina.Pagina;
            $get('PaginiRol_hfIdPagina').value = result.oPagina.Id;
            $get('PaginiRol_chbAdaugare').checked = result.DreptAdaugare;
            $get('PaginiRol_chbModificare').checked = result.DreptModificare;
            $get('PaginiRol_chbStergere').checked = result.DreptStergere;
            $get('PaginiRol_chbAprobare').checked = result.DreptAprobare;
            $get('tbFiltruRol').focus();
            break;
        }
        case ('Adaugare'):
        {
            if(result.Eroare=='')
                PaginiRol_Lista();
            else
                window.alert(result.Eroare);
            break;
        }
        case ('Modificare'):
        {
            if(result.Eroare=='')
                PaginiRol_Lista();
            else
                window.alert(result.Eroare);
            break;
        }
        case ('Stergere'):
        {
            if(result=='')
                PaginiRol_Lista();
            else
                window.alert(result.Eroare);
            break;
        }
        case ('PaginaCautare'):
        {
            if(result.Id!='')
            {
                $get('PaginiRol_hfIdPagina').value = result.Id;
                $get('PaginiRol_tbPagina').value = result.Pagina;
                $get('PaginiRol_bOk').focus();
            }
            else
                PaginiRol_bPagina_Click();
            break;
        }
        default:
        {
            window.alert('Serviciu inexistent!');
        }
    }            
}
function PaginiRol_FailedCallback(error, userContext, methodName) 
{
    $get('up').style.display = 'none';
    if(error !== null) 
    {
        window.alert(error.get_message());
    }
}

function PaginiRol_SchimbareRand(RowIndex)
{
    if($get("PaginiRol_hfRowIndex").value=='')
    {
        if(RowIndex!='')
        {
            $get("PaginiRol_hfRowIndex").value = RowIndex;
            $get("PaginiRol_hfId").value = $get("PaginiRol_Id_" + RowIndex).title;
            PaginiRol_RowSelect();
        }
    }
    else
    {
        PaginiRol_RowUnselect();
        if(RowIndex=='')
        {
            $get("PaginiRol_hfRowIndex").value = '';
            $get("PaginiRol_hfId").value = '';
        }
        else
        {
            $get("PaginiRol_hfRowIndex").value = RowIndex;
            $get("PaginiRol_hfId").value = $get("PaginiRol_Id_" + RowIndex).title;
            PaginiRol_RowSelect();
        }
    }
    PaginiRol_Proprietati();
}
function PaginiRol_RowSelect()
{
    $get('PaginiRol_Pagina_' + $get('PaginiRol_hfRowIndex').value).className = 'selectat';
}
function PaginiRol_RowUnselect()
{
    var obiect = $get('PaginiRol_Pagina_' + $get('PaginiRol_hfRowIndex').value);
    if(obiect!=null)
        obiect.className = 'neselectat';
}
function PaginiRol_RowClick()
{
    PaginiRol_SchimbareRand(this.id);
}
function PaginiRol_bPagina_Click()
{
    var rezultat = window.showModalDialog('Pagini.aspx', window, 'center:yes;resizable:no;dialogHeight:290px;dialogWidth:545px;');
    if (rezultat != null)
    {
        $get('PaginiRol_hfIdPagina').value = rezultat[0].toString();
        $get('PaginiRol_tbPagina').value = rezultat[1].toString();
        $get('PaginiRol_bOk').focus();
    }
}
function PaginiRol_bOk_Click()
{
    if($get("PaginiRol_hfId").value=='')
        PaginiRol_Adaugare();
    else
        PaginiRol_Modificare();
}
function PaginiRol_bAdaugare_Click()
{
    PaginiRol_SchimbareRand('');
    PaginiRol_Proprietati();
}
function PaginiRol_bStergere_Click()
{
    PaginiRol_Stergere();
}
if (typeof(Sys) !== 'undefined') Sys.Application.notifyScriptLoaded();