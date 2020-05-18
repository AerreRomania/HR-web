<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AssenteismoMensilePerReparto.aspx.cs" Inherits="Views_HR_AssenteismoMensilePerReparto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=12.0, minimum-scale=.25, user-scalable=yes"/>

    <title></title>
    <script src="../../js/jquery-3.1.1.min.js"></script>
    <script src="../../js/printThis.js"></script>
    <script src="../../js/jspdf.min.js"></script>
    <script src="../../js/html2canvas.js"></script>
       
    <script type="text/javascript">
        $(function() {
            $("#DataGrid1  tr:first").find("td").addClass("tHeader");
            $("#DataGrid1  tr").eq(1).find("td").addClass("tTotal");
            $("#DataGrid1  tr").find("td").eq(0).css('min-width', '20px!important');
            $("#DataGrid1  tr:first").find("td").eq(6).text("Gennaio");
            $("#DataGrid1  tr:first").find("td").eq(7).text("Febbraio");
            $("#DataGrid1  tr:first").find("td").eq(8).text("Marzo");
            $("#DataGrid1  tr:first").find("td").eq(9).text("Aprile");
            $("#DataGrid1  tr:first").find("td").eq(10).text("Maggio");
            $("#DataGrid1  tr:first").find("td").eq(11).text("Giugno");
            $("#DataGrid1  tr:first").find("td").eq(12).text("Luglio");
            $("#DataGrid1  tr:first").find("td").eq(13).text("Agosto");
            $("#DataGrid1  tr:first").find("td").eq(14).text("Settembre");
            $("#DataGrid1  tr:first").find("td").eq(15).text("Ottobre");
            $("#DataGrid1  tr:first").find("td").eq(16).text("Novembre");
            $("#DataGrid1  tr:first").find("td").eq(17).text("Dicembre");

            $('#DataGrid1 tr').hover(function() {
                    $(this).addClass('hover');
                },
                function() {
                    $(this).removeClass('hover');
                });


            $(".search").keyup(function () {
                var searchTerm = $(".search").val();
                var listItem = $('#DataGrid1 tbody').children('tr');
                var searchSplit = searchTerm.replace(/ /g, "'):containsi('");
                $.extend($.expr[':'], {
                    'containsi': function (elem, i, match, array) {
                        return (elem.textContent || elem.innerText || '').toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
                    }
                });
 
                $("#DataGrid1 tbody tr").not(':first').not(":containsi('" + searchSplit + "')").each(function (e) {
                    $(this).hide();
                });

                $("#DataGrid1 tbody tr:containsi('" + searchSplit + "')").each(function (e) {
                    $(this).show();
                });
            });


            $('#DataGrid1 tr').each(function () {
                var row = $(this);
                var rowTotal = 0;
                $(this).find('td').eq(18).each(function () {
                    var th = $(this);
                    if ($.isNumeric(th.text())) {
                        rowTotal += parseFloat(th.text());
                    }
                });
                row.find('td').eq(19).text(parseFloat(rowTotal / 8).toFixed(1));
            });
            $('#DataGrid1 tr:first').find('td').eq(19).text('DAYS');


            var counter=0;
               for (i = 5; i < 17; i++) {
                   if ($('#DataGrid1 tr').eq(1).find('td').eq(i).text() !== ' ') {
                       counter++;
                   }
               }

               $('#DataGrid1 tr').each(function () {
                   var row = $(this);
                   var rowTotal = 0;
                   $(this).find('td').eq(19).each(function () {
                       var th = $(this);
                       if ($.isNumeric(th.text())) {
                           rowTotal += parseFloat(th.text());
                       }
                   });
                   row.find('td').eq(20).text(parseFloat(rowTotal / counter).toFixed(1));
               });

               $('#DataGrid1 tr:first').find('td').eq(20).text('MEDIA');


               console.log(counter);

        });

        //Print
        function printData() {

            $('#DataGrid1').printThis({
                header: "<h1>Assenteismo Mensile Departament - " + $('#lblDep').text() + "</h1>",
                pageTitle: "",
                importCSS: true,
                ImportStyle: true,
                copyTagClasses: true,
                loadCSS: "../../css/AssenteismoMensilePerReparto.css"
            });
        }
        //PDF
        function printPDF() {
            var pdf = new jsPDF('l', 'mm', [1400, 1920], false);
            html2canvas($("#DataGrid1")[0], {
                onrendered: function (canvas) {
                    document.body.appendChild(canvas);
                    var ctx = canvas.getContext('2d');
                    var imgData = canvas.toDataURL("image/png", 1.0);
                    pdf.addImage(imgData, 'PNG', 20, 20, $("#DataGrid1").width() * 0.75, $("#DataGrid1").height() * 0.75);
                    canvas.remove();
                }
            });
            setTimeout(function () {
                pdf.save('Assenteismo Mensile Departament - ' + $('#lblDep').text() + '.pdf');
            }, 0);
        }
        //Excel
        function printExcel() {

            myTable = document.getElementById('DataGrid1');
            myClone = myTable.cloneNode(true); 
            document.body.appendChild(myClone); 
            var tab_text = "<html><head><style type='text/css'> * {font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif}.tHeader {min-width: 50px;border: 2px solid #ffffff;color: black;background: #FFC107!important;font-weight: 600;font - size: 12pt;text-align: left;padding-left: 5px;padding-right: 5px;text-transform: uppercase;}.tTotal {background: white!important;font-weight: 600;}#DataGrid1 td {font-size: 10pt;border: 1px solid white!important;background: #e8e8e8;padding-left: 3px;padding-right: 3px;}</style></head><h4>Assenteismo Mensile Departament - " + $('#lblDep').text() + " </h4><table border='1px'><tr border='1px'>";
            var j = 0; 

            for (j = 0; j < myClone.rows.length; j++) { 

                for (i = 0; i < myClone.rows[j].cells.length; i++) {

                    myClone.rows[0].cells.item(i).style.background = "#FFC107";
                    myClone.rows[0].cells.item(i).style.textAlign = "center";
                    myClone.rows[0].cells.item(i).style.border = "1px solid #ffffff";

                    myClone.rows[1].cells.item(i).style.background = "#d0d0d0";
                    myClone.rows[1].cells.item(i).style.textAlign = "center";
                    myClone.rows[1].cells.item(i).style.border = "1px solid #ffffff";

                    myClone.rows[j].cells.item(myClone.rows[j].cells.length - 1).style.background = "#e8e8e8";
                    myClone.rows[j].cells.item(myClone.rows[j].cells.length - 1).style.textAlign = "center";
                    myClone.rows[j].cells.item(myClone.rows[j].cells.length - 1).style.border = "1px solid #ffffff";
                }

                tab_text = tab_text + myClone.rows[j].innerHTML + "</tr></br></br>";
            }

            tab_text = tab_text + "</table></html>";
            tab_text = tab_text.replace(/<A[^>]*>|<\/A>/g, "");
            tab_text = tab_text.replace(/<img[^>]*>/gi, "");
            tab_text = tab_text.replace(/<input[^>]*>|<\/input>/gi, "");

            var ua = window.navigator.userAgent;
            var msie = ua.indexOf("MSIE ");

            if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./)) {
                txtArea1.document.open("txt/html", "replace");
                txtArea1.document.write(tab_text);
                txtArea1.document.close();
                txtArea1.focus();
                sa = txtArea1.document.execCommand("SaveAs", true, "Say Thanks to Sumit.xls");
            }
            else
                sa = window.open('data:application/vnd.ms-excel,' + encodeURIComponent(tab_text));

            myClone.remove();
            return (sa);
        }

    </script>
   

     <link rel="stylesheet" type="text/css" href="../../css/AssenteismoMensilePerReparto.css"/>
     <link rel="stylesheet" type="text/css" href="../../css/bootstrap-3.4.1.min.css"/>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
        <div class="row">
            <div class="col-md-2" style="padding-top: 15px;">
                <input type="text" class="search form-control col-xs-4 col-lg-2" placeholder="Search:" /> 
            </div>
            <div class="col-md-6">
                <h3 align="center">Assenteismo Mensile - <asp:Label runat="server" ID="lblDep"></asp:Label></h3>
            </div>
            <div class="col-md-2" style="text-align: right;float: right;padding: 15px;">
                <img class="top-icons" onclick="printExcel();" src="../../Images/newicons/excel.png" alt="Export to Excel" />
                <img class="top-icons"  style="padding-left:10px;" onclick="printData();" src="../../Images/newicons/print.png" alt="Print" />
            </div>
        </div>

            <div class="row">
                <div class="col-md-12">
            <asp:DataGrid runat="server" ID="DataGrid1" ></asp:DataGrid>
                </div>
        </div>
        
        </div>
    </form>
</body>
</html>
