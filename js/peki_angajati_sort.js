$(document).load(function () {

    var table = $('#tRaportNumarAngajati');
    var rowToPrepend = table.find(".rNeselectat[title~='TESSITURA']").parent();
    table.find('tbody tr:nth-child(2)').after(rowToPrepend);
    rowToPrepend;

    var rowToPrepend1 = table.find(".rNeselectat[title~='CONFEZIONE']").parent();
    table.find('tbody tr:nth-child(3)').after(rowToPrepend1);
    rowToPrepend1;


    var rowToPrepend2 = table.find(".rNeselectat[title~='STIRO']").parent();
    table.find('tbody tr:nth-child(4)').after(rowToPrepend2);
    rowToPrepend2;

});