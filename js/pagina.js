function SchimbareRand(RowIndex)
{
    if($get("hfRowIndex").value=='')
    {
        if(RowIndex!='')
        {
            $get("hfRowIndex").value = RowIndex;
            $get("hfId").value = $get("Id_" + RowIndex).title;
            RowSelect();
        }
    }
    else
    {
        RowUnselect();
        if(RowIndex=='')
        {
            $get("hfRowIndex").value = '';
            $get("hfId").value = '';
        }
        else
        {
            $get("hfRowIndex").value = RowIndex;
            $get("hfId").value = $get("Id_" + RowIndex).title;
            RowSelect();
        }
    }
    Proprietati();
}
function RowPrevious()
{
    var RowIndex = $get("hfRowIndex").value;
    if(RowIndex=='')
        RowIndex = 0;
    else
        RowIndex--;
    if($get(RowIndex.toString())==null)
        bAnterior_Click();
    else
        SchimbareRand(RowIndex.toString());
}
function RowNext()
{
    var RowIndex = $get("hfRowIndex").value;
    if(RowIndex=='')
        RowIndex = 0;
    else
        RowIndex++;
    if($get(RowIndex.toString())==null)
        bUrmator_Click();
    else
        SchimbareRand(RowIndex.toString());
}
function RowClick() {
    SchimbareRand(this.id);
}
function bAdaugare_Click()
{
    SchimbareRand('');
}
function bValidare_Click()
{
    Validare();
}
function bStergere_Click()
{
    Stergere();
}
function bGolire_Click()
{
    Golire();
}
function bPrima_Click()
{
    var PaginaCurenta = 1;
    $get("tbPaginaCurenta").value = PaginaCurenta;
    Lista('');
}
function bUrmator_Click()
{
    var PaginaCurenta = 0;
    PaginaCurenta = $get("tbPaginaCurenta").value;
    PaginaCurenta++;
    $get("tbPaginaCurenta").value = PaginaCurenta;
    Lista('');
}
function bAnterior_Click()
{
    var PaginaCurenta = 0;
    PaginaCurenta = $get("tbPaginaCurenta").value;
    PaginaCurenta--;
    $get("tbPaginaCurenta").value = PaginaCurenta;
    Lista('');
}
function bOk_Click()
{
    if($get("hfId").value=='')
        Adaugare();
    else
        Modificare();
}
function bCancel_Click()
{
    Lista('');
}
function bUltima_Click()
{
    var PaginaCurenta = 0;
    PaginaCurenta = $get("tbNumarPagini").value;
    $get("tbPaginaCurenta").value = PaginaCurenta;
    Lista('');
}