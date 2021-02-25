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

      
        $(function () {

            

            $("#DataGrid1  tr:first").find("th").addClass("tHeader");

            $("#DataGrid2  tr:first").find("th").addClass("tHeader");

            $("#DataGrid1  tr").eq(1).find("th").addClass("tTotal");

            $("#DataGrid2  tr").eq(1).find("th").addClass("tTotal");

            $("#DataGrid1  tr").find("th").eq(0).css('min-width', '20px!important');

            $("#DataGrid2  tr").find("th").eq(0).css('min-width', '20px!important');

           

            var DepartamentWidth = $("#DataGrid1  tr:first").find("th").eq(0).width();
            var PostDelucruWidth = $("#DataGrid1  tr:first").find("th").eq(1).width();
            var total = (DepartamentWidth + PostDelucruWidth)*1.02;
            $('#orelav').attr('style', 'min-width:' + total + 'px');
            
            var thead = 60*4;
            $('.td_cell').attr('style', 'min-width:' + thead + 'px');
            
            $("#DataGrid1  tr:first").find("th").eq(3).text("Lav.");
            $("#DataGrid1  tr:first").find("th").eq(4).text("Ord.");
            $("#DataGrid1  tr:first").find("th").eq(5).text("Stra.");
            $("#DataGrid1  tr:first").find("th").eq(6).text("Tot.");

            $("#DataGrid1  tr:first").find("th").eq(7).text("Lav.");
            $("#DataGrid1  tr:first").find("th").eq(8).text("Ord.");
            $("#DataGrid1  tr:first").find("th").eq(9).text("Stra.");
            $("#DataGrid1  tr:first").find("th").eq(10).text("Tot.");

            $("#DataGrid1  tr:first").find("th").eq(11).text("Lav.");
            $("#DataGrid1  tr:first").find("th").eq(12).text("Ord.");
            $("#DataGrid1  tr:first").find("th").eq(13).text("Stra.");
            $("#DataGrid1  tr:first").find("th").eq(14).text("Tot.");

            $("#DataGrid1  tr:first").find("th").eq(15).text("Lav.");
            $("#DataGrid1  tr:first").find("th").eq(16).text("Ord.");
            $("#DataGrid1  tr:first").find("th").eq(17).text("Stra.");
            $("#DataGrid1  tr:first").find("th").eq(18).text("Tot.");

            $("#DataGrid1  tr:first").find("th").eq(19).text("Lav.");
            $("#DataGrid1  tr:first").find("th").eq(20).text("Ord.");
            $("#DataGrid1  tr:first").find("th").eq(21).text("Stra.");
            $("#DataGrid1  tr:first").find("th").eq(22).text("Tot.");

            $("#DataGrid1  tr:first").find("th").eq(23).text("Lav.");
            $("#DataGrid1  tr:first").find("th").eq(24).text("Ord.");
            $("#DataGrid1  tr:first").find("th").eq(25).text("Stra.");
            $("#DataGrid1  tr:first").find("th").eq(26).text("Tot.");

            $("#DataGrid1  tr:first").find("th").eq(27).text("Lav.");
            $("#DataGrid1  tr:first").find("th").eq(28).text("Ord.");
            $("#DataGrid1  tr:first").find("th").eq(29).text("Stra.");
            $("#DataGrid1  tr:first").find("th").eq(30).text("Tot.");
        
            $("#DataGrid1  tr:first").find("th").eq(31).text("Lav.");
            $("#DataGrid1  tr:first").find("th").eq(32).text("Ord.");
            $("#DataGrid1  tr:first").find("th").eq(33).text("Stra.");
            $("#DataGrid1  tr:first").find("th").eq(34).text("Tot.");

            $("#DataGrid1  tr:first").find("th").eq(35).text("Lav.");
            $("#DataGrid1  tr:first").find("th").eq(36).text("Ord.");
            $("#DataGrid1  tr:first").find("th").eq(37).text("Stra.");
            $("#DataGrid1  tr:first").find("th").eq(38).text("Tot.");

            $("#DataGrid1  tr:first").find("th").eq(39).text("Lav.");
            $("#DataGrid1  tr:first").find("th").eq(40).text("Ord.");
            $("#DataGrid1  tr:first").find("th").eq(41).text("Stra.");
            $("#DataGrid1  tr:first").find("th").eq(42).text("Tot.");

            $("#DataGrid1  tr:first").find("th").eq(43).text("Lav.");
            $("#DataGrid1  tr:first").find("th").eq(44).text("Ord.");
            $("#DataGrid1  tr:first").find("th").eq(45).text("Stra.");
            $("#DataGrid1  tr:first").find("th").eq(46).text("Tot.");

            $("#DataGrid1  tr:first").find("th").eq(47).text("Lav.");
            $("#DataGrid1  tr:first").find("th").eq(48).text("Ord.");
            $("#DataGrid1  tr:first").find("th").eq(49).text("Stra.");
            $("#DataGrid1  tr:first").find("th").eq(50).text("Tot.");

           
            //$('#DataGrid1 > tbody > tr').each(function () {
            //    $(this).find("td").eq(0).css('position', 'absolute');
            //    $(this).find("td").eq(1).css('position', 'absolute');
            //});

            $('#DataGrid1 > tbody  > tr').each(function() {
                //Color Td -> START
                //jan
                $(this).find("td").eq(3).css('background', '#dadada');
                $(this).find("td").eq(4).css('background', '#dadada');
                $(this).find("td").eq(5).css('background', '#dadada');
                $(this).find("td").eq(6).css('background', '#dadada');

                //mart
                $(this).find("td").eq(11).css('background', '#dadada');
                $(this).find("td").eq(12).css('background', '#dadada');
                $(this).find("td").eq(13).css('background', '#dadada');
                $(this).find("td").eq(14).css('background', '#dadada');

                //mai
                $(this).find("td").eq(19).css('background', '#dadada');
                $(this).find("td").eq(20).css('background', '#dadada');
                $(this).find("td").eq(21).css('background', '#dadada');
                $(this).find("td").eq(22).css('background', '#dadada');

                //iul
                $(this).find("td").eq(27).css('background', '#dadada');
                $(this).find("td").eq(28).css('background', '#dadada');
                $(this).find("td").eq(29).css('background', '#dadada');
                $(this).find("td").eq(30).css('background', '#dadada');

                //sept
                $(this).find("td").eq(35).css('background', '#dadada');
                $(this).find("td").eq(36).css('background', '#dadada');
                $(this).find("td").eq(37).css('background', '#dadada');
                $(this).find("td").eq(38).css('background', '#dadada');

                //noi
                $(this).find("td").eq(43).css('background', '#dadada');
                $(this).find("td").eq(44).css('background', '#dadada');
                $(this).find("td").eq(45).css('background', '#dadada');
                $(this).find("td").eq(46).css('background', '#dadada');
                $(this).find("td").eq(51).css('background', '#dadada');
                //Color Td -> END

                
                //Sum Main Totals -> START 6,10,18,22,26,32,36,40,44,48,52
                //JAN
                $("#DataGrid1  tr").eq(1).find('td').eq(6)
                    .text(parseFloat(parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(4).text()) +
                        parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(5).text())).toFixed(1));
                //FEB
                $("#DataGrid1  tr").eq(1).find('td').eq(10)
                    .text(parseFloat(parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(8).text()) +
                        parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(9).text())).toFixed(1));
                //MAR
                $("#DataGrid1  tr").eq(1).find('td').eq(14)
                    .text(parseFloat(parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(12).text()) +
                        parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(13).text())).toFixed(1));
                //APR
                $("#DataGrid1  tr").eq(1).find('td').eq(18)
                    .text(parseFloat(parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(16).text()) +
                        parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(17).text())).toFixed(1));
                //MAJ
                $("#DataGrid1  tr").eq(1).find('td').eq(22)
                    .text(parseFloat(parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(20).text()) +
                        parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(21).text())).toFixed(1));
                //JUN
                $("#DataGrid1  tr").eq(1).find('td').eq(26)
                    .text(parseFloat(parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(24).text()) +
                        parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(25).text())).toFixed(1));
                //JUL
                $("#DataGrid1  tr").eq(1).find('td').eq(30)
                    .text(parseFloat(parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(28).text()) +
                        parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(29).text())).toFixed(1));
                //AVG
                $("#DataGrid1  tr").eq(1).find('td').eq(34)
                    .text(parseFloat(parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(32).text()) +
                        parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(33).text())).toFixed(1));
                //SEP
                $("#DataGrid1  tr").eq(1).find('td').eq(38)
                    .text(parseFloat(parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(36).text()) +
                        parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(37).text())).toFixed(1));
                //OCT
                $("#DataGrid1  tr").eq(1).find('td').eq(42)
                    .text(parseFloat(parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(40).text()) +
                        parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(41).text())).toFixed(1));
                //NOV
                $("#DataGrid1  tr").eq(1).find('td').eq(46)
                    .text(parseFloat(parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(44).text()) +
                        parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(45).text())).toFixed(1));
                //DEC
                $("#DataGrid1  tr").eq(1).find('td').eq(50)
                    .text(parseFloat(parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(48).text()) +
                        parseFloat($("#DataGrid1  tr").eq(1).find('td').eq(49).text())).toFixed(1));
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
            for (var index = 3; index < 53; index++) {

                var total = 0;
                $('.amminCell').each(function () {
                     total += +$('td', this).eq(index).text();  //+ will convert string to number
                });
                $('.totAmmin').find('td').eq(index).text(parseFloat(total).toFixed(1)); 
            }
            //SUM END


            var start = false;
            $("#DataGrid1  tr").filter(function(){
                if($(this).hasClass("totConfa") || start){

                    if ($(this).hasClass("totConfb")) {
                        start = false;
                        return true;
                    }
                    start = true;
                }
                return start;

            }).addClass("confaCell");
            //SUM START
            for (var index = 3; index < 53; index++) {

                var total = 0;
                $('.confaCell').each(function () {
                   
                    total += +$('td', this).eq(index).text(); //+ will convert string to number
                });
                $('.totConfa').find('td').eq(index).text(parseFloat(total).toFixed(1)); 
            }
            //SUM END

           

            var start = false;
            $("#DataGrid1  tr").filter(function () {
                if ($(this).hasClass("totConfb") || start) {
                    if ($(this).hasClass("totSarto")) {
                        start = false;
                        return true;
                    }
                    start = true;
                }
                return start;

            }).addClass("confbCell");
            //SUM START
            for (var index = 3; index < 53; index++) {

                var total = 0;
                $('.confbCell').each(function() {
                     total += +$('td', this).eq(index).text(); //+ will convert string to number
                });
                $('.totConfb').find('td').eq(index).text(parseFloat(total).toFixed(1)); 
            }
            //SUM END

            var start = false;
            $("#DataGrid1  tr").filter(function () {
                if ($(this).hasClass("totSarto") || start) {

                    if ($(this).hasClass("totStiro")) {
                        start = false;
                        return true;
                    }
                    start = true;
                }
                return start;

            }).addClass("sartoCell");
            //SUM START
            for (var index = 3; index < 53; index++) {

                var total = 0;
                $('.sartoCell').each(function () {
                    total += +$('td', this).eq(index).text(); //+ will convert string to number
                });
                $('.totSarto').find('td').eq(index).text(parseFloat(total).toFixed(1));
            }

            var start = false;
            $("#DataGrid1  tr").filter(function(){
                if($(this).hasClass("totStiro") || start){

                    if ($(this).hasClass("totTess")) {
                        start = false;
                        return true;
                    }
                    start = true;
                }
                return start;

            }).addClass("stiroCell");
            //SUM START
            for (var index = 3; index < 53; index++) {

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
            for (var index = 3; index < 53; index++) {

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
            $('.totSarto').removeClass('confbCell sartoCell')
            $('.totStiro').removeClass('sartoCell stiroCell'); 
            $('.totTess').removeClass('tessCell stiroCell'); 
            $('.last').removeClass('last'); 
            //ADDMING CLASS TO ROWS -> END

             

            $('#DataGrid1 td').each(function() {

                if ($(this).text() == '0.0' || $(this).text() == 'NaN' ) {
                    $(this).text(' ');
                }
            });

            $('#DataGrid1 tr').eq(1).css('font-weight', '600');
            $('#DataGrid2 tr').eq(1).css('font-weight', '600');
            $('#DataGrid1 td').each(function() {
                $(this).text().replace(/\,/g, '.');
            });
            $('#DataGrid2 td').each(function () {
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
        table {
            border-style:none;
           
        }
       
        .top-icons:hover{
            cursor:pointer;
        }
        
        .tHeader {
              border: 1px solid #ffffff;
              color: black;
              background: #FFC107 !important;
              font-weight: 600;
              font-size: 12pt;
              padding: 1px;
              min-width: 60px;
              max-width: 60px;
              text-align: center;
              text-transform: uppercase;
              height:25px;
        }
        .tDepartament {
            min-width:180px;
            font-weight:600;
        }
        .tPostDeLucru {
            min-width:210px;
        }
        .tPostDeLucru1 {
            min-width:209px;
        }
      
        .td_cell { 
            text-align:center;
            border:1px solid white;
        }

        .totAmmin, .totConfa, .totConfb, .totStiro, .totTess, .totSarto {
            border-top: 5px solid white;
            font-weight:600;
        }
        
        #DataGrid2
        {
            position:absolute;
            top:82px;
            left: 0px;
        }
       
        #DataGrid2 td {
            font-size: 10pt;
            border: 1px solid white !important;
            background: #e8e8e8;
            padding:0px;
        }
        
        .filtru{
            font-weight:600;
            font-size:12pt;
            text-decoration-color:black;
            width:390px;
            margin-bottom:-25px;
            margin-left:-15px;
            z-index:1;
            height:24px;
            background:#FFC107 !important;
            border:1px solid white !important;
        }
       
        #lFiltruAn{
            padding-left:5px;
        }
        #ddlFiltruAn
        {
            height:22px;
        }
      

       #scroll {
            display: block;
            overflow-x:auto;
            cursor: grab; 
            cursor: -o-grab; 
            cursor: -moz-grab; 
            cursor: -webkit-grab; 
        }
        
     .direct{
        border: 1px solid #ffffff;
        color: black;
        font-size: 12pt;
        padding: 0px;
        min-width: 80px;
        max-width: 80px;
        text-align: center;
        text-transform: uppercase;
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
                    <table cellpadding="0" cellspacing="0" class="filtru">
                        <tr>
                            <td >
                        <asp:Label ID="lFiltruAn" runat="server" CssClass="continut" Text="ANNO"></asp:Label>
                            </td>
                        <td>
                        <asp:DropDownList ID="ddlFiltruAn" runat="server" OnSelectedIndexChanged="ddlFiltruAn_SelectedIndexChanged" AutoPostBack="true">
                            <asp:ListItem>2021</asp:ListItem>
                            <asp:ListItem>2020</asp:ListItem>
                        </asp:DropDownList>
                        </td>  
                        </tr>
                        
                    </table>
                </div>
                <div class="col-md-9">
                    <div align="right" style="margin-right:40px;margin-top:20px;">
                        <img class="top-icons" onclick="printExcel();" src="../../Images/newicons/excel.png" alt="Export to Excel" />
                        <img class="top-icons" onclick="printData();" src="../../Images/newicons/print.png" alt="Print" />
                    </div>
                </div>
            </div>
        </div>
            
        <div class="dragscroll" id="scroll"  >

            <table style="width:100%;" runat="server">
                <tr class="tHeader">
                    <td id="orelav">
                        
                    </td>
                    <td class="direct"></td>
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
                    <td colspan="3" class="tHeader"></td>
                    <td colspan="3" class="tHeader"></td>
                </tr>
                
                
            </table>
           
          <asp:GridView runat="server" ID="DataGrid1" OnRowDataBound="DataGrid1_RowDataBound" CssClass="pinned" ></asp:GridView>
          
          <asp:GridView runat="server" ID="DataGrid2" OnRowDataBound="DataGrid2_RowDataBound" ></asp:GridView>
                
        </div>
        </div>
    </form>
</body>
</html>
