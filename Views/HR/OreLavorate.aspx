<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OreLavorate.aspx.cs" Inherits="Views_HR_OreLavorate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <%--<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=12.0, minimum-scale=.25, user-scalable=yes"/>--%>

    <script src="../../js/jquery-3.1.1.min.js"></script>
    <script src="../../js/printThis.js"></script>
    <script src="../../js/jspdf.min.js"></script>
    <script src="../../js/html2canvas.js"></script>
    
    
    <script src="../../js/jquery.maskedinput-1.3.js" ></script>
    <script src="../../js/draggablescroll.js" ></script>
    <title></title>
    
    <script type="text/javascript">
        $(function() {
            $("#DataGrid1  tr:first").find("th").addClass("tHeader");
            $("#DataGrid1  tr").eq(1).find("th").addClass("tTotal");
            $("#DataGrid1  tr").find("th").eq(0).css('min-width', '20px!important');

            var DepartamentWidth = $("#DataGrid1  tr:first").find("th").eq(0).width();
            var PostDelucruWidth = $("#DataGrid1  tr:first").find("th").eq(1).width();
            var total = (DepartamentWidth + PostDelucruWidth) * 1.08;
            $('#orelav').attr('style', 'min-width:' + total + 'px');
            var thead = 55 * 3;
            $('.td_cell').attr('style', 'min-width:' + thead + 'px');


            $("#DataGrid1  tr:first").find("th").eq(2).text("Ord.");
            $("#DataGrid1  tr:first").find("th").eq(3).text("Stra.");
            $("#DataGrid1  tr:first").find("th").eq(4).text("Tot.");

            $("#DataGrid1  tr:first").find("th").eq(5).text("Ord.");
            $("#DataGrid1  tr:first").find("th").eq(6).text("Stra.");
            $("#DataGrid1  tr:first").find("th").eq(7).text("Tot.");

            $("#DataGrid1  tr:first").find("th").eq(8).text("Ord.");
            $("#DataGrid1  tr:first").find("th").eq(9).text("Stra.");
            $("#DataGrid1  tr:first").find("th").eq(10).text("Tot.");

            $("#DataGrid1  tr:first").find("th").eq(11).text("Ord.");
            $("#DataGrid1  tr:first").find("th").eq(12).text("Stra.");
            $("#DataGrid1  tr:first").find("th").eq(13).text("Tot.");

            $("#DataGrid1  tr:first").find("th").eq(14).text("Ord.");
            $("#DataGrid1  tr:first").find("th").eq(15).text("Stra.");
            $("#DataGrid1  tr:first").find("th").eq(16).text("Tot.");

            $("#DataGrid1  tr:first").find("th").eq(17).text("Ord.");
            $("#DataGrid1  tr:first").find("th").eq(18).text("Stra.");
            $("#DataGrid1  tr:first").find("th").eq(19).text("Tot.");

            $("#DataGrid1  tr:first").find("th").eq(20).text("Ord.");
            $("#DataGrid1  tr:first").find("th").eq(21).text("Stra.");
            $("#DataGrid1  tr:first").find("th").eq(22).text("Tot.");

            $("#DataGrid1  tr:first").find("th").eq(23).text("Ord.");
            $("#DataGrid1  tr:first").find("th").eq(24).text("Stra.");
            $("#DataGrid1  tr:first").find("th").eq(25).text("Tot.");

            $("#DataGrid1  tr:first").find("th").eq(26).text("Ord.");
            $("#DataGrid1  tr:first").find("th").eq(27).text("Stra.");
            $("#DataGrid1  tr:first").find("th").eq(28).text("Tot.");

            $("#DataGrid1  tr:first").find("th").eq(29).text("Ord.");
            $("#DataGrid1  tr:first").find("th").eq(30).text("Stra.");
            $("#DataGrid1  tr:first").find("th").eq(31).text("Tot.");

            $("#DataGrid1  tr:first").find("th").eq(32).text("Ord.");
            $("#DataGrid1  tr:first").find("th").eq(33).text("Stra.");
            $("#DataGrid1  tr:first").find("th").eq(34).text("Tot.");

            $("#DataGrid1  tr:first").find("th").eq(35).text("Ord.");
            $("#DataGrid1  tr:first").find("th").eq(36).text("Stra.");
            $("#DataGrid1  tr:first").find("th").eq(37).text("Tot.");


            $('#DataGrid1 > tbody  > tr').each(function() {
                //Color Td -> START
                $(this).find("td").eq(2).css('background', '#dadada');
                $(this).find("td").eq(3).css('background', '#dadada');
                $(this).find("td").eq(4).css('background', '#dadada');

                $(this).find("td").eq(8).css('background', '#dadada');
                $(this).find("td").eq(9).css('background', '#dadada');
                $(this).find("td").eq(10).css('background', '#dadada');

                $(this).find("td").eq(14).css('background', '#dadada');
                $(this).find("td").eq(15).css('background', '#dadada');
                $(this).find("td").eq(16).css('background', '#dadada');

                $(this).find("td").eq(20).css('background', '#dadada');
                $(this).find("td").eq(21).css('background', '#dadada');
                $(this).find("td").eq(22).css('background', '#dadada');

                $(this).find("td").eq(26).css('background', '#dadada');
                $(this).find("td").eq(27).css('background', '#dadada');
                $(this).find("td").eq(28).css('background', '#dadada');

                $(this).find("td").eq(32).css('background', '#dadada');
                $(this).find("td").eq(33).css('background', '#dadada');
                $(this).find("td").eq(34).css('background', '#dadada');
                //Color Td -> END

                //Sum Main Totals -> START 4,10,16,22,28,34
                //JAN
                $("#DataGrid1  tr").eq(1).find('td').eq(4)
                    .text(parseFloat(parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(2).text()) +
                        parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(3).text())).toFixed(1));
                //FEB
                $("#DataGrid1  tr").eq(1).find('td').eq(7)
                    .text(parseFloat(parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(5).text()) +
                        parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(6).text())).toFixed(1));
                //MAR
                $("#DataGrid1  tr").eq(1).find('td').eq(10)
                    .text(parseFloat(parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(8).text()) +
                        parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(9).text())).toFixed(1));
                //APR
                $("#DataGrid1  tr").eq(1).find('td').eq(13)
                    .text(parseFloat(parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(12).text()) +
                        parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(11).text())).toFixed(1));
                //MAJ
                $("#DataGrid1  tr").eq(1).find('td').eq(16)
                    .text(parseFloat(parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(14).text()) +
                        parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(15).text())).toFixed(1));
                //JUN
                $("#DataGrid1  tr").eq(1).find('td').eq(19)
                    .text(parseFloat(parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(18).text()) +
                        parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(17).text())).toFixed(1));
                //JUL
                $("#DataGrid1  tr").eq(1).find('td').eq(22)
                    .text(parseFloat(parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(21).text()) +
                        parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(20).text())).toFixed(1));
                //AVG
                $("#DataGrid1  tr").eq(1).find('td').eq(25)
                    .text(parseFloat(parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(24).text()) +
                        parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(23).text())).toFixed(1));
                //SEP
                $("#DataGrid1  tr").eq(1).find('td').eq(28)
                    .text(parseFloat(parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(27).text()) +
                        parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(26).text())).toFixed(1));
                //OCT
                $("#DataGrid1  tr").eq(1).find('td').eq(31)
                    .text(parseFloat(parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(30).text()) +
                        parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(29).text())).toFixed(1));
                //NOV
                $("#DataGrid1  tr").eq(1).find('td').eq(34)
                    .text(parseFloat(parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(33).text()) +
                        parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(32).text())).toFixed(1));
                //DEC
                $("#DataGrid1  tr").eq(1).find('td').eq(37)
                    .text(parseFloat(parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(36).text()) +
                        parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(35).text())).toFixed(1));
                //Sum Main Totals -> END
            });

            //ADDING COL SUM
            //for (iq = 2; iq < 39; iq++) {
               // $('.totAmmin').find('td').eq(iq).addClass('colsum');
                //$('.totConfa').find('td').eq(iq).addClass('colsum');
                //$('.totConfb').find('td').eq(iq).addClass('colsum');
                //$('.totTess').find('td').eq(iq).addClass('colsum');
                //$('.totStiro').find('td').eq(iq).addClass('colsum');
           // }

            //ADDMING CLASS TO ROWS -> START
            var start = false;

            $("#DataGrid1  tr").filter(function(){
                if($(this).hasClass("totAmmin") || start) {
  
                    if($(this).hasClass("totConfa")){
                        start = false;
                        return true;
                    }
                    start = true;
                }
                return start;

            }).addClass("amminCell");
            //SUM START
            for (var index = 2; index < 39; index++) {

                var total = 0;
                $('.amminCell').each(function() {
                    total += +$('td', this).eq(index).text(); //+ will convert string to number
                });
                $('.totAmmin').find('td').eq(index).text(parseFloat(total).toFixed(1)); 
            }
            //SUM END


            var start = false;
            $("#DataGrid1  tr").filter(function(){
                if($(this).hasClass("totConfa") || start){
                    if($(this).hasClass("totConfb")){
                        start = false;
                        return true;
                    }
                    start = true;
                }
                return start;

            }).addClass("confaCell");
            //SUM START
            for (var index = 2; index < 39; index++) {

                var total = 0;
                $('.confaCell').each(function() {
                    total += +$('td', this).eq(index).text(); //+ will convert string to number
                });
                $('.totConfa').find('td').eq(index).text(parseFloat(total).toFixed(1)); 
            }
            //SUM END

            var start = false;
            $("#DataGrid1  tr").filter(function(){
                if($(this).hasClass("totConfb") || start){
                    if($(this).hasClass("totStiro")){
                        start = false;
                        return true;
                    }
                    start = true;
                }
                return start;

            }).addClass("confbCell");
            //SUM START
            for (var index = 2; index < 39; index++) {

                var total = 0;
                $('.confbCell').each(function() {
                    total += +$('td', this).eq(index).text(); //+ will convert string to number
                });
                $('.totConfb').find('td').eq(index).text(parseFloat(total).toFixed(1)); 
            }
            //SUM END



            var start = false;
            $("#DataGrid1  tr").filter(function(){
                if($(this).hasClass("totStiro") || start){
                    if($(this).hasClass("totTess")){
                        start = false;
                        return true;
                    }
                    start = true;
                }
                return start;

            }).addClass("stiroCell");
            //SUM START
            for (var index = 2; index < 39; index++) {

                var total = 0;
                $('.stiroCell').each(function() {
                    total += +$('td', this).eq(index).text(); //+ will convert string to number
                });
                $('.totStiro').find('td').eq(index).text(parseFloat(total).toFixed(1)); 
            }
            //SUM END



            //add last row class
            $("#DataGrid1  tr").last().addClass('last');
            var start = false;
            $("#DataGrid1  tr").filter(function(){
                if ($(this).hasClass("totTess") || start) {
                    

                    if ($(this).hasClass("last")) {
                        start = false;
                        return true;
                    }
                    start = true;
                }  
                return start;

            }).addClass("tessCell");
            //SUM START
            for (var index = 2; index < 39; index++) {

                var total = 0;
                $('.tessCell').each(function() {
                    total += +$('td', this).eq(index).text(); //+ will convert string to number
                });
                $('.totTess').find('td').eq(index).text(parseFloat(total).toFixed(1)); 
            }
            //SUM END


            $('.totAmmin').removeClass('amminCell');
            $('.totConfa').removeClass('amminCell confaCell'); 
            $('.totConfb').removeClass('confaCell confbCell'); 
            $('.totStiro').removeClass('confbCell stiroCell'); 
            $('.totTess').removeClass('tessCell stiroCell'); 
            $('.last').removeClass('last'); 
            //ADDMING CLASS TO ROWS -> END

             

            $('#DataGrid1 td').each(function() {

                if ($(this).text() == '0.0' || $(this).text() == 'NaN' ) {
                    $(this).text(' ');
                }
            });

            $('#DataGrid1 tr').eq(1).css('font-weight', '600');
 
            $('#DataGrid1 td').each(function() {
                $(this).text().replace(/\,/g, '.');
            });

        });

        

       function printExcel() {
 
    var tab_text = "<html><head><style type='text/css'></style></head><table border='1px'><h3 style='padding-left:10px'>Ore Lavorate</h3><tr class='tHeader'><td colspan='2' id='orelav'  > </td><td colspan='3' class='td_cell'>Gennaio</td><td colspan='3' class='td_cell'>Febbraio</td><td colspan='3' class='td_cell'>Marzo</td><td colspan='3' class='td_cell'>Aprile</td><td colspan='3' class='td_cell'>Maggio</td><td colspan='3' class='td_cell'>Giugno</td><td colspan='3' class='td_cell'>Luglio</td><td colspan='3' class='td_cell'>Agosto</td><td colspan='3' class='td_cell'>Settembre</td><td colspan='3' class='td_cell'>Ottobre</td><td colspan='3' class='td_cell'>Novembre</td><td colspan='3' class='td_cell'>Dicembre</td></tr><tr border='1px'>";
           var j = 0; 

    tab = document.getElementById('DataGrid1'); // id of table

    for (j = 0; j < tab.rows.length; j++) {
        tab_text = tab_text + tab.rows[j].innerHTML + "</tr></br></br>";
    }

    tab_text = tab_text + "</table></html>";
    tab_text = tab_text.replace(/<A[^>]*>|<\/A>/g, "");//remove if u want links in your table
    tab_text = tab_text.replace(/<img[^>]*>/gi, ""); // remove if u want images in your table
    tab_text = tab_text.replace(/<input[^>]*>|<\/input>/gi, ""); // reomves input params

    var ua = window.navigator.userAgent;
    var msie = ua.indexOf("MSIE ");

    if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./))      // If Internet Explorer
    {
        txtArea1.document.open("txt/html", "replace");
        txtArea1.document.write(tab_text);
        txtArea1.document.close();
        txtArea1.focus();
        sa = txtArea1.document.execCommand("SaveAs", true, "Say Thanks to Sumit.xls");
    }
    else                 //other browser not tested on IE 11
               sa = window.open('data:application/vnd.ms-excel,' + encodeURIComponent(tab_text)); 

    return (sa);
}

    function printData() { 
    $('#scroll').printThis({
        header: "<h1>Ore Lavorate</h1>",
        pageTitle: "",
        importCSS: true,
        ImportStyle: true,
        copyTagClasses: true,
        loadCSS: "Css/Absente-Giornaliero-Print.css"
    }); 
}
    </script>
    
    <link rel="stylesheet" type="text/css" href="../../css/AssenteismoMensilePerReparto.css"/>
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap-3.4.1.min.css"/>
    <style type="text/css">
        .top-icons:hover{
            cursor:pointer;
        }
        .tHeader {
            min-width:55px;
            width:55px;
        }
        .tDepartament {
            min-width:180px;
            font-weight:600;
        }
        .tPostDeLucru {
            min-width:200px;
        }
        .td_cell { 
            text-align:center;
            border-right:1px solid white;
            border-left:1px solid white;
        }

        .totAmmin, .totConfa, .totConfb, .totStiro, .totTess {
            border-top: 5px solid white;
            font-weight:600;
        }

        #scroll {
            display: block;
            overflow-x: auto;
            white-space: nowrap; 
            cursor: grab; 
            cursor: -o-grab; 
            cursor: -moz-grab; 
            cursor: -webkit-grab; 
        }
        
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        
        <div id="id_excel">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3">
                    <h3>Ore Lavorate </h3>
                </div>
                <div class="col-md-9">
                    <div align="right" style="margin-right:40px;margin-top:20px;">
                        <img class="top-icons" onclick="printExcel();" src="../../Images/newicons/excel.png" alt="Export to Excel" />
                        <img class="top-icons" onclick="printData();" src="../../Images/newicons/print.png" alt="Print" />
                    </div>
                </div>
            </div>
        </div>

        <div class="dragscroll" id="scroll">
            <table style="width:100%">
                <tr class="tHeader">
                    <td colspan="3" id="orelav" style="width:300px; "> </td>
                    <td colspan="3" class="td_cell">Gennaio</td>
                    <td colspan="3" class="td_cell">Febbraio</td>
                    <td colspan="3" class="td_cell">Marzo</td>
                    <td colspan="3" class="td_cell">Aprile</td>
                    <td colspan="3" class="td_cell">Maggio</td>
                    <td colspan="3" class="td_cell">Giugno</td>
                    <td colspan="3" class="td_cell">Luglio</td>
                    <td colspan="3" class="td_cell">Agosto</td>
                    <td colspan="3" class="td_cell">Settembre</td>
                    <td colspan="3" class="td_cell">Ottobre</td>
                    <td colspan="3" class="td_cell">Novembre</td>

                    <td colspan="3" class="td_cell">Dicembre</td>
                </tr>
            </table>
            <asp:GridView runat="server"  ID="DataGrid1" OnRowDataBound="DataGrid1_RowDataBound"  ></asp:GridView>
        </div>
        </div>
         
    </form>
</body>
</html>
