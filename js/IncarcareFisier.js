function bIncarca_Click() {
    $get('up').style.display = '';
    $get('fIncarcareFisier').submit();
}
function IncarcareCompleta(Id, Fisier) {
    $get('up').style.display = 'none';
    var Argumente = new Array(Id, Fisier);
    window.returnValue = Argumente;
    close();
}
function IncarcareCuEroare(Eroare) {
    $get('up').style.display = 'none';
    window.alert(Eroare);
}
function pageLoad() 
{
    $get('fuFisier').focus();
} 
